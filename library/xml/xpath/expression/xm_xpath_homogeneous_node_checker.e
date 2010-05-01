note

	description:

		"Objects that implement type checking for a homogeneuous node sequence."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_HOMOGENEOUS_NODE_CHECKER

inherit

	XM_XPATH_NODE_MAPPING_FUNCTION

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

create {XM_XPATH_MAPPED_PATH_EXPRESSION}

	make


feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			-- nothing to do
		end

feature -- Access

	last_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Result from `map_nodes'

feature -- Evaluation

	map_nodes (a_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- `a_item' mapped to zero or one items
		do
			check
				a_item_not_void: a_item /= Void
				-- Only used by XM_XPATH_MAPPED_PATH_EXPRESSION which checks for this
			end
			if not a_item.is_node then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string ("Path expressions may not mix atomic values and nodes", Xpath_errors_uri, "XPTY0018", Type_error)
			else
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (a_item.as_node)
			end
		end

end

