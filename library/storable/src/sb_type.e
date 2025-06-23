note

	description:

		"Eiffel types used in Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_TYPE

inherit

	ANY

	SB_SHARED_CONSTANTS
		export {NONE} all end

feature -- Access

	name: STRING
			-- Type name
		deferred
		ensure
			name_not_void: Result /= Void
			name_not_empty: not Result.is_empty
		end

feature -- Status report

	has_unknown: BOOLEAN
			-- Is there some classes describing the current
			-- type which are not known by the schema?
		do
			-- Result := False
		end

	is_formal: BOOLEAN
			-- Is current type a formal type?
		do
			-- Result := False
		end

	is_reference_formal: BOOLEAN
			-- Is current type a reference formal type?
		do
			-- Result := False
		end

	is_boolean: BOOLEAN
			-- Is current type a BOOLEAN type?
		do
			-- Result := False
		end

	is_character_8: BOOLEAN
			-- Is current type a CHARACTER_8 type?
		do
			-- Result := False
		end

	is_character_32: BOOLEAN
			-- Is current type a CHARACTER_32 type?
		do
			-- Result := False
		end

	is_integer_32: BOOLEAN
			-- Is current type an INTEGER_32 type?
		do
			-- Result := False
		end

	is_integer_8: BOOLEAN
			-- Is current type an INTEGER_8 type?
		do
			-- Result := False
		end

	is_integer_16: BOOLEAN
			-- Is current type an INTEGER_16 type?
		do
			-- Result := False
		end

	is_integer_64: BOOLEAN
			-- Is current type an INTEGER_64 type?
		do
			-- Result := False
		end

	is_natural_8: BOOLEAN
			-- Is current type a NATURAL_8 type?
		do
			-- Result := False
		end

	is_natural_16: BOOLEAN
			-- Is current type a NATURAL_16 type?
		do
			-- Result := False
		end

	is_natural_32: BOOLEAN
			-- Is current type a NATURAL_32 type?
		do
			-- Result := False
		end

	is_natural_64: BOOLEAN
			-- Is current type a NATURAL_64 type?
		do
			-- Result := False
		end

	is_real_32: BOOLEAN
			-- Is current type a REAL_32 type?
		do
			-- Result := False
		end

	is_real_64: BOOLEAN
			-- Is current type a REAL_64 type?
		do
			-- Result := False
		end

	is_pointer: BOOLEAN
			-- Is current type a POINTER type?
		do
			-- Result := False
		end

	is_none: BOOLEAN
			-- Is current type a NONE type?
		do
			-- Result := False
		end

	is_tuple: BOOLEAN
			-- Is current type a TUPLE type?
		do
			-- Result := False
		end

	is_expanded: BOOLEAN
			-- Is current type expanded?
		do
			-- Result := False
		end

	is_frozen: BOOLEAN
			-- Is current type frozen?
		do
			-- Result := False
		end

	is_attached: BOOLEAN
			-- Is current type attached?
		do
			-- Result := False
		end

	is_detachable: BOOLEAN
			-- Is current type detachable?
		do
			-- Result := False
		end

feature -- Comparison

	same_storable_type (other: SB_TYPE): BOOLEAN
			-- Are current type and `other' the same type?
		require
			other_not_void: other /= Void
		deferred
		end

	same_storable_full_type (other: SB_TYPE; other_context: SB_CLASS; a_context: SB_CLASS): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- appearing in `other_context' the same type?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			a_context_not_void: a_context /= Void
		deferred
		end

	is_storable_full_type_compatible (other: SB_TYPE; other_context: SB_CLASS; a_context: SB_CLASS): BOOLEAN
			-- Is current type appearing in `a_context' compatible with `other'
			-- appearing in `other_context'? Compatible means that they either
			-- are the same type or they only differ by their attached status.
			-- In the latter case, if `other' is an attached type then `Current'
			-- has to be an attached type as well.
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			a_context_not_void: a_context /= Void
		deferred
		end

feature -- Output

	print_type (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print current type to `a_file' in
			-- a human readable format.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

invariant

	not_both_attached_and_detachable: not (is_attached and is_detachable)

end
