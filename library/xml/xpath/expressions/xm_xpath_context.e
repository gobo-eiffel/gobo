indexing

	description:

		"XPath evaluation contexts for an expression"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTEXT

inherit

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_DEBUGGING_ROUTINES -- TODO - remove when all todo routines are removed

creation

	make

feature {NONE} -- Initialization

	make (a_context_item: XM_XPATH_ITEM; a_reserved_slot_count: INTEGER) is
			-- Establish invariant.
		require
			context_item_not_void: a_context_item /= Void
			positive_reserved_slots_count: a_reserved_slot_count >= 0
		do
			reserved_slot_count := a_reserved_slot_count
			cached_last := -1
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} current_iterator.make (a_context_item)
			current_iterator.start
			create local_variable_frame.make (1, 50)
		ensure
			reserved_slot_count_set: reserved_slot_count = a_reserved_slot_count
			context_item_set: current_iterator /= Void and then current_iterator.item = a_context_item
		end

feature -- Access

	current_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Current iterator

	local_variable_frame: ARRAY [XM_XSLT_STACK_FRAME_ENTRY]
			-- Local variables in scope

	reserved_slot_count: INTEGER
			-- Slots reserved by host language
	
	context_item: XM_XPATH_ITEM is
			-- The context item (".")
		do
			if current_iterator /= Void and then not current_iterator.is_error then
				if current_iterator.before then current_iterator.start end
				Result := current_iterator.item
			end
		end

	context_position: INTEGER is
			-- Context position;
			-- (the position of the context node in the context node list)
		require
			context_position_set: is_context_position_set
		do
			 if not current_iterator.is_error then Result := current_iterator.index end
		ensure
			positive_result: Result >= 0 -- But it is a Dynamic error, XP0002, if Result = 0
		end

	last: INTEGER is
			-- Context size;
			-- (the position of the last item in the current node list)
		do
			if cached_last > 0 then
				Result := cached_last
			else
				todo ("last", True)
				-- TODO
			end
		end

	default_collation: ST_COLLATOR is
			-- Default collator
		do
			Result := unicode_codepoint_collator
		end

	collation (a_collation_name: STRING): ST_COLLATOR is
			-- Named collation
		require
			collation_name_not_void: a_collation_name /= Void
		do
			-- TODO - do this properly
			if STRING_.same_string (a_collation_name, unicode_codepoint_collation_name) then
				Result := unicode_codepoint_collator
			end
		end

feature -- Status report

	is_context_position_set: BOOLEAN is
			-- Is the context position available?
		do
			Result := current_iterator /= Void
		end

	is_valid_local_variable (a_slot_number: INTEGER): BOOLEAN is
			-- Is a_slot_number a valid local variable index?
		do
			Result := a_slot_number > 0 and then a_slot_number <= local_variable_frame.count - reserved_slot_count
		end
	
feature -- Creation

	new_context: like Current is
			-- Create a copy of `Current'
		do
			Result := clone (Current)
		end

feature -- Evaluation

	evaluated_local_variable (a_slot_number: INTEGER): XM_XPATH_VALUE is
			-- Value of a local variable, identified by its slot number
		require
			valid_local_variable: is_valid_local_variable (a_slot_number)
		local
			a_stack_entry: XM_XSLT_STACK_FRAME_ENTRY
		do
			a_stack_entry := local_variable_frame.item (a_slot_number + reserved_slot_count)
			if a_stack_entry /= Void then
				Result := a_stack_entry.value
			end
		end
	
feature 	-- Element change

	set_current_iterator (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Set `current_iterator'.
		do
			current_iterator := an_iterator
		ensure
			set: current_iterator = an_iterator
		end

	set_local_variable (a_slot_number: INTEGER; a_value: XM_XPATH_VALUE) is
			-- Set the value of a local variable.
		local
			a_stack_entry: XM_XSLT_STACK_FRAME_ENTRY
		do
			if local_variable_frame.count < a_slot_number + reserved_slot_count then
				local_variable_frame.resize (1, 2 * local_variable_frame.count)
			end
			create a_stack_entry.make (a_value)
			local_variable_frame.put (a_stack_entry, a_slot_number + reserved_slot_count)
		end

feature {NONE} -- Implementation

	cached_last: INTEGER
			-- Used by `last'

	unicode_codepoint_collation_name: STRING is "http://www.w3.org/2003/11/xpath-functions/collation/codepoint"
			-- Unicode code-point collator name
	
	unicode_codepoint_collator: ST_COLLATOR is
			-- Unicode code-point collator
		once
			create Result
		end

invariant

	reserved_slots: reserved_slot_count >= 0
	local_variables_frame: local_variable_frame /= Void and then local_variable_frame.count - reserved_slot_count >= 0

end


