add_library(groupsock GroupEId.cpp Groupsock.cpp GroupsockHelper.cpp inet.c IOHandlers.cpp NetAddress.cpp NetInterface.cpp)
target_include_directories(groupsock PUBLIC include ../UsageEnvironment/include)
set_target_properties(groupsock PROPERTIES PUBLIC_HEADER "include/GroupEId.hh;include/GroupsockHelper.hh;include/Groupsock.hh;include/groupsock_version.hh;include/IOHandlers.hh;include/NetAddress.hh;include/NetCommon.h;include/NetInterface.hh")

install(TARGETS groupsock
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/groupsock
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/groupsock
)

