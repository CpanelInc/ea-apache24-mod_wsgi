OBS_PROJECT := EA4-experimental
OBS_PACKAGE := mod_wsgi
DISABLE_BUILD := repository=CentOS_9 repository=Almalinux_10
include $(EATOOLS_BUILD_DIR)obs.mk
