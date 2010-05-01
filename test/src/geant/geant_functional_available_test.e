note

	description:

		"Test task 'available'"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2008, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_FUNCTIONAL_AVAILABLE_TEST

inherit

	GEANT_FUNCTIONAL_TEST_CASE

create

	make_default

feature -- Test

	test_available is
			-- Test task 'available'
		do
			tasks := "{
				<available resource="${GOBO}/Readme.txt" variable="available"/>
				<echo message="${available}" to_file="out.txt"/>
				}"
			expected_out_txt := "true"
			basic_test ("test_available")

				-- TODO: test with true/false-value,

		end

	test_available_dir is
			-- Test task 'available'
		do
			tasks := "{
				<available resource="${GOBO}" variable="available"/>
				<echo message="${available}" to_file="out.txt"/>
				}"
			expected_out_txt := "true"
			basic_test ("test_available_dir")
		end

	test_available_subdir is
			-- Test task 'available'
		do
			tasks := "{
				<available resource="${GOBO}/src" variable="available"/>
				<echo message="${available}" to_file="out.txt"/>
				}"
			expected_out_txt := "true"
			basic_test ("test_available_dir")
		end

end
