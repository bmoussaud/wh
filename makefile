# Microservices Project Make File
# author: umer bmoussaud

VIRTUALENV = $(shell which virtualenv)

clean: shutdown
	rm -fr microservices.egg-info
	rm -fr venv

venv:
	python3 -m venv ./venv

install: clean venv
	. venv/bin/activate; python3 setup.py install
	. venv/bin/activate; python3 setup.py develop

launch: venv shutdown
	. venv/bin/activate; python3  services/github.py &

shutdown:
	ps -ef | grep "services/github.py" | grep -v grep | awk '{print $$2}' | xargs kill  

