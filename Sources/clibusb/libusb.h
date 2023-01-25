#pragma once
#ifdef __linux__
#include <libusb-1.0/libusb.h>
#elif __APPLE__
#include "libusb.h"
#endif
