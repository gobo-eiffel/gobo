note

	description:

		"XPath dynamic contexts for an expression"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
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

	make_dynamic_context (a_context_item: XM_XPATH_ITEM)
			-- Establish invariant for stand-alone contexts.
		require
			context_item_not_void: a_context_item /= Void
			implicit_timezone_not_void: implicit_timezone /= Void
		local
			a_date_time: DT_DATE_TIME
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			l_current_iterator2: like current_iterator
		do
			create a_date_time.make_from_epoch (0)
			utc_system_clock.set_date_time_to_now (a_date_time)
			create a_time_zone.make (implicit_timezone.fixed_offset)
			create internal_date_time.make (a_date_time, a_time_zone)
			clear_last_cache
			if a_context_item.is_node then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} l_current_iterator2.make (a_context_item.as_node)
			else
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} l_current_iterator2.make (a_context_item)
			end
			current_iterator := l_current_iterator2
			l_current_iterator2.start
		ensure
			context_item_set: attached current_iterator as l_current_iterator and then l_current_iterator.item = a_context_item
		end

feature -- Access

	current_iterator: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Current iterator

	current_receiver: detachable XM_XPATH_SEQUENCE_RECEIVER
			-- Receiver to which output is currently being written.

	configuration: XM_XPATH_CONFIGURATION
			-- System configuration
		deferred
		ensure
			result_not_void: Result /= Void
		end

	local_variable_frame: detachable XM_XPATH_STACK_FRAME
			-- Local variables in scope
		deferred
		end

	next_available_slot: INTEGER
			-- Next available local variable slot
		require
			local_variables_frame_not_void: local_variable_frame /= Void
		do
			check precondition_local_variables_frame_not_void: attached local_variable_frame as l_local_variable_frame then
				Result := l_local_variable_frame.slot_manager.number_of_variables + 1
			end
		ensure
			strictly_positive_result: Result > 0
		end

	available_functions: XM_XPATH_FUNCTION_LIBRARY
			-- Available functions
		deferred
		ensure
			available_functions_not_void: Result /= Void
		end

	available_documents: detachable XM_XPATH_DOCUMENT_POOL
			-- Available documents
		deferred
		ensure
			available_documents_not_void: not is_restricted implies Result /= Void
			restricted_implies_none_available: is_restricted implies Result = Void
		end

	security_manager: XM_XPATH_SECURITY_MANAGER
			-- Security manager
		deferred
		ensure
			security_manager_not_void: Result /= Void
		end

	current_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME
			-- Current date-time
		do
			check attached internal_date_time as l_internal_date_time then
				Result := l_internal_date_time
			end
		end

	implicit_timezone: DT_FIXED_OFFSET_TIME_ZONE
			-- Implicit time zone for comparing unzoned times and dates
		deferred
		ensure
			result_not_void: Result /= Void
		end

	context_item: detachable XM_XPATH_ITEM
			-- The context item (".")
		do
			if attached current_iterator as l_current_iterator then
				if l_current_iterator.before then l_current_iterator.start end
				if attached l_current_iterator.error_value as l_error_value then
					check is_error: l_current_iterator.is_error end
					create {XM_XPATH_INVALID_ITEM} Result.make (l_error_value)
				elseif not l_current_iterator.after then
					Result := l_current_iterator.item
				end
			end
		ensure
			restricted_implies_undefined: is_restricted implies Result = Void
		end

	context_position: INTEGER
			-- Context position;
			-- (the position of the context node in the context node list)
		require
			context_position_set: is_context_position_set
		do
			check precondition_context_position_set: attached current_iterator as l_current_iterator then
				Result := l_current_iterator.index
			end
		ensure
			positive_result: Result >= 0 -- But it is a Dynamic error, XPDY0002, if Result = 0
			restricted_implies_undefined: is_restricted implies Result = 0
		end

	last: INTEGER
			-- Context size;
			-- (the position of the last item in the current node list)
		require
			context_position_set: is_context_position_set
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			check precondition_context_position_set: attached current_iterator as l_current_iterator then
				if cached_last = -1 then
					if not l_current_iterator.is_error then
						if l_current_iterator.is_last_position_finder then
							cached_last := l_current_iterator.last_position
						else
							l_iterator := l_current_iterator.another
							from
								cached_last := 0
								l_iterator.start
							until
								l_iterator.is_error or else l_iterator.after
							loop
								cached_last := cached_last + 1
								l_iterator.forth
							end
						end
					end
				end
				Result := cached_last
			end
		ensure
			positive_size: Result >= 0
			restricted_implies_undefined: is_restricted implies Result = 0
		end

	collator (a_collation_name: STRING): ST_COLLATOR
			-- Named collation
		require
			collation_name_not_void: a_collation_name /= Void
			is_known_collation (a_collation_name)
		do
			Result := collation_map.item (a_collation_name)
		end

	unicode_codepoint_collator: ST_COLLATOR
		do
			Result := collator (Unicode_codepoint_collation_uri)
		ensure
			unicode_codepoint_collator_available: Result /= Void
		end

	last_parsed_document: detachable XM_XPATH_DOCUMENT
			-- Result from last call to `build_document'
		require
			no_build_error: not is_build_document_error
		deferred
		end

	last_parsed_media_type: detachable UT_MEDIA_TYPE
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

	has_push_processing: BOOLEAN
			-- Is push-processing to a sequence receiver implemented?
		deferred
		end

	is_minor: BOOLEAN
			-- Is `Current' limited in what it may change?
		deferred
		end

	is_known_collation (a_collation_name: STRING): BOOLEAN
			-- Is `a_collation_name' a statically know collation?
		require
			collation_name_not_void: a_collation_name /= Void
		do
			Result := collation_map.has (a_collation_name)
		end

	is_context_position_set: BOOLEAN
			-- Is the context position available?
		do
			Result := attached current_iterator as l_current_iterator and then not l_current_iterator.is_error
		ensure
			restricted_implies_false: is_restricted implies Result = False
		end

	is_valid_local_variable (a_slot_number: INTEGER): BOOLEAN
			-- Is a_slot_number a valid local variable index?
		require
			local_variables_frame_not_void: local_variable_frame /= Void
		do
			check precondition_local_variables_frame_not_void: attached local_variable_frame as l_local_variable_frame then
				Result := a_slot_number > 0 and then a_slot_number <= l_local_variable_frame.variables.count
			end
		end

	is_at_last: BOOLEAN
			-- Is position() = last()?
		require
			context_position_set: is_context_position_set
		do
			Result := context_position = last
		end

	is_build_document_error: BOOLEAN
			-- Was last call to `build_document' in error?

	last_build_error: detachable STRING
			-- Error message from last call to `build_document'
		require
			build_error: is_build_document_error
		deferred
		end

	is_process_error: BOOLEAN
			-- Has a processing error occurred?
		deferred
		end

	is_uri_written (a_uri: STRING): BOOLEAN
			-- Has `a_uri' been written to yet?
		require
			a_uri_not_void: a_uri /= Void
		do
			Result := configuration.is_uri_written (a_uri)
		end

