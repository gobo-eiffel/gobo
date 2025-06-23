note

	description:

		"Objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_OBJECT

feature -- Access

	type: SB_TYPE
			-- Type
		deferred
		end

feature -- Status report

	is_regular: BOOLEAN
			-- Is current object a regular object?
		do
			-- Result := False
		end

	is_special: BOOLEAN
			-- Is current object a SPECIAL object?
		do
			-- Result := False
		end

	is_special_basic: BOOLEAN
			-- Is current object a SPECIAL object of objects of basic types?
		do
			-- Result := False
		end

	is_composite_special: BOOLEAN
			-- Is current object a SPECIAL object of objects of non-basic type?
		do
			-- Result := False
		end

	is_special_reference: BOOLEAN
			-- Is current object a SPECIAL object of references?
		do
			-- Result := False
		end

	is_special_expanded: BOOLEAN
			-- Is current object a SPECIAL object of user-defined expanded objects?
		do
			-- Result := False
		end

	is_special_integer_32: BOOLEAN
			-- Is current object a SPECIAL object of INTEGER_32s?
		do
			-- Result := False
		end

	is_special_integer_8: BOOLEAN
			-- Is current object a SPECIAL object of INTEGER_8s?
		do
			-- Result := False
		end

	is_special_integer_16: BOOLEAN
			-- Is current object a SPECIAL object of INTEGER_16s?
		do
			-- Result := False
		end

	is_special_integer_64: BOOLEAN
			-- Is current object a SPECIAL object of INTEGER_64s?
		do
			-- Result := False
		end

	is_special_natural_8: BOOLEAN
			-- Is current object a SPECIAL object of NATURAL_8s?
		do
			-- Result := False
		end

	is_special_natural_16: BOOLEAN
			-- Is current object a SPECIAL object of NATURAL_16s?
		do
			-- Result := False
		end

	is_special_natural_32: BOOLEAN
			-- Is current object a SPECIAL object of NATURAL_32s?
		do
			-- Result := False
		end

	is_special_natural_64: BOOLEAN
			-- Is current object a SPECIAL object of NATURAL_64s?
		do
			-- Result := False
		end

	is_special_boolean: BOOLEAN
			-- Is current object a SPECIAL object of BOOLEANs?
		do
			-- Result := False
		end

	is_special_character_8: BOOLEAN
			-- Is current object a SPECIAL object of CHARACTER_8s?
		do
			-- Result := False
		end

	is_special_character_32: BOOLEAN
			-- Is current object a SPECIAL object of CHARACTER_32s?
		do
			-- Result := False
		end

	is_special_real_32: BOOLEAN
			-- Is current object a SPECIAL object of REAL_32s?
		do
			-- Result := False
		end

	is_special_real_64: BOOLEAN
			-- Is current object a SPECIAL object of REAL_64s?
		do
			-- Result := False
		end

	is_special_pointer: BOOLEAN
			-- Is current object a SPECIAL object of POINTERs?
		do
			-- Result := False
		end

	is_tuple: BOOLEAN
			-- Is current object a TUPLE object?
		do
			-- Result := False
		end

	is_basic: BOOLEAN
			-- Is current object an object of basic type?
		do
			-- Result := False
		end

	is_boolean: BOOLEAN
			-- Is current object a BOOLEAN object?
		do
			-- Result := False
		end

	is_character_8: BOOLEAN
			-- Is current object a CHARACTER_8 object?
		do
			-- Result := False
		end

	is_character_32: BOOLEAN
			-- Is current object a CHARACTER_32 object?
		do
			-- Result := False
		end

	is_integer_32: BOOLEAN
			-- Is current object an INTEGER_32 object?
		do
			-- Result := False
		end

	is_integer_8: BOOLEAN
			-- Is current object an INTEGER_8 object?
		do
			-- Result := False
		end

	is_integer_16: BOOLEAN
			-- Is current object an INTEGER_16 object?
		do
			-- Result := False
		end

	is_integer_64: BOOLEAN
			-- Is current object an INTEGER_64 object?
		do
			-- Result := False
		end

	is_natural_8: BOOLEAN
			-- Is current object an NATURAL_8 object?
		do
			-- Result := False
		end

	is_natural_16: BOOLEAN
			-- Is current object an NATURAL_16 object?
		do
			-- Result := False
		end

	is_natural_32: BOOLEAN
			-- Is current object an NATURAL_32 object?
		do
			-- Result := False
		end

	is_natural_64: BOOLEAN
			-- Is current object an NATURAL_64 object?
		do
			-- Result := False
		end

	is_real_32: BOOLEAN
			-- Is current object a REAL_32 object?
		do
			-- Result := False
		end

	is_real_64: BOOLEAN
			-- Is current object a REAL_64 object?
		do
			-- Result := False
		end

	is_pointer: BOOLEAN
			-- Is current object a POINTER object?
		do
			-- Result := False
		end

feature -- Element change

	reset
			-- Accommodate possible changes in `type'.
		do
		end

invariant

	type_not_void: type /= Void

end
