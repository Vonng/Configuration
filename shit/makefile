SHIT_PATH=$(HOME)/.shit
PROFILE_PATH=$(HOME)/.bash_profile
PWD:=$(shell pwd)

COMMAND1='[[ -f ${HOME}/.shit/main ]] && source ${HOME}/.shit/main'
COMMAND2='[[ -f ${HOME}/.shit/shitrc ]] && source ${HOME}/.shit/shitrc'

install:
	rm -rf $(SHIT_PATH) && mkdir -p $(SHIT_PATH)
	cp -r ./{lib,bin,main,shitrc} $(SHIT_PATH)/
	sed -ie '/shit\/main/d' $(PROFILE_PATH)
	sed -ie '/shit\/shitrc/d' $(PROFILE_PATH)
	echo $(COMMAND1) >> $(PROFILE_PATH)
	echo $(COMMAND2) >> $(PROFILE_PATH)

link:
	rm -rf $(SHIT_PATH) && mkdir -p $(SHIT_PATH)
	ln -s $(PWD)/{lib,bin,main,shitrc} $(SHIT_PATH)/
	sed -ie '/shit\/main/d' $(PROFILE_PATH)
	sed -ie '/shit\/shitrc/d' $(PROFILE_PATH)
	echo $(COMMAND1) >> $(PROFILE_PATH)
	echo $(COMMAND2) >> $(PROFILE_PATH)

uninstall:
	sed -ie '/shit\/main/d' $(PROFILE_PATH)
	sed -ie '/shit\/shitrc/d' $(PROFILE_PATH)
	rm -rf $(HOME)/.shit

private:
	cp .private $(HOME)/

.PHONY: install