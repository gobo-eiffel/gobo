indexing

	description:

	"Surrogate objects for extension elements (or indeed xsl elements)%
% for which no implementation is available."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ABSENT_EXTENSION_ELEMENT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			may_contain_sequence_constructor, validate, make_style_element
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element


feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER;  a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER) is
			-- Establish invariant.
		do
			is_instruction := True
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		do
			attributes_prepared := True
		end

	validate is
		do
			validated := True
		end
	
	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			last_generated_expression := Void
			if not is_top_level then
				
				-- if there are fallback children, compile the code for the fallback elements
				
				if validation_error = Void then
					create validation_error.make_from_string ("Unknown extension instruction: ", Gexslt_eiffel_type_uri, "UNKNOWN_EXTENSION_INSTRUCTION", Static_error)
				end
				fallback_processing (an_executable, Current)
			end
		end
	
end
