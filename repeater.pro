TEMPLATE = app

QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
           models/qqmlvariantlistmodel.cpp

HEADERS += models/qqmlvariantlistmodel_p.h \
           models/qqmlvariantlistmodel.h \
           models/qqmlmodels.h

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
