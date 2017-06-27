INCLUDES = -I../UsageEnvironment/include -I../groupsock/include -I../liveMedia/include -I../BasicUsageEnvironment/include
# Default library filename suffixes for each library that we link with.  The "config.*" file might redefine these later.
libliveMedia_LIB_SUFFIX = $(LIB_SUFFIX)
libBasicUsageEnvironment_LIB_SUFFIX = $(LIB_SUFFIX)
libUsageEnvironment_LIB_SUFFIX = $(LIB_SUFFIX)
libgroupsock_LIB_SUFFIX = $(LIB_SUFFIX)
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

MEDIA_SERVER = live555MediaServer$(EXE)

PREFIX = /home/esoroush/local
ALL = $(MEDIA_SERVER)
all: $(ALL)

.$(C).$(OBJ):
	$(C_COMPILER) -c $(C_FLAGS) $<
.$(CPP).$(OBJ):
	$(CPLUSPLUS_COMPILER) -c $(CPLUSPLUS_FLAGS) $<

MEDIA_SERVER_OBJS = live555MediaServer.$(OBJ) DynamicRTSPServer.$(OBJ)

live555MediaServer.$(CPP):	DynamicRTSPServer.hh version.hh
DynamicRTSPServer.$(CPP):	DynamicRTSPServer.hh

USAGE_ENVIRONMENT_DIR = ../UsageEnvironment
USAGE_ENVIRONMENT_LIB = $(USAGE_ENVIRONMENT_DIR)/libUsageEnvironment.$(libUsageEnvironment_LIB_SUFFIX)
BASIC_USAGE_ENVIRONMENT_DIR = ../BasicUsageEnvironment
BASIC_USAGE_ENVIRONMENT_LIB = $(BASIC_USAGE_ENVIRONMENT_DIR)/libBasicUsageEnvironment.$(libBasicUsageEnvironment_LIB_SUFFIX)
LIVEMEDIA_DIR = ../liveMedia
LIVEMEDIA_LIB = $(LIVEMEDIA_DIR)/libliveMedia.$(libliveMedia_LIB_SUFFIX)
GROUPSOCK_DIR = ../groupsock
GROUPSOCK_LIB = $(GROUPSOCK_DIR)/libgroupsock.$(libgroupsock_LIB_SUFFIX)
LOCAL_LIBS =	$(LIVEMEDIA_LIB) $(GROUPSOCK_LIB) \
		$(BASIC_USAGE_ENVIRONMENT_LIB) $(USAGE_ENVIRONMENT_LIB)
LIBS =			$(LOCAL_LIBS) $(LIBS_FOR_CONSOLE_APPLICATION)

live555MediaServer$(EXE):	$(MEDIA_SERVER_OBJS) $(LOCAL_LIBS)
	$(LINK)$@ $(CONSOLE_LINK_OPTS) $(MEDIA_SERVER_OBJS) $(LIBS)

clean:
	-rm -rf *.$(OBJ) $(ALL) core *.core *~ include/*~

install: $(MEDIA_SERVER)
	  install -d $(DESTDIR)$(PREFIX)/bin
	  install -m 755 $(MEDIA_SERVER) $(DESTDIR)$(PREFIX)/bin

##### Any additional, platform-specific rules come here:
