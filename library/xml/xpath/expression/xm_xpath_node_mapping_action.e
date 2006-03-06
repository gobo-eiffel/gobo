indexing

	description:

	"Objects represent the action to be taken for each item in the%
	% source sequence. It acts as the mapping function for the%
	% mapping iterator"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NODE_MAPPING_ACTION

inherit

	XM_XPATH_NODE_MAPPING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make (a_context: XM_XPATH_CONTEXT; a_slot_number: INTEGER; an_action: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			context_not_void: a_context /= Void
			action_not_void: an_action /= Void
			strictly_positive_slot_number: a_slot_number > 0
		do
			context := a_context
			action := an_action
			slot_number := a_slot_number
		ensure
			context_set: context = a_context
			action_set: action = an_action
			slot_number_set: slot_number = a_slot_number
		end

feature -- Access

	last_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Result from `map_nodes'

feature -- Evaluation

	map_nodes (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		do
			context.set_local_variable (an_item.as_item_value, slot_number)
			action.create_node_iterator (context)
			last_node_iterator := action.last_node_iterator
		end

feature {NONE} -- Implementation

	context: XM_XPATH_CONTEXT
			-- Evaluation context

	slot_number: INTEGER
			-- Slot number for the range variable

	action: XM_XPATH_EXPRESSION
			-- Mapped action

end
