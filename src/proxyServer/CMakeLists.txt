add_executable(live555ProxyServer live555ProxyServer.cpp)
target_include_directories(live555ProxyServer PUBLIC ../groupsock/include ../UsageEnvironment/include ../BasicUsageEnvironment/include ../liveMedia/include)
target_link_libraries(live555ProxyServer PUBLIC -lstdc++ -lcrypto -lssl groupsock liveMedia groupsock BasicUsageEnvironment UsageEnvironment -lssl -lcrypto)

install(TARGETS live555ProxyServer RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

