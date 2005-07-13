indexing

	description:

		"Test case successful results"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TS_SUCCESSFUL_RESULT

inherit

	TS_RESULT
		redefine
			passed
		end

create

	make

feature {NONE} -- Initialization

	make (a_test: like test) is
			-- Create a new successful result associated with `a_test'.
		require
			a_test_not_void: a_test /= Void
		do
			test := a_test
		ensure
			test_set: test = a_test
		end

feature -- Status report

	passed: BOOLEAN is True
			-- Has `test' passed?

feature -- Output

	print_result (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print result to `a_file'.
		do
			a_file.put_string ("PASS:  [")
			a_file.put_string (test.name)
			a_file.put_character (']')
		end

end
