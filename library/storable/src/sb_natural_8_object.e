note

	description:

		"NATURAL_8 objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_NATURAL_8_OBJECT

inherit

	SB_BASIC_OBJECT
		redefine
			is_natural_8,
			out
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_value: like value)
			-- Create a new NATURAL_8 object.
		require
			a_type_not_void: a_type /= Void
			a_type_expanded: a_type.is_expanded
			a_type_natural_8: a_type.is_natural_8
		do
			type := a_type
			value := a_value
		ensure
			type_set: type = a_type
			value_set: value = a_value
		end

feature -- Status report

	is_natural_8: BOOLEAN = True
			-- Is current object a NATURAL_8 object?

feature -- Access

	value: NATURAL_8
			-- Value

	type: SB_TYPE
			-- Type

feature -- Output

	out: STRING
			-- Textual representation
		do
			Result := value.out
		end

feature -- Setting

	set_value (a_value: like value)
			-- Set `value' to `a_value'.
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

end
