-- system:     "Gobo Eiffel Structure Library Tester"
-- compiler:   "ISE Eiffel"
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

	console_application (yes);
	--debug (yes);
#ifdef ASSERTION
	assertion (all);
#else
	--assertion (all);
#endif
	--precompiled ("$EIFFEL4/precomp/spec/$PLATFORM/base")

cluster

	ds_testgen:			"TESTGEN";
	ds_tester:			"$GOBO/test/structure";

#include "${GOBO}/library/structure/ise.ace"

#include "${GOBO}/library/test/ise-skl.ace"

#include "${GOBO}/library/kernel/ise.ace"

#include "${GOBO}/library/utility/ise.ace"

		-- EiffelBase
	all base:			"$EIFFEL4/library/base"
		exclude
			"desc"; "table_eiffel3"
		end

external

	include_path: "$GOBO/library/kernel/include"

end
