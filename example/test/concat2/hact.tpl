-- system:     "concat2 getest example"
-- compiler:   "Halstenbach ISS-BASE"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 2001, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	xconcat2

root

	XCONCAT2: "make"

default

	--debug (yes);
#ifdef ASSERTION
	assertion (all);
#else
	--assertion (all);
#endif
	--precompiled ("$ISS_BASE/spec/$PLATFORM/precomp/base")

cluster

	concat2:			".";

#include "${GOBO}/library/test/hact-skl.ace"

#include "${GOBO}/library/kernel/hact.ace"

#include "${GOBO}/library/structure/hact.ace"

#include "${GOBO}/library/utility/hact.ace"

component

		-- ISS-Baselib
	base: "$ISS_BASE/spec/$PLATFORM/component/base.cl"

end
