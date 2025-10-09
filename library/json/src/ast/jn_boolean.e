note

	description:

		"JSON boolean values"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class JN_BOOLEAN

inherit

	JN_VALUE

create

	make,
	make_true,
	make_false

feature {NONE} -- Initialization

	make (a_value: BOOLEAN)
			-- Create a new boolean value.
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

	make_true
			-- Create a new boolean value with value 'true'.
		do
			make (True)
		ensure
			is_true: value
		end

	make_false
			-- Create a new boolean value with value 'false'.
		do
			make (False)
		ensure
			is_false: not value
		end

feature -- Access

	value: BOOLEAN
			-- Boolean value

feature -- Output

	append_to_string (a_string: STRING_8)
			-- Append `to_text' to `a_string'.
		do
			if value then
				a_string.append_string (true_value)
			else
				a_string.append_string (false_value)
			end
		end

feature -- Processing

	process (a_processor: JN_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_boolean (Current)
		end

feature {NONE} -- Constants

	true_value: STRING_8 = "true"
	false_value: STRING_8 = "false"

end
