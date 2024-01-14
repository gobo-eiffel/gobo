note

	description:

		"Test features of class EXECUTION_ENVIRONMENT"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"

class TEST_EXECUTION_ENVIRONMENT

inherit

	TS_TEST_CASE
	
create

	make_default

feature -- Test

	test_available_cpu_count
			-- Test feature 'available_cpu_count'.
		local
			l_execution_environment: EXECUTION_ENVIRONMENT
		do
			create l_execution_environment
			assert_true ("at_least_one_cpu", l_execution_environment.available_cpu_count >= 1)
		end

end
