-- system:     "Infix Notation Calculator"
-- compiler:   "Halstenbach ISS-BASE 3.0"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 1997-2000, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	calculator

root

	CALC_SCANNER: "make"

default

	--debug (yes);
#ifdef ASSERTION
	assertion (all);
#else
	--assertion (all);
#endif
	--precompiled ("$ISS_BASE/spec/$PLATFORM/precomp/base")

cluster

	calc:			"$GOBO/example/lexical/calculator";

#include "${GOBO}/library/lexical/hact-skl.ace"

#include "${GOBO}/library/kernel/hact.ace"

		-- ISS-Yacc
	yacc:			"$ISS_BASE/library/yacc";

component

		-- ISS-Baselib
	base: "$ISS_BASE/spec/$PLATFORM/component/base.cl"

end
