-- system:     "Reverse Polish Notation Calculator"
-- compiler:   "Halstenbach ISS-BASE"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 1997-2001, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	rpcalc

root

	RPCALC: execute

default

	--debug (yes);
#ifdef ASSERTION
	assertion (all);
#else
	--assertion (all);
#endif
	--precompiled ("$ISS_BASE/spec/$PLATFORM/precomp/base")

cluster

	rpcalc:				"$GOBO/example/parse/rpcalc";

#include "${GOBO}/library/parse/hact-skl.ace"

#include "${GOBO}/library/kernel/hact.ace"

component

		-- ISS-Baselib
	base: "$ISS_BASE/spec/$PLATFORM/component/base.cl"

end
