indexing
	description:

		"Objects that flatten recusive calls to xsl:functions returning node sequences"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date:  $"
	revision: "$Revision:  $"

class	XM_XSLT_NODE_FUNCTION_CALL_FLATTENER

inherit

	XM_XPATH_NODE_MAPPING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make is
			-- Do nothing.
		do
		end

feature -- Access

	last_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Result from `map_nodes'

feature -- Evaluation

	map_nodes (a_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		local
			l_function_call_package: XM_XSLT_FUNCTION_CALL_PACKAGE
		do
			if a_item.is_error then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (a_item.error_value)
			elseif a_item.is_function_package then
				l_function_call_package ?= a_item
				l_function_call_package.create_node_results_iterator (a_context)
				last_node_iterator := l_function_call_package.last_node_iterator
			else
				check
					node: a_item.is_node
					-- static typing will have ensured this
				end
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (a_item.as_node)
			end
		end
	
end
