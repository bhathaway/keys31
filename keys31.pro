TEMPLATE = app

QT           += widgets quick qml
HEADERS      += parse_svg.h TouchPolygon.h csound_interface.h
SOURCES      += main.cpp parse_svg.cpp TouchPolygon.cpp csound_interface.cpp
LIBS         += -lcsound64 -lcsnd -lmtdev
DEFINES      += USE_DOUBLE
QMAKE_CXXFLAGS += -std=c++11 -O2

CONFIG += console
