indexing

	description:

		"Warning: Unknown option name"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_UNKNOWN_OPTION_NAME_WARNING

inherit

	ET_XACE_WARNING
	KL_IMPORTED_STRING_ROUTINES

	ET_XACE_ELEMENT_NAMES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_element: XM_ELEMENT; a_position: XM_POSITION) is
			-- Create a warning reporting that the value of the attribute "name"
			-- in the "option" elment `an_element' is unknown.
		require
			an_element_not_void: an_element /= Void
			an_element_has_option_as_name: STRING_.same_string (an_element.name, uc_option)
			an_element_has_name_attribute: an_element.has_attribute_by_name (uc_name)
			a_name_attribute_not_empty: an_element.attribute_by_name (uc_name).value.count > 0
			a_position_not_void: a_position /= Void
		do
			create parameters.make (1, 2)
			parameters.put (an_element.attribute_by_name (uc_name).value, 1)
			parameters.put (a_position.out, 2)
		end

feature -- Access

	default_template: STRING is "option name '$1' in option-element is unknown $2"
			-- Default template used to built the error message

	code: STRING is "XA0012"
			-- Error code

end
