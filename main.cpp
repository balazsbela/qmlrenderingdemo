#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "models/qqmlvariantlistmodel.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // https://www.youtube.com/watch?v=96XAaH97XYo

    qmlRegisterType<QQmlVariantListModel>("com.models", 1, 0, "QQmlVariantListModel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
