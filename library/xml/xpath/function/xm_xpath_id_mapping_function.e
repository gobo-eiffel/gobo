note

	description:

		"Objects which map documents to nodes identified by ID"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ID_MAPPING_FUNCTION

inherit

	XM_XPATH_NODE_MAPPING_FUNCTION

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_DOCUMENT) is
			-- Establish invariant.
		require
			document_not_void: a_document /= Void
		do
			document := a_document
		ensure
			document_set: document = a_document
		end

feature -- Access

	document: XM_XPATH_DOCUMENT
			-- Document to which keys refer

	last_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Result from `map_nodes'

feature -- Evaluation
	
	map_nodes (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		local
			a_splitter: ST_SPLITTER
			some_idrefs: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			an_element: XM_XPATH_ELEMENT
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
			a_list: DS_ARRAYED_LIST [XM_XPATH_ELEMENT]
		do
			create a_splitter.make
			some_idrefs := a_splitter.split (an_item.string_value)
			if some_idrefs.count = 1 then
				an_element := document.selected_id (some_idrefs.item (1))
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (an_element)
			else
				create a_list.make (some_idrefs.count)
				from a_cursor := some_idrefs.new_cursor; a_cursor.start until a_cursor.after loop
					an_element := document.selected_id (a_cursor.item)
					if an_element /= Void and then not a_list.has (an_element) then a_list.put_last (an_element) end
					a_cursor.forth
				end
				create a_sequence_extent.make_from_list (a_list)
				last_node_iterator := a_sequence_extent.node_iterator (False)
			end
		end

invariant

	document_not_void: document /= Void

end

