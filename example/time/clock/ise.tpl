-- system:     "System clock example"
-- compiler:   "ISE Eiffel 4.5"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 2001, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	clock

root

	CLOCK: execute

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

	clock:				"$GOBO/example/time/clock";

#include "${GOBO}/library/kernel/ise.ace"

#include "${GOBO}/library/time/ise.ace"

#include "${GOBO}/library/utility/ise.ace"

		-- EiffelBase
	all base:			"$EIFFEL4/library/base"
		exclude
			"desc"; "table_eiffel3"
		end

external

	include_path:
		"$GOBO/library/kernel/include",
		"$GOBO/library/time/include"

end
