note

	description:

		"Name Value Elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"

class GEANT_NAME_VALUE_ELEMENT

inherit

	GEANT_ELEMENT

create

	make

feature -- Access

	name: STRING
			-- Value of xml attribute named `Name_attribute_name' of `xml_element'
		require
			has_name: has_name
		do
			Result := attribute_value (Name_attribute_name)
		ensure
			name_not_void: name /= Void
		end

	value: STRING
			-- Value of xml attribute named `Value_attribute_name' of `xml_element'
		require
			has_value: has_value
		do
			Result := attribute_value (Value_attribute_name)
		ensure
			value_not_void: Result /= Void
		end

feature -- Status report

	has_name: BOOLEAN
			-- Does `xml_element' has an attribute named `Name_attribute_name'
		do
			Result := has_attribute (Name_attribute_name)
		end

	has_value: BOOLEAN
			-- Does `xml_element' has an attribute named `Value_attribute_name'
		do
			Result := has_attribute (Value_attribute_name)
		end

feature {NONE} -- Constants

	Name_attribute_name: STRING
			-- "name" attribute name
		once
			Result := "name"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Value_attribute_name: STRING
			-- Name of xml attribute "value" of subelement <define>
		once
			Result := "value"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
