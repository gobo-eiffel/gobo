#!/bin/sh

# system:     "Gobo Eiffel Test"
# compiler:   "SmallEiffel -0.78"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


if [ ! -f loadpath.se ]; then
	cp $GOBO/src/getest/loadpath.se .
fi

export geoptions="-boost -no_split -no_style_warning -no_gc"
compile $geoptions -o getest GETEST execute
