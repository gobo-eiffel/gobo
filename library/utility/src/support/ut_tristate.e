note

	description:

		"3 state variables"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"

class UT_TRISTATE

inherit

	ANY -- Needed for SE 2.1b1.

create

	make_true, make_false, make_undefined

feature {NONE} -- Initialization

	make_true
			-- Create a new variable and set it to true.
		do
			set_true
		ensure
			is_true: is_true
		end

	make_false
			-- Create a new variable and set it to false.
		do
			set_false
		ensure
			is_false: is_false
		end

	make_undefined
			-- Create a new variable and set it to undefined.
		do
			set_undefined
		ensure
			is_undefined: is_undefined
		end

feature -- Status report

	is_true: BOOLEAN
			-- Is variable true?
		do
			Result := (value = 'T')
		end

	is_false: BOOLEAN
			-- Is variable false?
		do
			Result := (value = 'F')
		end

	is_undefined: BOOLEAN
			-- Is variable undefined?
		do
			Result := not (is_true or is_false)
		end

feature -- Status setting

	set_true
			-- Set variable to true.
		do
			value := 'T'
		ensure
			is_true: is_true
		end

	set_false
			-- Set variable to false.
		do
			value := 'F'
		ensure
			is_false: is_false
		end

	set_undefined
			-- Set variable to undefined.
		do
			value := 'U'
		ensure
			is_undefined: is_undefined
		end

feature {NONE} -- Implementation

	value: CHARACTER
			-- Internal state

invariant

	at_least_one: is_true or is_false or is_undefined
	is_true_definition: is_true = not (is_false or is_undefined)
	is_false_definition: is_false = not (is_true or is_undefined)
	is_undefined_definition: is_undefined = not (is_true or is_false)

end
