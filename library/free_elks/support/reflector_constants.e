note
	description: "Constants to represent abstract types in {REFFLECTOR} and {OBJECT_PROXY}."
	cecil: "The values are in sync with CECIL constants EIF_*_TYPE."
	runtime: "The values represent abstract types used by run-time, e.g. {ISE_RUNTIME}.field_type_of_type."
	date: "$Date: 2013-05-20 16:15:17 -0700 (Mon, 20 May 2013) $"
	revision: "$Revision: 92557 $"

class
	REFLECTOR_CONSTANTS

feature -- Access

	invalid_type: INTEGER = -1
			-- Invalid type id
			
	none_type: INTEGER = -2
			-- Type ID representation for NONE.

	pointer_type: INTEGER = 0
			-- Abstract type ID for predefined type {POINTER}.

	reference_type: INTEGER = 1
			-- Abstract type ID for a reference type.

	character_8_type, character_type: INTEGER = 2
			-- Abstract type ID for predefined type {CHARACTER_8}.

	boolean_type: INTEGER = 3
			-- Abstract type ID for predefined type {BOOLEAN}.

	integer_32_type, integer_type: INTEGER = 4
			-- Abstract type ID for predefined type {INTEGER_32}.

	real_32_type, real_type: INTEGER = 5
			-- Abstract type ID for predefined type {REAL_32}.

	real_64_type, double_type: INTEGER = 6
			-- Abstract type ID for predefined type {REAL_64}.

	expanded_type: INTEGER = 7
			-- Abstract type ID for a non-predefined expanded type.

	bit_type: INTEGER = 8
			-- This type is obsolete and is not used anymore.

	integer_8_type: INTEGER = 9
			-- Abstract type ID for predefined type {INTEGER_8}.

	integer_16_type: INTEGER = 10
			-- Abstract type ID for predefined type {INTEGER_16}.

	integer_64_type: INTEGER = 11
			-- Abstract type ID for predefined type {INTEGER_64}.

	character_32_type, wide_character_type: INTEGER = 12
			-- Abstract type ID for predefined type {CHARACTER_32}.

	natural_8_type: INTEGER = 13
			-- Abstract type ID for predefined type {NATURAL_8}.

	natural_16_type: INTEGER = 14
			-- Abstract type ID for predefined type {NATURAL_16}.

	natural_32_type: INTEGER = 15
			-- Abstract type ID for predefined type {NATURAL_32}.

	natural_64_type: INTEGER = 16
			-- Abstract type ID for predefined type {NATURAL_64}.

	min_predefined_type: INTEGER = -2
	max_predefined_type: INTEGER = 16


note
	copyright: "Copyright (c) 1984-2013, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
