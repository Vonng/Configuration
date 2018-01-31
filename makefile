shit:
	cd shit && make
mac:
	cd app/karabiner/ && make
ssh:
	cd ssh/ && make
git:
	cd git/ && make
host:
	cd host/ && make

all:shit mac ssh git host

.PHONY: shit mac ssh git host all