note

	description:

		"[
			Objects that can be passed to an XM_XPATH_ITEM_MAPPING_ITERATOR.
			Such objects, when given an XM_XPATH_ITEM, generate
			zero or one items.
		]"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007-2015, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_ITEM_MAPPING_FUNCTION

feature -- Access

	mapped_item (a_item: XM_XPATH_ITEM): detachable XM_XPATH_ITEM
			-- `a_item' mapped to zero or one items
		require
			a_item_may_be_void: True
		deferred
		ensure
			result_may_be_void: True
		end

end
