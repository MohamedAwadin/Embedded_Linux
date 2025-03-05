cmake_minimum_required(VERSION 3.16)
project(ledapp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 COMPONENTS Core Quick Qml REQUIRED)
find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBGPIOD REQUIRED libgpiod)

qt_add_executable(ledapp
    main.cpp
    ledcontroller.h
)

qt_add_qml_module(ledapp
    URI LedApp
    VERSION 1.0
    QML_FILES main.qml
)

target_include_directories(ledapp PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${LIBGPIOD_INCLUDE_DIRS})
target_link_libraries(ledapp PRIVATE Qt6::Core Qt6::Quick Qt6::Qml gpiodcxx)


# cmake_minimum_required(VERSION 3.16)
# project(ledapp LANGUAGES CXX)

# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)
# set(CMAKE_AUTOMOC ON)

# find_package(Qt6 COMPONENTS Core Quick Qml REQUIRED)
# find_package(PkgConfig REQUIRED)
# pkg_check_modules(LIBGPIOD REQUIRED libgpiod)  # For headers and basic info

# qt_add_executable(ledapp
#     main.cpp
#     ledcontroller.h
# )

# qt_add_qml_module(ledapp
#     URI LedApp
#     VERSION 1.0
#     QML_FILES main.qml
#     RESOURCES qml.qrc
# )

# target_include_directories(ledapp PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${LIBGPIOD_INCLUDE_DIRS})
# target_link_libraries(ledapp PRIVATE Qt6::Core Qt6::Quick Qt6::Qml gpiodcxx)  # Link libgpiodcxx directly