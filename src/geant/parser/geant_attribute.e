indexing

	description:

		"XML attributes"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_ATTRIBUTE

inherit

	ANY

	UC_UNICODE_FACTORY
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_value: like value) is
			-- Create a new attribute with name
			-- `a_name' and value `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_value_not_void: a_value /= Void
		do
			set_name (a_name)
			set_value (a_value)
		ensure
			name_set: name = a_name
			value_set: value = a_value
		end

feature -- Access

	name: UC_STRING
			-- Name of attribute

	value: UC_STRING
			-- Value of attribute

feature -- Setting

	set_name (a_name: like name) is
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_value (a_value: like value) is
			-- Set `value' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

feature -- Conversion

	as_xml: UC_STRING is
			-- XML representation
		do
			Result := new_unicode_string ("")
			Result.append_uc_string (name)
			Result.append_string ("=%"")
			Result.append_uc_string (value)
			Result.append_string ("%"")
		ensure
			as_xml_not_void: Result /= Void
		end

invariant

	name_not_void: name /= Void
	name_not_empty: name.count > 0
	value_not_void: value /= Void

end -- class GEANT_ATTRIBUTE
