indexing

	description:

		"XPath dynamic contexts for an expression"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_CONTEXT

inherit

	ANY -- required by SE 2.1b1

	DT_SHARED_SYSTEM_CLOCK

	XM_XPATH_STANDARD_NAMESPACES

	KL_IMPORTED_STRING_ROUTINES


feature {NONE} -- Initialization

	make_dynamic_context (a_context_item: XM_XPATH_ITEM) is
			-- Establish invariant for stand-alone contexts.
		require
			context_item_not_void: a_context_item /= Void
		do
			reserved_slot_count := 0
			create internal_date_time.make_from_epoch (0)
			utc_system_clock.set_date_time_to_now (internal_date_time)
			cached_last := -1
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} current_iterator.make (a_context_item)
			current_iterator.start
			create local_variable_frame.make (1, 50)
		ensure
			reserved_slot_count_zero: reserved_slot_count = 0
			context_item_set: current_iterator /= Void and then current_iterator.item = a_context_item
		end

feature -- Access

	current_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Current iterator

	local_variable_frame: ARRAY [XM_XSLT_STACK_FRAME_ENTRY]
			-- Local variables in scope

	reserved_slot_count: INTEGER
			-- Slots reserved by host language

	next_available_slot: INTEGER is
			-- Next available local variable slot
		do
			Result := local_variable_frame.count - reserved_slot_count + 1
		ensure
			strictly_positive_result: Result > 0
		end

	available_functions: XM_XPATH_FUNCTION_LIBRARY is
			-- Available functions
		deferred
		ensure
			available_functions_not_void: Result /= Void
		end

	available_documents: XM_XPATH_DOCUMENT_POOL is
			-- Available documents
		deferred
		ensure
			available_documents_not_void: not is_restricted implies Result /= Void
			restricted_implies_none_available: is_restricted implies Result = Void
		end

	security_manager: XM_XPATH_SECURITY_MANAGER is
			-- Security manager
		deferred
		ensure
			security_manager_not_void: Result /= Void
		end

	current_date_time: DT_DATE_TIME is
			-- Current date-time
		do
			Result := internal_date_time
		end
	
	context_item: XM_XPATH_ITEM is
			-- The context item (".")
		do
			if current_iterator /= Void and then not current_iterator.is_error then
				if current_iterator.before then current_iterator.start end
				Result := current_iterator.item
			end
		ensure
			restricted_implies_undefined: is_restricted implies Result = Void
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
			restricted_implies_undefined: is_restricted implies Result = 0
		end

	last: INTEGER is
			-- Context size;
			-- (the position of the last item in the current node list)
		require
			context_position_set: is_context_position_set
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			if cached_last = -1 then
				an_iterator := current_iterator.another
				cached_last := 0
				from
					an_iterator.start
				until
					an_iterator.after
				loop
					an_iterator.forth
					cached_last := cached_last + 1
				end
			end
			Result := cached_last
		ensure
			positive_size: Result >= 0
			restricted_implies_undefined: is_restricted implies Result = 0
		end

	collator (a_collation_name: STRING): ST_COLLATOR is
			-- Named collation
		require
			collation_name_not_void: a_collation_name /= Void
			is_known_collation (a_collation_name)
		do
			Result := collation_map.item (a_collation_name)
		end

	unicode_codepoint_collator: ST_COLLATOR is
		do
			Result := collator (Unicode_codepoint_collation_uri)
		ensure
			unicode_codepoint_collator_available: Result /= Void
		end

	last_parsed_document: XM_XPATH_DOCUMENT is
			-- Result from last call to `build_document'
		require
			no_build_error: not is_build_document_error
		deferred
		ensure
			last_parsed_document_not_void: Result /= Void
		end
	
	last_parsed_media_type: UT_MEDIA_TYPE is
			-- Auxiliary result from last call to `build_document'
		require
			no_build_error: not is_build_document_error
		deferred
		ensure
			last_parsed_media_type_may_be_void: True
		end
	
feature -- Status report

	is_restricted: BOOLEAN
			-- Is this a restricted context (for use with xsl:use-when)?

	is_known_collation (a_collation_name: STRING): BOOLEAN is
			-- Is `a_collation_name' a statically know collation?
		require
			collation_name_not_void: a_collation_name /= Void
		do
			Result := collation_map.has (a_collation_name)
		end

	is_context_position_set: BOOLEAN is
			-- Is the context position available?
		do
			Result := current_iterator /= Void
		ensure
			restricted_implies_false: is_restricted implies Result = False
		end

	is_valid_local_variable (a_slot_number: INTEGER): BOOLEAN is
			-- Is a_slot_number a valid local variable index?
		do
			Result := a_slot_number > 0 and then a_slot_number <= local_variable_frame.count - reserved_slot_count
		end

	is_at_last: BOOLEAN is
			-- Is position() = last()?
		require
			context_position_set: is_context_position_set
		do
			Result := context_position = last
		end

	is_build_document_error: BOOLEAN
			-- Was last call to `build_document' in error?

	last_build_error: STRING is
			-- Error message from last call to `build_document'
		require
			build_error: is_build_document_error
		deferred
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
			check
				stack_entry_not_void: a_stack_entry /= Void
			end
			Result := a_stack_entry.value
		ensure
			evaluation_not_void: Result /= Void
		end
	
feature 	-- Element change

	set_current_iterator (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Set `current_iterator'.
		do
			current_iterator := an_iterator
			cached_last := -1
		ensure
			set: current_iterator = an_iterator
		end

	set_local_variable (a_slot_number: INTEGER; a_value: XM_XPATH_VALUE) is
			-- Set the value of a local variable.
		require
			valid_local_variable: a_slot_number > 0
		local
			a_stack_entry: XM_XSLT_STACK_FRAME_ENTRY
		do
			if local_variable_frame.count < a_slot_number + reserved_slot_count then
				local_variable_frame.resize (1, 2 * local_variable_frame.count)
			end
			create a_stack_entry.make (a_value)
			local_variable_frame.put (a_stack_entry, a_slot_number + reserved_slot_count)
		end

	set_local_variable_frame (a_local_variable_frame: ARRAY [XM_XSLT_STACK_FRAME_ENTRY]) is
			-- Set stack frame.
		require
			local_variable_frame_not_void: a_local_variable_frame /= Void
		do
			local_variable_frame := a_local_variable_frame
		ensure
			local_variable_frame_set: local_variable_frame = a_local_variable_frame
		end

	build_document (a_uri_reference: STRING) is
			-- Build a document.
		require
			absolute_uri: a_uri_reference /= Void -- and then a_uri_reference.is_absolute
			not_restricted: not is_restricted
		deferred
		ensure
			error_message: is_build_document_error implies last_build_error /= Void
			document_built: not is_build_document_error implies last_parsed_document /= Void
		end

feature {NONE} -- Implementation

	cached_last: INTEGER
			-- Used by `last'

	internal_date_time: like current_date_time
			-- Used by stand-alone XPath and restricted contexts

		collation_map: DS_HASH_TABLE [ST_COLLATOR, STRING]
			-- Collations index by URI

invariant

	reserved_slots: reserved_slot_count >= 0
	local_variables_frame: local_variable_frame /= Void and then local_variable_frame.count - reserved_slot_count >= 0
	no_context_position_for_restricted_contexts: is_restricted implies current_iterator = Void
	collation_map_not_void: collation_map /= Void

end


