-- system:     "Gobo Eiffel Grep"
-- compiler:   "Halstenbach ISS-BASE"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 1997-2001, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	gegrep

root

	GEGREP: execute

default

	--debug (yes);
#ifdef ASSERTION
	assertion (all);
#else
	--assertion (all);
#endif
	--precompiled ("$ISS_BASE/spec/$PLATFORM/precomp/base")

cluster

	gegrep:				"$GOBO/example/lexical/gegrep";

#include "${GOBO}/library/lexical/hact.ace"

#include "${GOBO}/library/parse/hact-skl.ace"

#include "${GOBO}/library/utility/hact.ace"

#include "${GOBO}/library/kernel/hact.ace"

#include "${GOBO}/library/structure/hact.ace"

component

		-- ISS-Baselib
	base: "$ISS_BASE/spec/$PLATFORM/component/base.cl"

end
