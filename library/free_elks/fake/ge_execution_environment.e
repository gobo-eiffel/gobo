indexing

	description:

		"Execution environment facilities"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GE_EXECUTION_ENVIRONMENT

inherit

	EXECUTION_ENVIRONMENT
		redefine
			environ
		end

feature {NONE} -- Implementation

	environ: GE_HASH_TABLE [C_STRING, STRING] is
			-- Environment variable memory set by current execution,
			-- indexed by environment variable name. Needed otherwise
			-- we would corrupt memory after freeing memory used by
			-- C_STRING instance since not referenced anywhere else.
		local
			l_string_tester: GE_STRING_EQUALITY_TESTER
		once
			create Result.make_map (10)
			create l_string_tester
			Result.set_key_equality_tester (l_string_tester)
		ensure then
			environ_not_void: Result /= Void
		end

end
