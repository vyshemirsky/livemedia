add_library(UsageEnvironment HashTable.cpp UsageEnvironment.cpp strDup.cpp)
target_include_directories(UsageEnvironment PUBLIC include ../groupsock/include)
set_target_properties(UsageEnvironment PROPERTIES PUBLIC_HEADER "include/Boolean.hh;include/HashTable.hh;include/strDup.hh;include/UsageEnvironment.hh;include/UsageEnvironment_version.hh")

install(TARGETS UsageEnvironment
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/UsageEnvironment
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/UsageEnvironment
)

