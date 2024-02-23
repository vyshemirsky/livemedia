add_library(BasicUsageEnvironment BasicHashTable.cpp BasicUsageEnvironment.cpp BasicTaskScheduler.cpp BasicTaskScheduler0.cpp BasicUsageEnvironment0.cpp DelayQueue.cpp include/BasicHashTable.hh include/BasicUsageEnvironment0.hh include/BasicUsageEnvironment.hh include/BasicUsageEnvironment_version.hh include/DelayQueue.hh include/HandlerSet.hh)
target_include_directories(BasicUsageEnvironment PUBLIC include ../groupsock/include ../UsageEnvironment/include)
set_target_properties(BasicUsageEnvironment PROPERTIES PUBLIC_HEADER "include/BasicHashTable.hh;include/BasicUsageEnvironment0.hh;include/BasicUsageEnvironment.hh;include/BasicUsageEnvironment_version.hh;include/DelayQueue.hh;include/HandlerSet.hh")

install(TARGETS BasicUsageEnvironment 
	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/BasicUsageEnvironment
	PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/BasicUsageEnvironment
)