feature -- Creation

	new_context: like Current
			-- Created copy of `Current'.
		do

			-- Default implementation for non-minor contexts

			Result := cloned_object
		ensure
			major_context: Result /= Void and then not Result.is_minor
		end

	new_minor_context: like Current
			-- Created minor copy of `Current'
		require
			push_processing_available: has_push_processing
		deferred
		ensure
			minor_context: Result /= Void and then Result.is_minor
		end

	new_clean_context: like Current
			-- Created clean context (for XSLT function calls)
		require
			push_processing_available: has_push_processing
		deferred
		ensure
			major_context: Result /= Void and then not Result.is_minor
		end

feature -- Evaluation

	evaluated_local_variable (a_slot_number: INTEGER): XM_XPATH_VALUE
			-- Value of a local variable, identified by its slot number
		require
			local_variables_frame_not_void: local_variable_frame /= Void
			valid_local_variable: is_valid_local_variable (a_slot_number)
		do
			check precondition_local_variables_frame_not_void: attached local_variable_frame as l_local_variable_frame then
				check attached l_local_variable_frame.variables.item (a_slot_number) as l_variable then
					Result := l_variable
				end
			end
		ensure
			evaluation_not_void: Result /= Void
		end

feature -- Element change

	set_current_iterator (an_iterator: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM])
			-- Set `current_iterator'.
		do
			current_iterator := an_iterator
			clear_last_cache
		ensure
			set: current_iterator = an_iterator
		end

	set_current_receiver (a_receiver: like current_receiver)
			-- Set `current_receiver'.
		do
			current_receiver := a_receiver
		ensure
			set: current_receiver = a_receiver
		end

	set_temporary_destination (a_status: BOOLEAN)
			-- Set `is_temporary_destination'.
		do
			is_temporary_destination := a_status
		ensure
			set: is_temporary_destination = a_status
		end

	set_local_variable (a_value: XM_XPATH_VALUE; a_slot_number: INTEGER)
			-- Set the value of a local variable.
		require
			local_variables_frame_not_void: local_variable_frame /= Void
			valid_local_variable: a_slot_number > 0
		do
			check precondition_local_variables_frame_not_void: attached local_variable_frame as l_local_variable_frame then
				l_local_variable_frame.set_variable (a_value, a_slot_number)
			end
		end

	set_stack_frame (a_local_variable_frame: attached like local_variable_frame)
			-- Set stack frame.
		require
			local_variable_frame_not_void: a_local_variable_frame /= Void
			major_context: not is_minor
		deferred
		ensure
			local_variable_frame_set: local_variable_frame = a_local_variable_frame
			local_variables_frame_not_void: local_variable_frame /= Void
		end

	open_stack_frame (a_slot_manager: XM_XPATH_SLOT_MANAGER)
			-- Set stack frame.
		require
			slot_manager_not_void: a_slot_manager /= Void
			major_context: not is_minor
		deferred
		ensure
			local_variables_frame_not_void: local_variable_frame /= Void
		end


	open_sized_stack_frame (a_slot_count: INTEGER)
			-- Set stack frame.
		require
			strictly_positive_slot_count: a_slot_count > 0
		deferred
		ensure
			local_variables_frame_not_void: local_variable_frame /= Void
		end

	set_receiver (a_receiver: XM_XPATH_SEQUENCE_RECEIVER)
			-- Set receiver to which output is currently being written.
		require
			receiver_not_void: a_receiver /= Void
			push_processing: 	has_push_processing
		do
			current_receiver := a_receiver
		ensure
			receiver_set: current_receiver = a_receiver
		end


	build_document (a_uri_reference: STRING)
			-- Build a document.
		require
			absolute_uri: a_uri_reference /= Void -- and then a_uri_reference.is_absolute
			not_restricted: not is_restricted
		deferred
		ensure
			error_message: is_build_document_error implies last_build_error /= Void
			document_built: not is_build_document_error implies last_parsed_document /= Void
		end

	change_to_sequence_output_destination (a_receiver: XM_XPATH_SEQUENCE_RECEIVER)
			-- Change to a temporary destination
		require
			receiver_not_void: a_receiver /= Void
			push_processing: has_push_processing
		deferred
		ensure
			receiver_set: current_receiver = a_receiver
			receiver_open: a_receiver.is_open
			temporary_destination: is_temporary_destination
		end

	report_fatal_error (an_error: XM_XPATH_ERROR_VALUE)
			-- Report a fatal error.
		require
			push_processing: has_push_processing
		deferred
		end

feature {XM_XPATH_CONTEXT} -- Local

	cached_last: INTEGER
			-- Used by `last'

	clear_last_cache
			-- Clear caching of `last'.
		do
			cached_last := -1
		ensure
			last_cached: cached_last = -1
		end

feature {NONE} -- Implementation

	internal_date_time: detachable like current_date_time
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


