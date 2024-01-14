note

	description:

		"Test 'geant'"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2002, Sven Ehrke and others"
	license: "MIT License"

class TEST_GEANT

inherit

	TOOL_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "geant"
			-- Program name

feature -- Test

	test_geant
			-- Test 'geant'.
		do
			compile_program
		end

end
