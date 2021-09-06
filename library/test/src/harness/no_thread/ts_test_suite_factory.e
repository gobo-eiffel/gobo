note

	description:

		"Factories for test suites"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_TEST_SUITE_FACTORY

feature -- Access

	new_test_suite (a_name: STRING; a_variables: TS_VARIABLES; a_thread_count: INTEGER): TS_TEST_SUITE
			-- New test suite optimized to run on machines
			-- with `a_thread_count' available CPUs
		require
			a_name_not_void: a_name /= Void
			a_variables_not_void: a_variables /= Void
			a_thread_count_not_negative: a_thread_count >= 0
		do
			create Result.make (a_name, a_variables)
		ensure
			instance_free: class
			new_test_suite_not_void: Result /= Void
			name_set: Result.name = a_name
			variables_set: Result.variables = a_variables
		end

end
