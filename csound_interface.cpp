#include "csound_interface.h"
#include "parse_svg.h"

#include <csound/csound.hpp>
#include <csound/csPerfThread.hpp>

#include <mtdev.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#include <sstream>
#include <iostream>

#include <map>

using namespace std;
using namespace TouchPolygon;

map<string, unsigned> note_to_key_map;
atomic<bool> player_running;

const size_t NUM_CHANNELS = 32;
bool channel_open[NUM_CHANNELS];

class TouchEvent {
public:
    TouchEvent(): _x(-1.0), _y(-1.0), _waiting(false), _ready(false) { }
    
    void activate()
    {
        _x = -1.0;
        _y = -1.0;
        _waiting = true;
        _ready = false;
    }

    void deactivate()
    {
        _waiting = false;
        _ready = false;
    }

    double x() const { return _x; }
    void x(double val) { _x = val; _checkComplete(); }
    double y() const { return _y; }
    void y(double val) { _y = val; _checkComplete(); }

    bool waiting() const { return _waiting; }
    bool ready() const { return _ready; }

private:
    void _checkComplete()
    {
        if (_x > 0.0 && _y > 0.0) {
            _ready = true;
        }
    }

    double _x, _y;
    bool _waiting;
    bool _ready;
} touch_events[NUM_CHANNELS];

void initGlobals()
{
    player_running = true;

    note_to_key_map["c0"] = 1;
    note_to_key_map["d0eses"] = 2;
    note_to_key_map["c0is"] = 3;
    note_to_key_map["d0es"] = 4;
    note_to_key_map["c0isis"] = 5;
    note_to_key_map["d0"] = 6;
    note_to_key_map["e0eses"] = 7;
    note_to_key_map["d0is"] = 8;
    note_to_key_map["e0es"] = 9;
    note_to_key_map["d0isis"] = 10;
    note_to_key_map["e0"] = 11;
    note_to_key_map["f0es"] = 12;
    note_to_key_map["e0is"] = 13;
    note_to_key_map["f0"] = 14;
    note_to_key_map["g0eses"] = 15;
    note_to_key_map["f0is"] = 16;
    note_to_key_map["g0es"] = 17;
    note_to_key_map["f0isis"] = 18;
    note_to_key_map["g0"] = 19;
    note_to_key_map["a0eses"] = 20;
    note_to_key_map["g0is"] = 21;
    note_to_key_map["a0es"] = 22;
    note_to_key_map["g0isis"] = 23;
    note_to_key_map["a0"] = 24;
    note_to_key_map["b0eses"] = 25;
    note_to_key_map["a0is"] = 26;
    note_to_key_map["b0es"] = 27;
    note_to_key_map["a0isis"] = 28;
    note_to_key_map["b0"] = 29;
    note_to_key_map["c1es"] = 30;
    note_to_key_map["b0is"] = 31;
    note_to_key_map["c1"] = 32;
    note_to_key_map["d1eses"] = 33;
    note_to_key_map["c1is"] = 34;
    note_to_key_map["d1es"] = 35;
    note_to_key_map["c1isis"] = 36;
    note_to_key_map["d1"] = 37;
    note_to_key_map["e1eses"] = 38;
    note_to_key_map["d1is"] = 39;
    note_to_key_map["e1es"] = 40;
    note_to_key_map["d1isis"] = 41;
    note_to_key_map["e1"] = 42;
    note_to_key_map["f1es"] = 43;
    note_to_key_map["e1is"] = 44;
    note_to_key_map["f1"] = 45;
    note_to_key_map["g1eses"] = 46;
    note_to_key_map["f1is"] = 47;
    note_to_key_map["g1es"] = 48;
    note_to_key_map["f1isis"] = 49;
    note_to_key_map["g1"] = 50;
    note_to_key_map["a1eses"] = 51;
    note_to_key_map["g1is"] = 52;
    note_to_key_map["a1es"] = 53;
    note_to_key_map["g1isis"] = 54;
    note_to_key_map["a1"] = 55;
    note_to_key_map["b1eses"] = 56;
    note_to_key_map["a1is"] = 57;
    note_to_key_map["b1es"] = 58;
    note_to_key_map["a1isis"] = 59;
    note_to_key_map["b1"] = 60;
    note_to_key_map["c2es"] = 61;
    note_to_key_map["b1is"] = 62;
    note_to_key_map["c2"] = 63;
}

