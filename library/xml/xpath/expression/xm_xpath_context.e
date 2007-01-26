indexing

	description:

		"XPath dynamic contexts for an expression"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_CONTEXT

inherit

	ANY -- required by SE 2.1b1

	KL_CLONABLE

	DT_SHARED_SYSTEM_CLOCK
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make_dynamic_context (a_context_item: XM_XPATH_ITEM) is
			-- Establish invariant for stand-alone contexts.
		require
			context_item_not_void: a_context_item /= Void
			implicit_timezone_not_void: implicit_timezone /= Void
		local
			a_date_time: DT_DATE_TIME
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
		do
			create a_date_time.make_from_epoch (0)
			utc_system_clock.set_date_time_to_now (a_date_time)
			create a_time_zone.make (implicit_timezone.fixed_offset)
			create internal_date_time.make (a_date_time, a_time_zone)
			cached_last := -1
			if a_context_item.is_node then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} current_iterator.make (a_context_item.as_node)
			else
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} current_iterator.make (a_context_item)
			end
			current_iterator.start
		ensure
			context_item_set: current_iterator /= Void and then current_iterator.item = a_context_item
		end

feature -- Access

	current_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Current iterator

	current_receiver: XM_XPATH_SEQUENCE_RECEIVER
			-- Receiver to which output is currently being written.

	configuration: XM_XPATH_CONFIGURATION is
			-- System configuration
		deferred
		ensure
			result_not_void: Result /= Void
		end

	local_variable_frame: XM_XPATH_STACK_FRAME is
			-- Local variables in scope
		deferred
		end

	next_available_slot: INTEGER is
			-- Next available local variable slot
		require
			local_variables_frame_not_void: local_variable_frame /= Void
		do
			Result := local_variable_frame.slot_manager.number_of_variables + 1
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

	current_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME is
			-- Current date-time
		do
			Result := internal_date_time
		end

	implicit_timezone: DT_FIXED_OFFSET_TIME_ZONE is
			-- Implicit time zone for comparing unzoned times and dates
		deferred
		ensure
			result_not_void: Result /= Void
		end

	context_item: XM_XPATH_ITEM is
			-- The context item (".")
		do
			if current_iterator /= Void then
				if current_iterator.before then current_iterator.start end
				if current_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} Result.make (current_iterator.error_value)
				elseif not current_iterator.after then
					Result := current_iterator.item
				end
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
			 Result := current_iterator.index
		ensure
			positive_result: Result >= 0 -- But it is a Dynamic error, XPDY0002, if Result = 0
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
				cached_last := 0
				if not current_iterator.is_error then
					an_iterator := current_iterator.another
					from
						an_iterator.start
					until
						an_iterator.is_error or else an_iterator.after
					loop
						an_iterator.forth
						cached_last := cached_last + 1
					end
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

	is_temporary_destination: BOOLEAN
			-- Is `current_receiver' a temporary tree?

	has_push_processing: BOOLEAN is
			-- Is push-processing to a sequence receiver implemented?
		deferred
		end

	is_minor: BOOLEAN is
			-- Is `Current' limited in what it may change?
		deferred
		end

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
			Result := current_iterator /= Void and then not current_iterator.is_error
		ensure
			restricted_implies_false: is_restricted implies Result = False
		end

	is_valid_local_variable (a_slot_number: INTEGER): BOOLEAN is
			-- Is a_slot_number a valid local variable index?
		require
			local_variables_frame_not_void: local_variable_frame /= Void
		do
			Result := a_slot_number > 0 and then a_slot_number <= local_variable_frame.variables.count
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

	is_process_error: BOOLEAN is
			-- Has a processing error occured?
		deferred
		end

	is_uri_written (a_uri: STRING): BOOLEAN is
			-- Has `a_uri' been written to yet?
		require
			a_uri_not_void: a_uri /= Void
		do
			Result := configuration.is_uri_written (a_uri)
		end

feature -- Creation

	new_context: like Current is
			-- Created copy of `Current'.
		do

			-- Default implementation for non-minor contexts

			Result := cloned_object
		ensure
			major_context: Result /= Void and then not Result.is_minor
		end

	new_minor_context: like Current is
			-- Created minor copy of `Current'
		require
			push_processing_available: has_push_processing
		deferred
		ensure
			minor_context: Result /= Void and then Result.is_minor
		end

	new_clean_context: like Current is
			-- Created clean context (for XSLT function calls)
		require
			push_processing_available: has_push_processing
		deferred
		ensure
			major_context: Result /= Void and then not Result.is_minor
		end

feature -- Evaluation

	evaluated_local_variable (a_slot_number: INTEGER): XM_XPATH_VALUE is
			-- Value of a local variable, identified by its slot number
		require
			local_variables_frame_not_void: local_variable_frame /= Void
			valid_local_variable: is_valid_local_variable (a_slot_number)
		do
			Result := local_variable_frame.variables.item (a_slot_number)
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

	set_current_receiver (a_receiver: like current_receiver) is
			-- Set `current_receiver'.
		do
			current_receiver := a_receiver
		ensure
			set: current_receiver = a_receiver
		end

	set_temporary_destination (a_status: BOOLEAN) is
			-- Set `is_temporary_destination'.
		do
			is_temporary_destination := a_status
		ensure
			set: is_temporary_destination = a_status
		end

	set_local_variable (a_value: XM_XPATH_VALUE; a_slot_number: INTEGER) is
			-- Set the value of a local variable.
		require
			local_variables_frame_not_void: local_variable_frame /= Void
			valid_local_variable: a_slot_number > 0
		do
			local_variable_frame.set_variable (a_value, a_slot_number)
		end

	set_stack_frame (a_local_variable_frame: like local_variable_frame) is
			-- Set stack frame.
		require
			local_variable_frame_not_void: a_local_variable_frame /= Void
			major_context: not is_minor
		deferred
		ensure
			local_variable_frame_set: local_variable_frame = a_local_variable_frame
			local_variables_frame_not_void: local_variable_frame /= Void
		end

	open_stack_frame (a_slot_manager: XM_XPATH_SLOT_MANAGER) is
			-- Set stack frame.
		require
			slot_manager_not_void: a_slot_manager /= Void
			major_context: not is_minor
		deferred
		ensure
			local_variables_frame_not_void: local_variable_frame /= Void
		end


	open_sized_stack_frame (a_slot_count: INTEGER) is
			-- Set stack frame.
		require
			strictly_positive_slot_count: a_slot_count > 0
		deferred
		ensure
			local_variables_frame_not_void: local_variable_frame /= Void
		end

	set_receiver (a_receiver: XM_XPATH_SEQUENCE_RECEIVER) is
			-- Set receiver to which output is currently being written.
		require
			receiver_not_void: a_receiver /= Void
			push_processing: 	has_push_processing
		do
			current_receiver := a_receiver
		ensure
			receiver_set: current_receiver = a_receiver
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

	change_to_sequence_output_destination (a_receiver: XM_XPATH_SEQUENCE_RECEIVER) is
			-- Change to a temporary destination
		require
			receiver_not_void: a_receiver /= Void
			push_processing: has_push_processing
		deferred
		ensure
			receiver_set: current_receiver = a_receiver
			receiver_open: current_receiver.is_open
			temporary_destination: is_temporary_destination
		end
	
	report_fatal_error (an_error: XM_XPATH_ERROR_VALUE) is
			-- Report a fatal error.
		require
			push_processing: has_push_processing
		deferred
		end

feature {XM_XPATH_CONTEXT} -- Local

	cached_last: INTEGER
			-- Used by `last'

feature {NONE} -- Implementation

	internal_date_time: like current_date_time
			-- Used by stand-alone XPath and restricted contexts

	collation_map: DS_HASH_TABLE [ST_COLLATOR, STRING]
			-- Collations index by URI

invariant

	no_context_position_for_restricted_contexts: is_restricted implies current_iterator = Void
	collation_map_not_void: collation_map /= Void
	minor_context: is_minor implies has_push_processing
	current_receiver: not has_push_processing implies current_receiver = Void
	temporary_destination:  not has_push_processing implies not is_temporary_destination

end


