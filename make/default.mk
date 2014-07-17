#________________________________________
# 
#

#
# Include sub-Makefiles
#

include				make/common.mk

#
# 
#

default: tmux

libevent:
	make -f $(MAKE_PATH)/libevent.mk MAKE_PATH=$(MAKE_PATH)

ncurses:
	make -f $(MAKE_PATH)/ncurses.mk MAKE_PATH=$(MAKE_PATH)

tmux: libevent ncurses
	make -f $(MAKE_PATH)/tmux.mk MAKE_PATH=$(MAKE_PATH)

package: tmux
	tar jcf packages/tmux.tar.bz2 $(INSTALL_BIN_PATH)/$<

clean:
	make -f $(MAKE_PATH)/libevent.mk clean MAKE_PATH=$(MAKE_PATH)
	make -f $(MAKE_PATH)/ncurses.mk clean MAKE_PATH=$(MAKE_PATH)
	make -f $(MAKE_PATH)/tmux.mk clean MAKE_PATH=$(MAKE_PATH)
	rm -rf $(INSTALL_PATH)/*

nuke: clean
	-rm -rf $(INSTALL_PATH)/*



#
#
#