void playNote(const TouchEvent & t, Csound * cs, int channel)
{
    // Construct the point.
    Point p(t.x(), t.y());

    string the_key;

    // Now loop through the keys to find out which one it is..
    for (const auto it : keys) {
        if (it.second.contains(p)) {
            the_key = it.first;
            break;
        }
    }

    stringstream channel_name;
    channel_name << "pitch" << channel;
    if (the_key != "") {
        cs->SetChannel(channel_name.str().c_str(), note_to_key_map[the_key]);
    }
}

void loopDevice(struct mtdev & dev, int fd, struct input_event & ev,
  Csound * cs)
{
    // This is the default slot. mtdev only seems to change it
    // if reporting on another detected touch.
    static int slot = 0;

    // extract all available processed events
    while (mtdev_get(&dev, fd, &ev, 1) > 0) {
        if (ev.type == EV_ABS) {
            if (ev.code == ABS_MT_SLOT) {
                slot = ev.value;
            } else if (ev.code == ABS_MT_TRACKING_ID) {
                if (ev.value == -1) {
                    // This is a touch up event. Turn off the corresponding
                    // channel
                    stringstream channel_name;
                    channel_name << "pitch" << slot;
                    cs->SetChannel(channel_name.str().c_str(), 0.0);
                } else {
                    if (!touch_events[slot].waiting()) {
                        touch_events[slot].activate();
                    }
                }
            } else if (ev.code == ABS_MT_POSITION_X) {
                if (touch_events[slot].waiting()) {
                    touch_events[slot].x((ev.value / 4096.0)*1920.0);
                }
            } else if (ev.code == ABS_MT_POSITION_Y) {
                if (touch_events[slot].waiting()) {
                    touch_events[slot].y((ev.value / 4096.0)*1080.0);
                }
            }

            if (touch_events[slot].ready()) {
                // Here's where the magic happens. We know there's a touch,
                // we know its coordinate, now we just have to find what key
                // it is and activate the "slot" channel with the corresponding
                // note number.
                playNote(touch_events[slot], cs, slot);
                touch_events[slot].deactivate();
            }
        }
    }
}

int runPlayer()
{
    initKeys();
    initGlobals();

    Csound * csound_instance_ptr = new Csound();
    static char fake_process_name[] = "runPlayer";
    static char intrument_filename[] = "osc1.csd";
    char * argv[] = { fake_process_name, intrument_filename };
    int result = csound_instance_ptr->Compile(2, argv);

    if (! result) {
        CsoundPerformanceThread perf_thread(csound_instance_ptr->GetCsound());
        perf_thread.Play(); // It's now running in its own thread.
        
        // Next thing to do is define the main loop for watching the 
        // touch events.
        int touch_device = open("/dev/input/event5", O_RDONLY | O_NONBLOCK);
        if (touch_device < 0) {
            fprintf(stderr, "error: could not open device\n");
            return -1;
        }

        if (ioctl(touch_device, EVIOCGRAB, 1)) {
            fprintf(stderr, "error: could not grab the device\n");
            return -1;
        }

        struct mtdev dev;
        struct input_event ev;
        int ret = mtdev_open(&dev, touch_device);

        if (ret) {
            fprintf(stderr, "error: could not open device: %d\n", ret);
            return -1;
        }

        while (player_running) {
            loopDevice(dev, touch_device, ev, csound_instance_ptr);
        }

        mtdev_close(&dev);
        close(touch_device);

        perf_thread.Stop();
        perf_thread.Join();
    }

    if (result >= 0) {
        return 0;
    } else {
        return result;
    }
}

