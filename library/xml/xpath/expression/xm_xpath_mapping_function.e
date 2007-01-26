indexing

	description:

	"Objects that can be passed to an XM_XPATH_MAPPING_ITERATOR.%
	%Such objects, when given an XM_XPATH_ITEM, can generate an%
	%XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] which delivers%
	%a series of such items."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_MAPPING_FUNCTION

feature -- Access

	last_mapped_item: XM_XPATH_MAPPED_ITEM
			-- Result from `map'

feature -- Evaluation

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		require
			item_not_void: an_item /= Void
		deferred

			-- If an error is detected, then this function should do: create last_mapped_item.make_item
			--  passing it an item in error.
			-- Note that XM_XPATH_CARDINALITY_CHECKER can set `last_mapped_item' to  `Void'

		end

end
