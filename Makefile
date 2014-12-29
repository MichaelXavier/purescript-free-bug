DEPS=$(shell find bower_components/*/src -name '*.purs' -type f)

wat.js : $(DEPS) Wat.purs bower
	psc --module Wat --output $@ $(DEPS) Wat.purs

bower : bower.json
	bower install
