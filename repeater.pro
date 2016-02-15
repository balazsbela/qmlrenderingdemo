TEMPLATE = app

QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
           models/QQmlObjectListModel.cpp \
           models/QQmlVariantListModel.cpp

HEADERS += models/QQmlObjectListModel.h \
           models/QQmlVariantListModel.h

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
