add_executable(live555HLSProxy live555HLSProxy.cpp)
target_include_directories(live555HLSProxy PUBLIC ../groupsock/include ../UsageEnvironment/include ../BasicUsageEnvironment/include ../liveMedia/include)
target_link_libraries(live555HLSProxy PUBLIC -lstdc++ -lcrypto -lssl groupsock liveMedia groupsock BasicUsageEnvironment UsageEnvironment -lssl -lcrypto)

install(TARGETS live555HLSProxy RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
