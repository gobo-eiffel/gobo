-- system:     "Gobo Eiffel Structure Library Tester"
-- compiler:   "Halstenbach ISS-BASE 3.0"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 2000, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	xstructure

root

	XSTRUCTURE: "make"

default

	--debug (yes);
#ifdef ASSERTION
	assertion (all);
#else
	--assertion (all);
#endif
	--precompiled ("$ISS_BASE/spec/$PLATFORM/precomp/base")

cluster

	ds_testgen:			"TESTGEN";
	ds_tester:			"$GOBO/test/structure";

#include "$GOBO/library/structure/hact.ace"

#include "$GOBO/library/test/hact-skl.ace"

#include "$GOBO/library/kernel/hact.ace"

#include "$GOBO/library/utility/hact.ace"

component

		-- ISS-Baselib
	base: "$ISS_BASE/spec/$PLATFORM/component/base.cl"

end
