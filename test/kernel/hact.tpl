-- system:     "Gobo Eiffel Kernel Library Tester"
-- compiler:   "Halstenbach ISS-BASE"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 2001, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	xkernel

root

	XKERNEL: "make"

default

	--debug (yes);
#ifdef ASSERTION
	assertion (all);
#else
	--assertion (all);
#endif
	--precompiled ("$ISS_BASE/spec/$PLATFORM/precomp/base")

cluster

	kl_testgen:			"TESTGEN";
	kl_tester:			"$GOBO/test/kernel";

#include "${GOBO}/library/kernel/hact.ace"

#include "${GOBO}/library/test/hact-skl.ace"

#include "${GOBO}/library/structure/hact.ace"

#include "${GOBO}/library/utility/hact.ace"

#include "${GOBO}/library/time/hact.ace"

component

		-- ISS-Baselib
	base: "$ISS_BASE/spec/$PLATFORM/component/base.cl"

end
