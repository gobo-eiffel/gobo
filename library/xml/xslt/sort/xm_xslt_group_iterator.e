indexing

	description:

		"Iterators over groups. `item' Always points to first item in group"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XSLT_GROUP_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

	XM_XPATH_ERROR_TYPES

feature -- Access

	current_grouping_key: XM_XPATH_ATOMIC_VALUE is
			-- Grouping key for current group;
			-- (or `Void' for group-starting/ending-with)
		deferred
		end

feature -- Evaluation

	current_group_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the members of the current group, in population order.
		deferred
		end

end
	
