indexing

	description:

		"Sort records for XM_XSLT_SORTED_ITERATOR"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_SORT_RECORD -- ? [G -> XM_XPATH_ITEM]

creation

	make

feature {NONE} -- Initialization

	make (an_item: XM_XPATH_ITEM; a_key_list: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]; a_count: INTEGER) is
			-- Establish invariant.
		require
			item_not_void: an_item /= Void
			key_list_not_void: a_key_list /= Void
			strictly_positive_record_number: a_count > 0
		do
			item := an_item
			key_list := a_key_list
			record_number := a_count
		ensure
			item_set: item = an_item
			key_list_set: key_list = a_key_list
			record_number_set: record_number = a_count
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Item

	key_list: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]
			-- Evaluated sort keys

	record_number: INTEGER
			-- Position of `item' in original sequence
	
invariant

	item_not_void: item /= Void
	key_list_not_void: key_list /= Void
	strictly_positive_record_number: record_number > 0

end
	
