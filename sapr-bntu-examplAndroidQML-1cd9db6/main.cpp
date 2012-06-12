#include <QtGui/QApplication>
#include <QDeclarativeEngine>
#include <QFile>
#include "qmlapplicationviewer.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    QScopedPointer<QmlApplicationViewer> viewer(QmlApplicationViewer::create());

    viewer->setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    QFile file( "qml/examplAndroidQML/Game.qml" );
    viewer->engine()->setBaseUrl(QUrl::fromLocalFile("/"));
    viewer->setSource(QUrl::fromLocalFile("qml/examplAndroidQML/Game.qml"));
    viewer->showExpanded();

    return app->exec();
}
