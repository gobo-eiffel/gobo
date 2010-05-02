note

	description:

		"Objects that atomize a sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIZING_FUNCTION

inherit

	XM_XPATH_MAPPING_FUNCTION

create {XM_XPATH_SHARED_ATOMIZING_FUNCTION}

	make

feature {NONE} -- Initialization

	make
			-- Do nothing.
		do
		end

feature -- Access

	-- `new_atomizing_iterator' actually returns an iterator over XM_XPATH_ATOMIC_VALUE, but problems
	--  with generics make this too much hassle to implement - nor is there a need.

	new_atomizing_iterator (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- New atomiziong iterator
		require
			base_iterator_not_void: a_base_iterator /= Void
		do
			create {XM_XPATH_MAPPING_ITERATOR} Result.make (a_base_iterator, Current, Void)
		ensure
			result_not_void: Result /= Void
		end

feature -- Evaluation

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT)
			-- Map `an_item' to a sequence
		do
			if an_item.is_node then
				create last_mapped_item.make_sequence (an_item.as_node.typed_value)
			else
				create last_mapped_item.make_item (an_item)
			end
		end

end


