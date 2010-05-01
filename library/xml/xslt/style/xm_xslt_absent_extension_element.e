note

	description:

	"Surrogate objects for extension elements (or indeed xsl elements)%
% for which no implementation is available."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ABSENT_EXTENSION_ELEMENT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			may_contain_sequence_constructor, validate,make_style_element,
			process_all_attributes, validate_subtree, is_absent_extension_element
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
			-- Establish invariant.
		do
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
			is_instruction := True
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

	is_absent_extension_element: BOOLEAN is
			-- Is `Current' and `XM_XSLT_ABSENT_EXTENSION_ELEMENT'?
		do
			Result := True
		ensure then
			absent_extension_element: Result = True
		end

feature -- Basic operations

	process_all_attributes is
			-- Process the attributes of this element and all its children.
		do
			if is_top_level and is_forwards_compatible_processing_enabled then
				-- nothing to do
			else
				Precursor
			end
			attributes_prepared := True
		end

	prepare_attributes is
			-- Set the attribute list for the element.
		do
			attributes_prepared := True
		end

	validate is
		do
			validated := True
		end

	validate_subtree is
			-- Recursively walk through the stylesheet to validate all nodes.
		do
			if is_top_level and is_forwards_compatible_processing_enabled then
				children_validated := True
				post_validate
			else
				Precursor
			end
			validated := True
		end

	compile (a_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			last_generated_expression := Void
			if not is_top_level then
				
				-- if there are fallback children, compile the code for the fallback elements
				
				if validation_error = Void then
					create validation_error.make_from_string ("Unknown extension instruction: ", Gexslt_eiffel_type_uri, "UNKNOWN_EXTENSION_INSTRUCTION", Static_error)
				end
				fallback_processing (a_executable, Current)
			end
		end

invariant

	serves_as_fake_instruction: is_instruction

end
