-- system:     "Gobo Eiffel Libraries precompilation"
-- compiler:   "ISE Eiffel"
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

#include "${GOBO}/library/kernel/ise.ace"

#include "${GOBO}/library/lexical/ise.ace"

#include "${GOBO}/library/parse/ise.ace"

#include "${GOBO}/library/structure/ise.ace"

#include "${GOBO}/library/test/ise.ace"

#include "${GOBO}/library/time/ise.ace"

#include "${GOBO}/library/tools/ise.ace"

#include "${GOBO}/library/utility/ise.ace"

		-- EiffelTime simulation
	EiffelTime:			"${GOBO}/library/other/EiffelTime"

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
