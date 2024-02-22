add_executable(live555MediaServer live555MediaServer.cpp DynamicRTSPServer.cpp)
target_include_directories(live555MediaServer PUBLIC . ../groupsock/include ../UsageEnvironment/include ../BasicUsageEnvironment/include ../liveMedia/include)
target_link_libraries(live555MediaServer PUBLIC -lstdc++ -lcrypto -lssl groupsock liveMedia groupsock BasicUsageEnvironment UsageEnvironment -lssl -lcrypto)

install(TARGETS live555MediaServer RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

