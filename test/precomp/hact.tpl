-- system:     "Gobo Eiffel Libraries precompilation"
-- compiler:   "Halstenbach ISS-BASE"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	gobo

root

	ANY

cluster

#include "${GOBO}/library/kernel/hact.ace"

#include "${GOBO}/library/lexical/hact.ace"

#include "${GOBO}/library/parse/hact.ace"

#include "${GOBO}/library/structure/hact.ace"

#include "${GOBO}/library/test/hact.ace"

#include "${GOBO}/library/time/hact.ace"

#include "${GOBO}/library/tools/hact.ace"

#include "${GOBO}/library/utility/hact.ace"

component

		-- ISS-Baselib
	base: "$ISS_BASE/spec/$PLATFORM/component/base.cl"

end
