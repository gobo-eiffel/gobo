note

	description:

		"JSON null values"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class JN_NULL

inherit

	JN_VALUE

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new null value.
		do
		end

feature -- Output

	append_to_string (a_string: STRING_8)
			-- Append `to_text' to `a_string'.
		do
			a_string.append_string (null_value)
		end

feature -- Processing

	process (a_processor: JN_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_null (Current)
		end

feature {NONE} -- Constants

	null_value: STRING_8 = "null"

end
