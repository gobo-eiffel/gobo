indexing

	description:

		"Define Element"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_DEFINE_ELEMENT

inherit

	GEANT_ELEMENT

creation

	make

feature -- Access

	has_name: BOOLEAN is
			-- Does `xml_element' has an attribute named `Name_attribute_name'
		do
			Result := has_uc_attribute (Name_attribute_name)
		end

	has_value: BOOLEAN is
			-- Does `xml_element' has an attribute named `Value_attribute_name'
		do
			Result := has_uc_attribute (Value_attribute_name)
		end

	name: STRING is
			-- Value of xml attribute named `Name_attribute_name' of `xml_element'
		require
			has_name: has_name
		do
			Result := uc_attribute_value (Name_attribute_name).out
		ensure
			name_not_void: name /= Void
		end

	value: STRING is
			-- Value of xml attribute named `Value_attribute_name' of `xml_element'
		require
			has_value: has_value
		do
			Result := uc_attribute_value (Value_attribute_name).out
		ensure
			value_not_void: Result /= Void
		end

feature {NONE} -- Constants

	Name_attribute_name: UC_STRING is
			-- "name" attribute name
		once
			!! Result.make_from_string ("name")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

	Value_attribute_name: UC_STRING is
			-- Name of xml attribute "value" of subelement <define>
		once
			!! Result.make_from_string ("value")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_DEFINE_ELEMENT

