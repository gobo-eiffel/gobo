-- system:     "Gobo Eiffel Test"
-- compiler:   "ISE Eiffel"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 2000-2001, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	getest

root

	GETEST: execute

default

	console_application (yes);
#ifdef ASSERTION
	assertion (all);
#else
	--assertion (all);
#endif
	--precompiled ("$EIFFEL4/precomp/spec/$PLATFORM/base")

cluster

	getest:				"$GOBO/src/getest";

#include "${GOBO}/library/test/ise.ace"

#include "${GOBO}/library/tools/ise.ace"

#include "${GOBO}/library/lexical/ise.ace"

#include "${GOBO}/library/parse/ise-skl.ace"

#include "${GOBO}/library/utility/ise.ace"

#include "${GOBO}/library/kernel/ise.ace"

#include "${GOBO}/library/structure/ise.ace"

		-- EiffelBase
	all base:			"$EIFFEL4/library/base"
		exclude
			"desc"; "table_eiffel3"
		end

end
