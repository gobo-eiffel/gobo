note

	description:

		"Test configuration constants"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_CONFIG_CONSTANTS

feature -- Constants

	Default_class_regexp: LX_REGULAR_EXPRESSION
			-- Default class regexp
		once
			create {LX_DFA_REGULAR_EXPRESSION} Result.compile_case_insensitive ("TEST_.*")
		ensure
			regexp_not_void: Result /= Void
			regexp_compiled: Result.is_compiled
		end

	Default_feature_regexp: LX_REGULAR_EXPRESSION
			-- Default feature regexp
		once
			create {LX_DFA_REGULAR_EXPRESSION} Result.compile_case_insensitive ("test_.*")
		ensure
			regexp_not_void: Result /= Void
			regexp_compiled: Result.is_compiled
		end

	Default_class_prefix: STRING = "X"
			-- Default prefix of generated testcase class names

	Default_cluster_name: ET_IDENTIFIER
			-- Default cluster name
		once
			create Result.make ("root")
		ensure
			cluster_name_not_void: Result /= Void
		end

	Default_cluster_pathname: ET_IDENTIFIER
			-- Default cluster pathname
		once
			create Result.make (".")
		ensure
			cluster_pathname_not_void: Result /= Void
		end

end
