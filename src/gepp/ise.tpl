-- system:     "'gepp' preprocessor"
-- compiler:   "ISE Eiffel 4.5"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 1997-2000, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	gepp

root

	GEPP: execute

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

	gepp:				"$GOBO/src/gepp";

#include "${GOBO}/library/lexical/ise-skl.ace"

#include "${GOBO}/library/parse/ise-skl.ace"

#include "${GOBO}/library/utility/ise.ace"

#include "${GOBO}/library/kernel/ise.ace"

#include "${GOBO}/library/structure/ise.ace"

		-- EiffelBase
	all base:			"$EIFFEL4/library/base"
		exclude
			"desc"; "table_eiffel3"
		end

external

	include_path: "$GOBO/library/kernel/include"

end
