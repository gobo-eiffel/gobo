note
	description: "Objects that provide instances of {SED_ERROR}."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	author: "Julian Rogers"
	last_editor: "$Author: alexk $"
	date: "$Date: 2020-05-19 14:32:38 +0000 (Tue, 19 May 2020) $"
	revision: "$Revision: 104260 $"

class
	SED_ERROR_FACTORY

feature -- Access

	new_internal_error (a_msg: STRING): SED_ERROR
			-- Generic error message when something fails internally
		require
			a_msg_not_void: a_msg /= Void
		do
			create Result.make_with_string (a_msg)
		ensure
			result_not_void: Result /= Void
		end

	new_exception_error (a_exception: EXCEPTION): SED_ERROR
			-- Generic error message when something fails internally
		require
			a_exception_not_void: a_exception /= Void
		local
			l_msg: STRING_32
		do
			create l_msg.make_from_string_general ("An exception of type {")
			l_msg.append (a_exception.generating_type.name_32)
			if attached a_exception.description as l_message then
				l_msg.append_string_general ("} with message %"")
				l_msg.append_string_general (l_message)
				l_msg.append_string_general ("%" occurred.")
			else
				l_msg.append_string_general ("} occurred.")
			end
			create Result.make_with_string (l_msg)
		ensure
			result_not_void: Result /= Void
		end

	new_unknown_storable_type: SED_ERROR
			-- Storable format could be read but is unknown.
		do
			create Result.make_with_string ("Unknown storable type.")
		end

	new_obsolete_storable_type: SED_ERROR
			-- Obsolete storable format is used.
		do
			create Result.make_with_string
				("Obsolete storable type, it might be possible to retrieve the data with the obsolete deserializer.")
		end

	new_invalid_object_error (a_obj: ANY): SED_ERROR
			-- Object `a_obj' was retrieved but is not valid.
		do
			create Result.make_with_string ({STRING_32} "Invalid retrieved object of type " + a_obj.generating_type.name_32)
		ensure
			result_not_void: Result /= Void
		end

	new_object_mismatch_error (a_obj: ANY): SED_ERROR
			-- Object `a_obj' was retrieved but its content is still mismatched.
		do
			create Result.make_with_string ({STRING_32} "Unfixable object of type " + a_obj.generating_type.name_32)
		ensure
			result_not_void: Result /= Void
		end

	new_format_mismatch (a_old_version, a_new_version: NATURAL_32): SED_ERROR
			-- Return an error when the format is different from what we expected upon retrieval
		do
			create Result.make_with_string ({STRING} "Storable format mismatch, got " + a_old_version.out + " but expected " + a_new_version.out + ".")
		ensure
			result_not_void: Result /= Void
		end

	new_format_mismatch_66: SED_ERROR
			-- Return an error when the format is not using `is_for_fast_retrieval' setting.
		do
			create Result.make_with_string ("Storable created with 6.6 or earlier not using `is_for_fast_retrieval' cannot be retrieved anymore. Contact EiffelSoftware if you need this functionality.")
		ensure
			result_not_void: Result /= Void
		end

	new_missing_type_error (a_stored_type, a_adapted_type: READABLE_STRING_8): SED_ERROR
			-- Return a error representing a missing type `a_stored_type' possibly adapted to `a_adapted_type'.
		require
			a_stored_type_not_void: a_stored_type /= Void
			a_adapted_type_not_void: a_adapted_type /= Void
		do
			if a_stored_type ~ a_adapted_type then
				create Result.make_with_string ("Unknown class type " + a_stored_type)
			else
				create Result.make_with_string ("Unknown class type " + a_stored_type + " and unknown adapted class type " + a_adapted_type)
			end
		ensure
			result_not_void: Result /= Void
		end

	new_missing_attribute_error (a_type_id: INTEGER; a_attribute_name: READABLE_STRING_8): SED_ERROR
			-- Return a error representing a missing attribute named `a_attribute_name' in type `a_type'.
		require
			a_type_id_non_negative: a_type_id >= 0
			a_attribute_name_not_void: a_attribute_name /= Void
		local
			l_type: STRING
		do
			l_type := internal.class_name_of_type (a_type_id)
			create Result.make_with_string ({STRING_32} "No attribute named '" + a_attribute_name.to_string_32 + "' in type " + l_type)
		ensure
			result_not_void: Result /= Void
		end

	new_unknown_attribute_type_error (a_type_id: INTEGER; a_attribute_name: READABLE_STRING_8): SED_ERROR
			-- Return a error representing an attribute whose type is unknown.
		require
			a_type_id_non_negative: a_type_id >= 0
			a_attribute_name_not_void: a_attribute_name /= Void
		local
			l_type: STRING
		do
			l_type := internal.class_name_of_type (a_type_id)
			create Result.make_with_string ({STRING_32} "Attribute named '" + a_attribute_name.to_string_32 + "' in type " + l_type + " has an unknown type")
		ensure
			result_not_void: Result /= Void
		end

	new_storable_version_mismatch_error (a_type_id: INTEGER; a_old_version_str: detachable STRING): SED_ERROR
			-- Return an error representing a mismatch in the storable_version attribute in type `a_type'.
		require
			a_type_id_non_negative: a_type_id >= 0
		local
			l_type: STRING
			l_error_msg: STRING_32
			l_new_version: detachable IMMUTABLE_STRING_8
		do
			l_type := internal.class_name_of_type (a_type_id)
			l_new_version := internal.storable_version_of_type (a_type_id)
			create l_error_msg.make (256)
			l_error_msg.append ({STRING_32} "Different version in class " + l_type + ".%N")
			l_error_msg.append ("Old version: ")
			if a_old_version_str = Void then
				l_error_msg.append ("None")
			else
				l_error_msg.append (a_old_version_str)
			end
			l_error_msg.append ("New version: ")
			if l_new_version = Void then
				l_error_msg.append ("None")
			else
				l_error_msg.append_string_general (l_new_version)
			end
			create Result.make_with_string (l_error_msg)
		ensure
			result_not_void: Result /= Void
		end


	new_attribute_count_mismatch (a_type_id: INTEGER; a_received_attribute_count: INTEGER): SED_ERROR
			-- Return an error representing an attribute count mismatch for type `a_type' with a received attribute count of `a_received_attribute_count'.
		require
			a_type_id_non_negative: a_type_id >= 0
		local
			l_type: STRING
		do
			l_type := internal.class_name_of_type (a_type_id)
			create Result.make_with_string ({STRING_32} "Attribute count mismatch in class " + l_type +
				" Expected " + internal.persistent_field_count_of_type (a_type_id).out + ", Received " + a_received_attribute_count.out)
		ensure
			result_not_void: Result /= Void
		end

	new_attribute_mismatch (a_type_id: INTEGER; a_attribute_name: STRING; a_attribute_type_id, a_received_attribute_type_id: INTEGER): SED_ERROR
			-- Return an error representing an attribute mismatch for attribute `a_attribute_name' of type `a_type' with
		require
			a_type_id_non_negative: a_type_id >= 0
			a_attribute_name_not_void: a_attribute_name /= Void
			a_attribute_type_id_non_negative: a_attribute_type_id >= 0
			a_received_attribute_type_id_non_negative: a_received_attribute_type_id >= 0
		do
			create Result.make_with_string ({STRING_32} "Attribute mismatch in class " +
				internal.class_name_of_type (a_type_id) + " for attribute '" + a_attribute_name +
				"'. Expected " + internal.class_name_of_type (a_attribute_type_id) + ", Received " +
				internal.class_name_of_type (a_received_attribute_type_id))
		ensure
			result_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	internal: REFLECTOR
			-- Once access to internal.
		once
			create Result
		ensure
			result_not_void: Result /= Void
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2020, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
