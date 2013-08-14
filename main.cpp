#include "csound_interface.h"

#include <QQmlListProperty>
#include <QGuiApplication>
#include <QQuickView>
#include <QQuickItem>
#include <QTouchEvent>
#include <thread>

using namespace std;


int main(int argc, char * argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view(QUrl::fromLocalFile("interface.qml"));

    view.showFullScreen();
    thread t(runPlayer);
    int retval = app.exec();
    player_running = false;
    t.join();
    return retval;
}

