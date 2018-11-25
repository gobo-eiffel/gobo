#!/bin/sh

# description: "Build Gobo web site in SourceForge (http://gobo-eiffel.sourceforge.net)"
# copyright: "Copyright (c) 2018, Eric Bezault and others"
# license: "MIT License"


# usage: build_gobo_web.sh <gobo_version>

VERSION=$1							# get Gobo version
cd /home/project-web/gobo-eiffel/htdocs				# go to project web
git_clone_gobo.sh gobo-${VERSION}				# get code from repository
rm gobo; ln -s gobo-${VERSION} gobo				# reset gobo



