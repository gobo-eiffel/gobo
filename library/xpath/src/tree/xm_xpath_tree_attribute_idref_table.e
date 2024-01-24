note

	description:

		"Objects that support the XPath idref() function against tiny trees"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TREE_ATTRIBUTE_IDREF_TABLE

inherit

	ANY

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_AXIS
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_tree: XM_XPATH_TREE_DOCUMENT)
			-- Establish invariant.
		require
			tree_not_void: a_tree /= Void
		local
			an_iterator, another_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			an_attribute: XM_XPATH_TREE_ATTRIBUTE
			a_cursor: DS_LIST_CURSOR [STRING]
			a_splitter: ST_SPLITTER
			an_idref: STRING
			a_list: DS_ARRAYED_LIST [XM_XPATH_TREE_ATTRIBUTE]
		do
			create mapping_table.make_with_equality_testers (10, Void, string_equality_tester)
			an_iterator := a_tree.new_axis_iterator_with_node_test (Descendant_axis, element_node_kind_test)
			from an_iterator.start until an_iterator.after loop
				another_iterator := an_iterator.item.new_axis_iterator (Attribute_axis)
				from another_iterator.start until another_iterator.after loop
					an_attribute := another_iterator.item.as_tree_node.as_tree_attribute
					if an_attribute.is_idrefs then
						create a_splitter.make
						a_cursor := a_splitter.split (an_attribute.string_value).new_cursor
						from a_cursor.start until a_cursor.after loop
							an_idref := a_cursor.item
							if mapping_table.has (an_idref) then
								a_list := mapping_table.item (an_idref)
							else
								create a_list.make_default
								mapping_table.put_new (a_list, an_idref)
							end
							if not a_list.has (an_attribute) then
								a_list.force_last (an_attribute)
							end
							a_cursor.forth
						end
					end
					another_iterator.forth
				end
				an_iterator.forth
			end
		end

feature -- Access

	new_iterator (some_idrefs: DS_LIST [STRING]): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- New iterator over `some_idrefs'
		require
			idrefs_not_empty: some_idrefs /= Void and then not some_idrefs.is_empty
		local
			a_list: DS_ARRAYED_LIST [XM_XPATH_NODE]
			an_idref_list: DS_ARRAYED_LIST [XM_XPATH_TREE_ATTRIBUTE]
			an_attribute_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_TREE_ATTRIBUTE]
			an_idrefs_cursor: DS_LIST_CURSOR [STRING]
			an_empty_iterator: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_TREE_NODE]
			a_comparer: XM_XPATH_LOCAL_ORDER_COMPARER
		do
			create a_list.make_default
			from an_idrefs_cursor := some_idrefs.new_cursor; an_idrefs_cursor.start until an_idrefs_cursor.after loop
				if mapping_table.has (an_idrefs_cursor.item) then
					an_idref_list := mapping_table.item (an_idrefs_cursor.item)
					from an_attribute_cursor := an_idref_list.new_cursor; an_attribute_cursor.start until an_attribute_cursor.after loop
						if not a_list.has (an_attribute_cursor.item) then
							a_list.force_last (an_attribute_cursor.item)
						end
						an_attribute_cursor.forth
					end
				end
				an_idrefs_cursor.forth
			end
			create an_empty_iterator.make
			create {XM_XPATH_PROGRESSIVE_NODE_ITERATOR} Result.make (a_list, an_empty_iterator, Void)
			create a_comparer
			create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} Result.make (Result, a_comparer)
		ensure
			iterator_before: Result /= Void and then Result.before
		end


feature {NONE} -- Implementation

	mapping_table: DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_TREE_ATTRIBUTE], STRING]
			-- Mapping of IDREFs to lists of attribute nodes

invariant

	mapping_table_not_void: mapping_table /= Void

end
