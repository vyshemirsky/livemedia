##### Change the following for your environment:
# 'CURRENT':'REVISION':'AGE' are updated - whenever a library changes - as follows:
# The library code changes, but without any changes to the API (i.e., interfaces) => increment REVISION
# At least one interface changes, or is removed => CURRENT += 1; REVISION = 0; AGE = 0
# One or more interfaces were added, but no existing interfaces were changed or removed => CURRENT += 1; REVISION = 0; AGE += 1

libliveMedia_VERSION_CURRENT=55
libliveMedia_VERSION_REVISION=2
libliveMedia_VERSION_AGE=3
libliveMedia_LIB_SUFFIX=so.$(shell expr $(libliveMedia_VERSION_CURRENT) - $(libliveMedia_VERSION_AGE)).$(libliveMedia_VERSION_AGE).$(libliveMedia_VERSION_REVISION)

libBasicUsageEnvironment_VERSION_CURRENT=1
libBasicUsageEnvironment_VERSION_REVISION=0
libBasicUsageEnvironment_VERSION_AGE=0
libBasicUsageEnvironment_LIB_SUFFIX=so.$(shell expr $(libBasicUsageEnvironment_VERSION_CURRENT) - $(libBasicUsageEnvironment_VERSION_AGE)).$(libBasicUsageEnvironment_VERSION_AGE).$(libBasicUsageEnvironment_VERSION_REVISION)

libUsageEnvironment_VERSION_CURRENT=4
libUsageEnvironment_VERSION_REVISION=0
libUsageEnvironment_VERSION_AGE=1
libUsageEnvironment_LIB_SUFFIX=so.$(shell expr $(libUsageEnvironment_VERSION_CURRENT) - $(libUsageEnvironment_VERSION_AGE)).$(libUsageEnvironment_VERSION_AGE).$(libUsageEnvironment_VERSION_REVISION)

libgroupsock_VERSION_CURRENT=9
libgroupsock_VERSION_REVISION=0
libgroupsock_VERSION_AGE=1
libgroupsock_LIB_SUFFIX=so.$(shell expr $(libgroupsock_VERSION_CURRENT) - $(libgroupsock_VERSION_AGE)).$(libgroupsock_VERSION_AGE).$(libgroupsock_VERSION_REVISION)
#####

COMPILE_OPTS =		$(INCLUDES) -I. -O2 -DSOCKLEN_T=socklen_t -D_LARGEFILE_SOURCE=1 -D_FILE_OFFSET_BITS=64 -fPIC
C =			c
C_COMPILER =		$(CC)
C_FLAGS =		$(COMPILE_OPTS) $(CPPFLAGS) $(CFLAGS)
CPP =			cpp
CPLUSPLUS_COMPILER =	$(CXX)
CPLUSPLUS_FLAGS =	$(COMPILE_OPTS) -Wall -DBSD=1 $(CPPFLAGS) $(CXXFLAGS)
OBJ =			o
LINK =			$(CXX) -o
LINK_OPTS =		-L. $(LDFLAGS)
CONSOLE_LINK_OPTS =	$(LINK_OPTS)
LIBRARY_LINK =		$(CC) -o 
SHORT_LIB_SUFFIX =	so.$(shell expr $($(NAME)_VERSION_CURRENT) - $($(NAME)_VERSION_AGE))
LIB_SUFFIX =	 	$(SHORT_LIB_SUFFIX).$($(NAME)_VERSION_AGE).$($(NAME)_VERSION_REVISION)
LIBRARY_LINK_OPTS =	-shared -Wl,-soname,$(NAME).$(SHORT_LIB_SUFFIX) $(LDFLAGS)
LIBS_FOR_CONSOLE_APPLICATION =
LIBS_FOR_GUI_APPLICATION =
EXE =
INSTALL2 =		install_shared_libraries
##### End of variables to change

LIVEMEDIA_DIR = liveMedia
GROUPSOCK_DIR = groupsock
USAGE_ENVIRONMENT_DIR = UsageEnvironment
BASIC_USAGE_ENVIRONMENT_DIR = BasicUsageEnvironment

TESTPROGS_DIR = testProgs

MEDIA_SERVER_DIR = mediaServer

PROXY_SERVER_DIR = proxyServer

all:
	cd $(LIVEMEDIA_DIR) ; $(MAKE)
	cd $(GROUPSOCK_DIR) ; $(MAKE)
	cd $(USAGE_ENVIRONMENT_DIR) ; $(MAKE)
	cd $(BASIC_USAGE_ENVIRONMENT_DIR) ; $(MAKE)
	cd $(TESTPROGS_DIR) ; $(MAKE)
	cd $(MEDIA_SERVER_DIR) ; $(MAKE)
	cd $(PROXY_SERVER_DIR) ; $(MAKE)

install:
	cd $(LIVEMEDIA_DIR) ; $(MAKE) install
	cd $(GROUPSOCK_DIR) ; $(MAKE) install
	cd $(USAGE_ENVIRONMENT_DIR) ; $(MAKE) install
	cd $(BASIC_USAGE_ENVIRONMENT_DIR) ; $(MAKE) install
	cd $(TESTPROGS_DIR) ; $(MAKE) install
	cd $(MEDIA_SERVER_DIR) ; $(MAKE) install
	cd $(PROXY_SERVER_DIR) ; $(MAKE) install

clean:
	cd $(LIVEMEDIA_DIR) ; $(MAKE) clean
	cd $(GROUPSOCK_DIR) ; $(MAKE) clean
	cd $(USAGE_ENVIRONMENT_DIR) ; $(MAKE) clean
	cd $(BASIC_USAGE_ENVIRONMENT_DIR) ; $(MAKE) clean
	cd $(TESTPROGS_DIR) ; $(MAKE) clean
	cd $(MEDIA_SERVER_DIR) ; $(MAKE) clean
	cd $(PROXY_SERVER_DIR) ; $(MAKE) clean

distclean: clean
	-rm -f $(LIVEMEDIA_DIR)/Makefile $(GROUPSOCK_DIR)/Makefile \
	  $(USAGE_ENVIRONMENT_DIR)/Makefile $(BASIC_USAGE_ENVIRONMENT_DIR)/Makefile \
	  $(TESTPROGS_DIR)/Makefile $(MEDIA_SERVER_DIR)/Makefile \
	  $(PROXY_SERVER_DIR)/Makefile Makefile
