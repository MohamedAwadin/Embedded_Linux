cmake_minimum_required(VERSION 3.5)
project(helloworld)

add_executable(helloworld main.c)
install(TARGETS helloworld RUNTIME DESTINATION bin)
