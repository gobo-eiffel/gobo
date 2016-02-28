note

	description:

	"Objects that can be passed to an XM_XPATH_CONTEXT_MAPPING_ITERATOR.%
	%Such objects, when given an XM_XPATH_ITEM, generate a%
	%XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] which delivers%
	%a series of such items, which each in turn become the context item."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_CONTEXT_MAPPING_FUNCTION

feature -- Access

	last_mapped_sequence: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Result from `map'

feature -- Evaluation

	map (a_context: XM_XPATH_CONTEXT)
			-- Map `a_context.context_item' to a sequence
		require
			a_context_not_void: a_context /= Void
		deferred

			-- If an error is detected, then this function should create an XM_XPATH_INVALID_ITERATOR

		ensure
			last_mapped_sequence_not_void: last_mapped_sequence /= Void
		end

end
