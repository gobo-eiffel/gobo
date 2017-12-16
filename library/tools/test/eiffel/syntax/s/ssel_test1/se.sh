#!/bin/sh

# system:     "SSEL test 1"
# library:    "Gobo Eiffel Tools Library"
# compiler:   "SmallEiffel -0.78"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 1999, Eric Bezault and others"
# license:    "MIT License"
# date:       "$Date$"
# revision:   "$Revision$"


export geoptions="-no_split -no_style_warning -no_gc"
compile $geoptions A make
