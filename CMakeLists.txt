
cmake_minimum_required(VERSION 3.16)

project(QT_hello VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appQT_hello
    main.cpp
)

qt_add_qml_module(appQT_hello
    URI QT_hello
    VERSION 1.0
    QML_FILES main.qml
    QML_FILES NoodleSpeed.qml
    SOURCES backend.h backend.cpp
    QML_FILES Gauge.qml
    QML_FILES Arrow.qml
    RESOURCES assets/light.png
    RESOURCES assets/doors.png
    QML_FILES CustomGauge.qml
    RESOURCES assets/banzen.png assets/oil.png

)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQT_hello PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQT_hello
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQT_hello
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appQT_hello
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

