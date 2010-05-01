note

	description:

		"Print DTD declaration events"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_DTD_PRETTY_PRINT_FILTER

inherit
	
	XM_DTD_CALLBACKS_FILTER
		redefine
			on_doctype,
			on_element_declaration,
			on_attribute_declaration,
			on_entity_declaration,
			on_notation_declaration
		end
	
	XM_OUTPUT
	
create

	make_null,
	set_next

feature -- Document type definition callbacks

	on_doctype (a_name: STRING; an_id: XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN) is
			-- Document type declaration.
		do
			output ("<!DOCTYPE ")
			output (a_name)
			if an_id /= Void then
				output (" ")
				output (an_id.out)
			end
			output (">")
			output_new_line
			Precursor (a_name, an_id, has_internal_subset)
		end
		
	on_element_declaration (a_name: STRING; a_model: XM_DTD_ELEMENT_CONTENT) is
		do
			output ("<!ELEMENT ")
			output (a_name)
			output (" ")
			output (a_model.out)
			output (">")
			output_new_line
			Precursor (a_name, a_model)
		end
		
	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		do
			output ("<!ATTLIST ")
			output (an_element_name)
			output (" ")
			output (a_model.out)
			output (">")
			output_new_line
			Precursor (an_element_name, a_name, a_model)
		end
		
	on_entity_declaration (entity_name: STRING; is_parameter: BOOLEAN; value: STRING;
		an_id: XM_DTD_EXTERNAL_ID; notation_name: STRING) is
			-- Entity declaration.
		do
			output ("<!ENTITY ")
			if is_parameter then
				output ("%% ")
			end
			output (entity_name)
			if value /= Void then
				output (" %"")
				output (value)
				output ("%"")
			else
				if an_id /= Void then
					output (an_id.out)
				end
				if notation_name /= Void then
					output ("NOTATION ")
					output (notation_name)
				end
			end
			output (">")
			output_new_line
			Precursor (entity_name, is_parameter, value, an_id, notation_name)
		end

	on_notation_declaration (notation_name: STRING; an_id: XM_DTD_EXTERNAL_ID) is
			-- Notation declaration.
		do
			output ("<!NOTATION ")
			output (an_id.out)
			output_new_line
			output (">")
			Precursor (notation_name, an_id)
		end

feature {NONE} -- Output

	output_new_line is
		do
			output ("%N")
		end
		
end
