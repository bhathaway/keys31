#include <mtdev.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#include <iostream>

using namespace std;

/* year-proof millisecond event time */
typedef __u64 mstime_t;

static int use_event(const struct input_event *ev)
{
#if 0
    return ev->type == EV_ABS && mtdev_is_absmt(ev->code);
#else
    return 1;
#endif
}

class SlotData {
public:
    SlotData() : active(false), x(0), y(0) { }

    bool active;
    int x, y;
} slot_data[10];

static void loop_device(int fd)
{
    struct mtdev dev;
    struct input_event ev;
    int ret = mtdev_open(&dev, fd);
    if (ret) {
        fprintf(stderr, "error: could not open device: %d\n", ret);
        return;
    }

    int slot = 0; // This is the default slot. mtdev only seems to change it
                  // if reporting on another detected touch.
    /* while the device has not been inactive for five seconds */
    while (!mtdev_idle(&dev, fd, 5000)) {
        /* extract all available processed events */
        while (mtdev_get(&dev, fd, &ev, 1) > 0) {
            if (ev.type == EV_ABS) {
                if (ev.code == ABS_MT_SLOT) {
                    slot = ev.value;
                } else if (ev.code == ABS_MT_TRACKING_ID) {
                    if (ev.value == -1) {
                        slot_data[slot].active = false;
                    } else {
                        slot_data[slot].active = true;
                    }
                } else if (ev.code == ABS_MT_POSITION_X) {
                    slot_data[slot].x = ev.value;
                } else if (ev.code == ABS_MT_POSITION_Y) {
                    slot_data[slot].y = ev.value;
                }
            }
        }

        for (int i = 0; i < 10; ++i) {
            if (slot_data[i].active) {
                cout << "(" << slot_data[i].x << ", " << slot_data[i].y << ")"
                << "                                                ";
            } else {
                cout << "                                               ";
            }
            cout << "\n";
        }
        for (int i = 0; i < 10; ++i) {
            cout << "\x1b[A";
        }
    }
    mtdev_close(&dev);
}

int main(int argc, char *argv[])
{
    int fd;
    if (argc < 2) {
        fprintf(stderr, "Usage: mtdev <device>\n");
        return -1;
    }
    fd = open(argv[1], O_RDONLY | O_NONBLOCK);
    if (fd < 0) {
        fprintf(stderr, "error: could not open device\n");
        return -1;
    }
    if (ioctl(fd, EVIOCGRAB, 1)) {
        fprintf(stderr, "error: could not grab the device\n");
        return -1;
    }
    loop_device(fd);
    ioctl(fd, EVIOCGRAB, 0);
    close(fd);
    return 0;
}

