note

	description:

		"gexslt:function element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007-2018, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_MEMO_FUNCTION

inherit

	XM_XSLT_FUNCTION
		redefine
			make_style_element
		end

create

	make_style_element

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration)
			-- Establish invariant.
		do
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
			is_memo_function := True
		end

end
