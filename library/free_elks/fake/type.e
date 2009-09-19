note
	description: "Representation of an Eiffel type."
	remark: "At any given time, there is no more than one instance of TYPE representing a given Eiffel type."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

frozen class
	TYPE [G]

inherit
	HASHABLE
		redefine
			is_equal, out
		end

	DEBUG_OUTPUT
		redefine
			is_equal, out
		end

create {NONE}

	-- Creation is done either by using manifest types
	-- or by calling ANY.generating_type.

convert

		-- Conversion useful for the transition period because of the
		-- modification in ANY:
		--    generating_type: STRING
		-- becomes:
		--    generating_type: TYPE [like Current]
	to_string: {STRING, STRING_GENERAL},
	to_readable_string_8: {READABLE_STRING_8},
	to_readable_string_32: {READABLE_STRING_32},
	to_immutable_string_8: {IMMUTABLE_STRING_8},
	to_immutable_string_32: {IMMUTABLE_STRING_32}

feature -- Access

	name: IMMUTABLE_STRING_8
			-- Name of Eiffel type represented by `Current', using Eiffel style guidelines
			-- as specified in OOSC2 (e.g. COMPARABLE, HASH_TABLE [FOO, BAR], ...)
		do
			if attached internal_name as l_name then
				Result := l_name
			else
				create Result.make_from_string (runtime_name)
				internal_name := Result
			end
		ensure
			name_not_void: Result /= Void
		end

	generic_parameter (i: INTEGER): TYPE [detachable ANY]
			-- `i'-th generic parameter of Eiffel type represented by `Current'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= generic_parameter_count
		external
			"built_in"
		ensure
			generic_parameter_not_void: Result /= Void
		end

	type_id: INTEGER
			-- Id of the Eiffel type represented by `Current'
		external
			"built_in"
		ensure
			type_id_not_negative: Result >= 0
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := type_id
		end

feature -- Measurement

	generic_parameter_count: INTEGER
			-- Number of generic parameters in Eiffel type represented by `Current'
		external
			"built_in"
		ensure
			generic_parameter_count_not_negative: Result >= 0
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result := type_id = other.type_id
		end

feature -- Conversion

	adapt alias "[]" (g: detachable G): detachable G
			-- Adapts `g' or calls necessary conversion routine to adapt `g'
		do
			Result := g
		ensure
			adapted: Result ~ g
		end

	attempt alias "#?" (obj: detachable ANY): detachable G
			-- Result of assignment attempt of `obj' to entity of type G
		do
			if attached {G} obj as l_g then
				Result := l_g
			end
		ensure
			assigned_or_void: Result = obj or Result = default_detachable_value
		end

	default_detachable_value: detachable G
		do
		end

feature -- Output

	out: STRING
			-- <Precursor>
		do
			Result := name
		end

	debug_output: STRING
			-- <Precursor>
		do
			Result := name
		end

feature {NONE} -- Implementation: Access

	internal_name: detachable IMMUTABLE_STRING_8
			-- Storage for once per object `name'

feature {NONE} -- Implementation

	runtime_name: STRING
			-- Name of Eiffel type represented by `Current', using Eiffel style guidelines
			-- as specified in OOSC2 (e.g. COMPARABLE, HASH_TABLE [FOO, BAR], ...)
		external
			"built_in"
		ensure
			name_not_void: Result /= Void
		end

feature -- Features from STRING needed here for the transition period (see convert clause)

	plus alias "+" (other: STRING): STRING
			-- Append a copy of 's' at the end of a copy of the name of the
			-- Eiffel type represented by `Current', then return the Result.
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"[070813] Use 'name + other' instead (or 'out + other' during the transition period)."
		require
			argument_not_void: other /= Void
		do
			Result := name + other
		ensure
			result_exists: Result /= Void
			definition: Result.is_equal (name + other)
		end

	same_string (other: STRING): BOOLEAN
			-- Do the name of the Eiffel type represented by `Current'
			-- and `other' have same character sequence?
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"[070813] Use 'name.same_string (other)' instead (or 'out.same_string (other)' during the transition period)."
		require
			other_not_void: other /= Void
		do
			Result := name.same_string (other)
		ensure
			definition: Result = name.same_string (other)
		end

	is_case_insensitive_equal (other: STRING): BOOLEAN
			-- Is the name of the Eiffel type represented by `Current'
			-- made of same character sequence as `other' regardless
			-- of casing (possibly with a different capacity)?
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"[070813] Use 'name.is_case_insensitive_equal (other)' instead (or 'out.is_case_insensitive_equal (other)' during the transition period)."
		require
			other_not_void: other /= Void
		do
			Result := name.is_case_insensitive_equal (other)
		ensure
			definition: Result = name.is_case_insensitive_equal (other)
		end

	as_lower: STRING
			-- New object with all letters of the name of the Eiffel type
			-- represented by `Current' in lower case.
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"[070813] Use 'name.as_lower' instead (or 'out.as_lower' during the transition period)."
		do
			Result := name.as_lower
		ensure
			as_lower_not_void: Result /= Void
			definition: Result.is_equal (name.as_lower)
		end

	as_upper: STRING
			-- New object with all letters of the name of the Eiffel type
			-- represented by `Current' in upper case.
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"[070813] Use 'name.as_upper' instead (or 'out.as_upper' during the transition period)."
		do
			Result := name.as_upper
		ensure
			as_upper_not_void: Result /= Void
			definition: Result.is_equal (name.as_upper)
		end

	to_readable_string_8: READABLE_STRING_8
			-- Name of type
		obsolete
			"[080717] Use 'name' instead (or 'out' during the transition period)."
		do
			Result := name
		ensure
			to_readable_string_8_not_void: Result /= Void
		end

	to_readable_string_32: READABLE_STRING_32
			-- Name of type
		obsolete
			"[080717] Use 'name' instead (or 'out' during the transition period)."
		do
			Result := name.as_string_32
		ensure
			to_readable_string_32_not_void: Result /= Void
		end

	to_immutable_string_8: READABLE_STRING_8
			-- Name of type
		obsolete
			"[090918] Use 'name' instead (or 'out' during the transition period)."
		do
			Result := name
		ensure
			to_immutable_string_8_not_void: Result /= Void
		end

	to_immutable_string_32: READABLE_STRING_32
			-- Name of type
		obsolete
			"[090918] Use 'name' instead (or 'out' during the transition period)."
		do
			Result := name.as_string_32
		ensure
			to_immutable_string_32_not_void: Result /= Void
		end

	to_string: STRING
			-- Name of type
		obsolete
			"[090918] Use 'name' instead (or 'out' during the transition period)."
		do
			Result := name
		ensure
			to_string_not_void: Result /= Void
		end

end
