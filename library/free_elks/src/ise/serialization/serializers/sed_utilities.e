note
	description: "Utilities for serializing/deserializing objects"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2013-03-04 22:57:52 +0000 (Mon, 04 Mar 2013) $"
	revision: "$Revision: 91317 $"

class
	SED_UTILITIES

feature {NONE} -- Implementation

	is_void_safe: BOOLEAN
			-- Is current system compiled in void-safe mode?
		once
				-- When compiled in non-void-safe mode the `detachable' keyword is discarded
				-- and thus both TYPE instance should be the same and thus we will return False.
			Result := {SPECIAL [ANY]} /= {SPECIAL [detachable ANY]}
		end

	is_special_flag: NATURAL_8 = 0x01
	is_tuple_flag: NATURAL_8 = 0x02
			-- Various flags for storing objects

	abstract_type (a_type_id: INTEGER): INTEGER
			-- Abstract type of `a_type_id'.
		require
			a_type_id_non_negative: a_type_id >= 0
		local
			l_spec_mapping: like special_type_mapping
		do
			l_spec_mapping := special_type_mapping
			l_spec_mapping.search (a_type_id)
			if l_spec_mapping.found then
				Result := l_spec_mapping.found_item
			else
				Result := {REFLECTOR_CONSTANTS}.reference_type
			end
		end

	special_type_mapping: HASH_TABLE [INTEGER, INTEGER]
			-- Mapping betwwen dynamic type of SPECIAL instances
			-- to abstract element types.
		once
			create Result.make (10)
			Result.put ({REFLECTOR_CONSTANTS}.boolean_type, ({BOOLEAN}).type_id)
			Result.put ({REFLECTOR_CONSTANTS}.character_8_type, ({CHARACTER_8}).type_id)
			Result.put ({REFLECTOR_CONSTANTS}.character_32_type, ({CHARACTER_32}).type_id)

			Result.put ({REFLECTOR_CONSTANTS}.natural_8_type, ({NATURAL_8}).type_id)
			Result.put ({REFLECTOR_CONSTANTS}.natural_16_type, ({NATURAL_16}).type_id)
			Result.put ({REFLECTOR_CONSTANTS}.natural_32_type, ({NATURAL_32}).type_id)
			Result.put ({REFLECTOR_CONSTANTS}.natural_64_type, ({NATURAL_64}).type_id)

			Result.put ({REFLECTOR_CONSTANTS}.integer_8_type, ({INTEGER_8}).type_id)
			Result.put ({REFLECTOR_CONSTANTS}.integer_16_type, ({INTEGER_16}).type_id)
			Result.put ({REFLECTOR_CONSTANTS}.integer_32_type, ({INTEGER_32}).type_id)
			Result.put ({REFLECTOR_CONSTANTS}.integer_64_type, ({INTEGER_64}).type_id)

			Result.put ({REFLECTOR_CONSTANTS}.real_32_type, ({REAL_32}).type_id)
			Result.put ({REFLECTOR_CONSTANTS}.real_64_type, ({REAL_64}).type_id)

			Result.put ({REFLECTOR_CONSTANTS}.pointer_type, ({POINTER}).type_id)
		ensure
			special_type_mapping_not_void: Result /= Void
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2013, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"






end
