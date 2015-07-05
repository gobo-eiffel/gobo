note

	description:

	"Objects that can be passed to an XM_XPATH_NODE_MAPPING_ITERATOR.%
	%Such objects, when given an XM_XPATH_NODE, can generate an%
	%XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] which delivers%
	%a series of such items."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NODE_MAPPING_FUNCTION

feature -- Access

	last_node_iterator: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Result from `map_nodes'
		deferred
		end

feature -- Evaluation

	map_nodes (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT)
			-- Map `an_item' to a sequence
		require
			item_not_void: an_item /= Void
			a_context_not_void: a_context /= Void
		deferred

			-- If an error is detected, then this command should create an invalid iterator

		ensure
			result_not_void: last_node_iterator /= Void
		end

end
