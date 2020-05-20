note
	description: "Representation of an Eiffel type."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

frozen class
	TYPE [G]

inherit
	HASHABLE
		rename
			default as any_default
		redefine
			is_equal, out
		end

	PART_COMPARABLE
		rename
			default as any_default,
			is_less as is_strictly_conforming_to alias "<",
			is_less_equal as is_conforming_to alias "<="
		redefine
			is_conforming_to, is_equal, out
		end

	DEBUG_OUTPUT
		rename
			default as any_default
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
	to_string_8: {STRING_8, READABLE_STRING_8},
	to_string_32: {STRING_32, READABLE_STRING_32, STRING_GENERAL, READABLE_STRING_GENERAL}

feature -- Access

	name_32: IMMUTABLE_STRING_32
			-- Name of Eiffel type represented by `Current', using Eiffel style guidelines
			-- as specified in OOSC2 (e.g. COMPARABLE, HASH_TABLE [FOO, BAR], ...)
		do
			Result := internal_name_32
			if not attached Result then
				create Result.make_from_string_general (runtime_name)
				internal_name_32 := Result
			end
		ensure
			name_32_attached: attached Result
		end

	name: IMMUTABLE_STRING_8
			-- Name of Eiffel type represented by `Current', using Eiffel style guidelines
			-- as specified in OOSC2 (e.g. COMPARABLE, HASH_TABLE [FOO, BAR], ...)
			-- Consider using `name_32` instead.
		local
			s: like runtime_name
		do
			Result := internal_name
			if not attached Result then
				s := runtime_name
				create Result.make_from_string
					(if attached {READABLE_STRING_8} s as s8 then
						s8
					else
						{UTF_CONVERTER}.utf_32_string_to_utf_8_string_8 (s)
					end)
				internal_name := Result
			end
		ensure
			name_not_void: Result /= Void
		end

	generic_parameter_type (i: INTEGER): TYPE [detachable ANY]
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

feature -- Status report

	has_default: BOOLEAN
			-- Is current type a type that has a default value?
			-- I.e. a detachable type or an expanded type.
		external
			"built_in"
		end

	is_deferred: BOOLEAN
			-- Is current type a deferred type?
		external
			"built_in"
		end

	is_expanded: BOOLEAN
			-- Is current type an expanded type?
		external
			"built_in"
		end

	is_attached: BOOLEAN
			-- Is current type attached?
		external
			"built_in"
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result := type_id = other.type_id
		end

	is_strictly_conforming_to alias "<" (other: like Current): BOOLEAN
			-- Does type represented by `Current' conform to type represented by `other' and differ from it?
		do
			Result := type_id /= other.type_id and then is_conforming_to (other)
		end

	is_conforming_to alias "<=" (other: like Current): BOOLEAN
			-- Does type represented by `Current' conform to type represented by `other'?
		do
			Result := {ISE_RUNTIME}.type_conforms_to (type_id, other.type_id)
		end

feature -- Conversion

	adapt alias "[]" (g: detachable G): detachable G
			-- Adapts `g' or calls necessary conversion routine to adapt `g'
		do
			Result := g
		ensure
			adapted: Result ~ g
		end

	attempted alias "/" (obj: detachable separate ANY): detachable G
			-- If possible, `obj' understood as an object of type `G';
			-- If not, default detachable value of type `G'..
		do
			if attached {G} obj as l_g then
				Result := l_g
			end
		ensure
			assigned_or_void: Result = obj or Result = default_detachable_value
		end

	attempt alias "#?" (obj: detachable separate ANY): detachable G
			-- Result of assignment attempt of `obj' to entity of type G
		obsolete
			"Use `attempted' or its operator alias `/'. [2017-05-31]"
		do
			Result := attempted (obj)
		ensure
			assigned_or_void: Result = obj or Result = default_detachable_value
		end

	default_detachable_value: detachable G
		do
		end

	default: G
		require
			has_default: has_default
		external
			"built_in"
		end

feature -- Output

	out: STRING
			-- <Precursor>
		do
			if attached {READABLE_STRING} name_32 as n then
				create Result.make_from_string (n)
			elseif attached {READABLE_STRING} name as n then
				create Result.make_from_string (n)
			else
				check known_string_type: False then end
			end
		end

	debug_output: READABLE_STRING_32
			-- <Precursor>
		do
			Result := name_32
		end

feature -- Features from STRING needed here for the transition period (see convert clause)

	plus alias "+" (other: STRING): STRING
			-- Append a copy of 's' at the end of a copy of the name of the
			-- Eiffel type represented by `Current', then return the Result.
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"Use 'name_32 + other' instead. [2017-05-31]"
		require
			argument_not_void: other /= Void
		do
			create Result.make (name.count + other.count)
			Result.append (name)
			Result.append (other)
		ensure
			result_exists: Result /= Void
			definition: Result.same_string (name + other)
		end

	same_string (other: STRING): BOOLEAN
			-- Do the name of the Eiffel type represented by `Current'
			-- and `other' have same character sequence?
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"Use 'name_32.same_string (other)' instead. [2017-05-31]"
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
			"Use 'name_32.is_case_insensitive_equal (other)' instead. [2017-05-31]"
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
			"Use 'name_32.as_lower' instead. [2017-05-31]"
		do
			create Result.make_from_string (name)
			Result.to_lower
		ensure
			as_lower_not_void: Result /= Void
			definition: Result.same_string (name.as_lower)
		end

	as_upper: STRING
			-- New object with all letters of the name of the Eiffel type
			-- represented by `Current' in upper case.
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"Use 'name_32.as_upper' instead. [2017-05-31]"
		do
			create Result.make_from_string (name)
			Result.to_upper
		ensure
			as_upper_not_void: Result /= Void
			definition: Result.same_string (name.as_upper)
		end

	to_string_8: STRING_8
		obsolete
			"Use `name_32' instead. [2017-05-31]"
		do
			create Result.make_from_string (name)
		ensure
			to_string_8_not_void: Result /= Void
		end

	to_string_32: STRING_32
			-- Name of type
		obsolete
			"Use 'name_32' instead. [2017-05-31]"
		do
			create Result.make_from_string (name_32)
		ensure
			to_string_32_not_void: Result /= Void
		end

feature {NONE} -- Implementation: Access

	internal_name_32: detachable IMMUTABLE_STRING_32
			-- Storage for once per object `name_32`.
		note option: stable, transient attribute end

	internal_name: detachable IMMUTABLE_STRING_8
			-- Storage for once per object `name`.
		note option: stable, transient attribute end

feature {NONE} -- Implementation

	runtime_name: STRING
			-- Name of Eiffel type represented by `Current', using Eiffel style guidelines
			-- as specified in OOSC2 (e.g. COMPARABLE, HASH_TABLE [FOO, BAR], ...)
		external
			"built_in"
		ensure
			name_not_void: Result /= Void
		end

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
