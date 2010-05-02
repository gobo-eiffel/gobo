note

	description:

		"Standard tree node factory"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NODE_FACTORY

feature -- Creation

	new_element_node (a_document: XM_XPATH_TREE_DOCUMENT; a_parent: XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
							a_name_code: INTEGER; a_sequence_number: INTEGER): XM_XPATH_TREE_ELEMENT
			-- New element node.
		require
			document_not_void: a_document /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
		do
			create Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
			if a_parent /= Void then
				a_parent.add_child (Result)
			end
		ensure
			new_element_may_be_void_or_in_error: True
		end

end

