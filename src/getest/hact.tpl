-- system:     "Gobo Eiffel Test"
-- compiler:   "Halstenbach ISS-BASE 3.0"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 2000, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	getest

root

	GETEST: execute

default

	--debug (yes);
#ifdef ASSERTION
	assertion (all);
#else
	--assertion (all);
#endif
	--precompiled ("$ISS_BASE/spec/$PLATFORM/precomp/base")

cluster

	getest:				"$GOBO/src/getest";

#include "$GOBO/library/test/hact.ace"

#include "$GOBO/library/tools/hact.ace"

#include "$GOBO/library/lexical/hact.ace"

#include "$GOBO/library/parse/hact-skl.ace"

#include "$GOBO/library/utility/hact.ace"

#include "$GOBO/library/kernel/hact.ace"

#include "$GOBO/library/structure/hact.ace"

component

		-- ISS-Baselib
	base: "$ISS_BASE/spec/$PLATFORM/component/base.cl"

end
