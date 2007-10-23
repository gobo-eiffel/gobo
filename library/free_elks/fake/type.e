indexing

	description: "Representation of an Eiffel type."
	remark: "At any given time, there is no more than one instance of TYPE representing a given Eiffel type."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

frozen class TYPE [G]

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
	name: {STRING, STRING_GENERAL}

feature -- Access

	name: STRING is
			-- Name of Eiffel type represented by `Current', using Eiffel style guidelines
			-- as specified in OOSC2 (e.g. COMPARABLE, HASH_TABLE [FOO, BAR], ...)
		external
			"built_in"
		ensure
			name_not_void: Result /= Void
		end

	generic_parameter (i: INTEGER): TYPE [ANY] is
			-- `i'-th generic parameter of Eiffel type represented by `Current'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= generic_parameter_count
		external
			"built_in"
		ensure
			generic_parameter_not_void: Result /= Void
		end

	type_id: INTEGER is
			-- Id of the Eiffel type represented by `Current'
		external
			"built_in"
		ensure
			type_id_not_negative: Result >= 0
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := type_id
		end

feature -- Measurement

	generic_parameter_count: INTEGER is
			-- Number of generic parameters in Eiffel type represented by `Current'
		external
			"built_in"
		ensure
			generic_parameter_count_not_negative: Result >= 0
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result := (other = Current)
		end

feature -- Conversion

	adapt alias "[]" (g: G): G is
			-- Adapts `g' or calls necessary conversion routine to adapt `g'
		do
			Result := g
		ensure
			adapted: equal (Result, g)
		end

	attempt alias "#?" (obj: ANY): G is
			-- Result of assignment attempt of `obj' to entity of type G
		do
-- TODO: this is not valid Eiffel.
			print ("TODO: TYPE.attempt not implemented!%N")
--			Result ?= obj
		ensure
			assigned_or_void: Result = obj or Result = default_value
		end

	default_value: G is
			-- Default value for entities declared of Eiffel type represented by `Current'
		do
		end

feature -- Output

	out: STRING is
			-- Name of Eiffel type represented by `Current"
		do
			Result := name
		end

	debug_output: STRING is
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := name
		end

feature -- Features from STRING needed here for the transition period (see convert clause)


	infix "+" (other: STRING): STRING is
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

	same_string (other: STRING): BOOLEAN is
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

	is_case_insensitive_equal (other: STRING): BOOLEAN is
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

	as_lower: STRING is
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

	as_upper: STRING is
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

end
