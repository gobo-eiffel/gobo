indexing

	description:

		"Test 'geant'"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2002, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_GEANT

inherit

	TOOL_TEST_CASE

feature -- Access

	tool: STRING is "geant"
			-- Tool name

feature -- Test

	test_geant is
			-- Test 'geant'.
		do
			compile_tool
		end

end
