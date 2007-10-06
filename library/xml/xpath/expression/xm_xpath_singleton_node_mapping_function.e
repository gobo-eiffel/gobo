indexing

	description:

		"[
			Objects that can be passed to an XM_XPATH_SINGLETON_NODE_MAPPING_ITERATOR.
			Such objects, when given an XM_XPATH_NODE, generate
			zero or one nodes.
		]"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SINGLETON_NODE_MAPPING_FUNCTION

feature -- Access

	mapped_node (a_node: XM_XPATH_NODE): XM_XPATH_NODE is
			-- `a_node' mapped to zero or one nodes
		require
			a_node_may_be_void: True
		deferred
		ensure
			result_may_be_void: True
		end

end
