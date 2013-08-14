#if !defined __BAH_CSOUND_INTERFACE_H__
#define __BAH_CSOUND_INTERFACE_H__

#include <atomic>

extern std::atomic<bool> player_running;

int runPlayer(void);

#endif
