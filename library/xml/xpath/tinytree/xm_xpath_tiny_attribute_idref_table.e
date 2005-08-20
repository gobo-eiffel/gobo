indexing

	description:

		"Objects that support the XPath idref() function against tiny trees"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_ATTRIBUTE_IDREF_TABLE

inherit

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end


		-- N.B. This class can only be used when the tree is built from an infoset
		--      (e.g. Basic XSLT level), as it takes advantage of the limitation
		--       of ID/IDREF(S) being on attributes only, and so the attribute
		--       number can be used for sorting in document order

create

	make

feature {NONE} -- Initialization

	make (a_tree: XM_XPATH_TINY_FOREST) is
			-- Establish invariant.
		require
			tree_exists: a_tree /= Void
		do
			tree := a_tree
			create mapping_table.make_with_equality_testers (10, Void, string_equality_tester)
		ensure
			tree_set: tree = a_tree
		end

feature -- Access

	has (an_attribute_number: INTEGER; an_idref: STRING): BOOLEAN is
			-- Is `an_attribute_number' mapped from `an_idref'?
		require
			idref_not_empty: an_idref /= Void and then not an_idref.is_empty
		do
			if mapping_table.has (an_idref) then
				Result := mapping_table.item (an_idref).has (an_attribute_number)
			end
		end

	new_iterator (some_idrefs: DS_LIST [STRING]): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New iterator over `some_idrefs'
		require
			idrefs_not_empty: some_idrefs /= Void and then not some_idrefs.is_empty
		local
			a_list, an_idref_list: DS_ARRAYED_LIST [INTEGER]
			an_attribute_list: DS_ARRAYED_LIST [XM_XPATH_TINY_ATTRIBUTE]
			an_attribute_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			an_idrefs_cursor: DS_LIST_CURSOR [STRING]
			an_empty_iterator: XM_XPATH_EMPTY_ITERATOR
			a_sorter: DS_QUICK_SORTER [INTEGER]
			a_comparer: KL_COMPARABLE_COMPARATOR [INTEGER]
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
			create a_comparer.make
			create a_sorter.make (a_comparer)
			a_list.sort (a_sorter)
			create an_attribute_list.make (a_list.count)
			from an_attribute_cursor := a_list.new_cursor; an_attribute_cursor.start until an_attribute_cursor.after loop
				an_attribute_list.put_last (tree.retrieve_attribute_node (an_attribute_cursor.item))
				an_attribute_cursor.forth
			end
			create an_empty_iterator.make
			create {XM_XPATH_PROGRESSIVE_NODE_ITERATOR} Result.make (an_attribute_list, an_empty_iterator)
		ensure
			iterator_before: Result /= Void and then Result.before
		end

feature -- element change

	register (an_attribute_number: INTEGER; an_idref: STRING) is
			-- Register `an_attribute_number' against `an_idref'.
		require
			idref_not_empty: an_idref /= Void and then not an_idref.is_empty
			not_already_registered: not has (an_attribute_number, an_idref)
		local
			a_list: DS_ARRAYED_LIST [INTEGER]
		do
			if not mapping_table.has (an_idref) then
				create a_list.make_default
				mapping_table.force_new (a_list, an_idref)
			else
				a_list := mapping_table.item (an_idref)
			end
			a_list.force_last (an_attribute_number)
		ensure
			registered: has (an_attribute_number, an_idref)
		end

feature {NONE} -- Implementation

	tree: XM_XPATH_TINY_FOREST
			-- Document tree

	mapping_table: DS_HASH_TABLE [DS_ARRAYED_LIST [INTEGER], STRING]
			-- Mapping of IDREFs to lists of attribute numbers
	
invariant

	mapping_table_exists: mapping_table /= Void
	tree_exists: tree /= Void

end
	
