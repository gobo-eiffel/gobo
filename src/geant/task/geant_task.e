indexing

	description:

		"deferred task which supports creation of the object using a XML definition"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


deferred class GEANT_TASK
	inherit
		GEANT_COMMAND
		GEANT_ELEMENT_NAMES

feature
	load_from_element(a_el : GEANT_ELEMENT) is
			-- Initialize from a_el.
		require
			element_not_void : a_el /= Void
		deferred
		end

feature -- auxiliar
--------------

	get_attribute_value_with_default(a_el : GEANT_ELEMENT; a_attr_name, a_default_attr_value : STRING) : STRING is
		local
			uc_name		: UC_STRING
			uc_value	: UC_STRING
		do
			!!uc_name.make_from_string(a_attr_name)
			!!uc_value.make_from_string(a_default_attr_value)
			if a_el.has_attribute(uc_name) then
				uc_value := a_el.get_attributevalue_by_name(uc_name)
			end

			Result := get_attribute_value_with_default_uc(a_el, uc_name, uc_value).out
			
		end

	get_attribute_value(a_el : GEANT_ELEMENT; a_attr_name : STRING) : STRING is
		local
			ucs	: UC_STRING

		do
			!!ucs.make_from_string(a_attr_name)
			Result := a_el.get_attributevalue_by_name(ucs).out
		end

	get_boolean_value_with_default(a_el : GEANT_ELEMENT; a_attr_name : STRING; a_default_value : BOOLEAN) : BOOLEAN is
		local
			ucs_attr_name	: UC_STRING
		do
			!!ucs_attr_name.make_from_string(a_attr_name)
			Result := get_boolean_value_with_default_uc(a_el, ucs_attr_name, a_default_value)
		end

	get_boolean_value(a_el : GEANT_ELEMENT; a_attr_name : STRING) : BOOLEAN is
		local
			ucs_attr_name	: UC_STRING
		do
			!!ucs_attr_name.make_from_string(a_attr_name)
			Result := get_boolean_value_uc(a_el, ucs_attr_name)
		end


	has_attribute(a_el : GEANT_ELEMENT; a_attr_name : STRING) : BOOLEAN is
		local
			ucs	: UC_STRING
		do
			!!ucs.make_from_string(a_attr_name)
			Result := has_attribute_uc(a_el, ucs)
		end


	feature -- unicode versions

	get_attribute_value_with_default_uc(a_el : GEANT_ELEMENT; a_attr_name, a_default_attr_value : UC_STRING) : UC_STRING is
		do
			Result := a_default_attr_value
			if a_el.has_attribute(a_attr_name) then
				Result := a_el.get_attributevalue_by_name(a_attr_name)
			end
		
		end

	get_attribute_value_uc(a_el : GEANT_ELEMENT; a_attr_name : UC_STRING) : UC_STRING is
		require
			attribute_exists : a_el.has_attribute(a_attr_name)
		do
			Result := a_el.get_attributevalue_by_name(a_attr_name)
		end


	get_boolean_value_with_default_uc(a_el : GEANT_ELEMENT; a_attr_name : UC_STRING; a_default_value : BOOLEAN) : BOOLEAN is
		do
			if not a_el.has_attribute(a_attr_name) then
				Result := a_default_value
			else
				Result := get_boolean_value_uc(a_el, a_attr_name)
			end
		end


	get_boolean_value_uc(a_el : GEANT_ELEMENT; a_attr_name : UC_STRING) : BOOLEAN is
		require
			attribute_exists : a_el.has_attribute(a_attr_name)
		local
			ucs	: UC_STRING
		do
			ucs := get_attribute_value_uc(a_el, a_attr_name)
			check ucs /= void and then ucs.count > 0 end

			if Attribute_value_true.is_equal(ucs) then
				Result := true
			elseif Attribute_value_false.is_equal(ucs) then
				Result := false
			else
				print("WARNING: wrong value (" + ucs.out + ") for attribute " + a_attr_name.out + " Valid values are `true' and `false'. Using to `false' now.")
				Result := false
			end

		end

	has_attribute_uc(a_el : GEANT_ELEMENT; a_attr_name : UC_STRING) : BOOLEAN is
		do
			Result := a_el.has_attribute(a_attr_name)
		end

end
