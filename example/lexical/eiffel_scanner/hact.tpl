-- system:     "Eiffel scanner"
-- compiler:   "Halstenbach ISS-BASE"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 1997-2001, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	eiffel_scanner

root

	EIFFEL_SCANNER: benchmark

default

	--debug (yes);
#ifdef ASSERTION
	assertion (all);
#else
	--assertion (all);
#endif
	--precompiled ("$ISS_BASE/spec/$PLATFORM/precomp/base")

cluster

	eiffel:				"$GOBO/example/lexical/eiffel_scanner";

#include "${GOBO}/library/lexical/hact-skl.ace"

#include "${GOBO}/library/utility/hact.ace"

#include "${GOBO}/library/kernel/hact.ace"

component

		-- ISS-Baselib
	base: "$ISS_BASE/spec/$PLATFORM/component/base.cl"

end
