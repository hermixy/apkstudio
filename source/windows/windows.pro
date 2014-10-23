!include("../apkstudio.pri") {
    error("Unable to locate &/or include apkstudio.pri")
}

# Enable support for newer c++ expressions
CONFIG += c++11

# Refrence QT framework dependencies
QT += core gui widgets

# Source files to be included/compiled within target
HEADERS += \
    vpz/apkstudio/windows/ide.hpp \
    vpz/apkstudio/windows/menubar.hpp \
    vpz/apkstudio/windows/toolbar.hpp

SOURCES += \
    vpz/apkstudio/windows/ide.cpp \
    vpz/apkstudio/windows/menubar.cpp \
    vpz/apkstudio/windows/toolbar.cpp

# Include referenced co-projects & libraries
win32 {
    CONFIG(release, debug|release): {
        LIBS += -L$$OUT_PWD/../components/release/ -lcomponents
        LIBS += -L$$OUT_PWD/../helpers/release/ -lhelpers
        LIBS += -L$$OUT_PWD/../resources/release/ -lresources
    } else {
        LIBS += -L$$OUT_PWD/../components/debug/ -lcomponents
        LIBS += -L$$OUT_PWD/../helpers/debug/ -lhelpers
        LIBS += -L$$OUT_PWD/../resources/debug/ -lresources
    }
}

unix {
    LIBS += -L$$OUT_PWD/../components/ -lcomponents
    LIBS += -L$$OUT_PWD/../helpers/ -lhelpers
    LIBS += -L$$OUT_PWD/../resources/ -lresources
}

DEPENDPATH += $$PWD/../components
DEPENDPATH += $$PWD/../helpers
DEPENDPATH += $$PWD/../resources

INCLUDEPATH += $$PWD/../helpers/vpz/apkstudio
INCLUDEPATH += $$PWD/../resources/vpz/apkstudio
INCLUDEPATH += $$PWD/../components/vpz/apkstudio
