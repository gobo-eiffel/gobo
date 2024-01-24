note

	description:

	"Objects represent the action to be taken for each item in the%
	% source sequence. It acts as the mapping function for the%
	% mapping iterator"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_MAPPING_ACTION

inherit

	XM_XPATH_MAPPING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make (a_context: XM_XPATH_CONTEXT; a_slot_number: INTEGER; an_action: XM_XPATH_EXPRESSION)
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

feature -- Evaluation

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT)
			-- Map `an_item' to a sequence
		do
			context.set_local_variable (an_item.as_item_value, slot_number)
			action.create_iterator (context)
			check postcondition_of_create_iterator: attached action.last_iterator as l_action_last_iterator then
				create last_mapped_item.make_sequence (l_action_last_iterator)
			end
		end

feature {NONE} -- Implementation

	context: XM_XPATH_CONTEXT
			-- Evaluation context

	slot_number: INTEGER
			-- Slot number for the range variable

	action: XM_XPATH_EXPRESSION
			-- Mapped action

invariant

	context_not_void: context /= Void
	action_not_void: action /= Void
	strictly_positive_slot_number: slot_number > 0

end
