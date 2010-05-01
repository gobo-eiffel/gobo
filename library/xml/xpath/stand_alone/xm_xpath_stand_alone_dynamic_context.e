note

	description:

		"Objects that provide a dynamic context"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STAND_ALONE_DYNAMIC_CONTEXT

inherit

	XM_XPATH_CONTEXT

	XM_RESOLVER_FACTORY

	XM_STRING_MODE

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make, make_restricted

feature {NONE} -- Initialization

	make (a_context_item: XM_XPATH_ITEM; a_document_pool: like available_documents; a_function_library: like available_functions) is
			-- Establish invariant.
		require
			context_item_not_void: a_context_item /= Void
			document_pool_not_void: a_document_pool /= Void
		local
			l_file_resolver: XM_FILE_URI_RESOLVER
			l_collator: ST_COLLATOR
		do
			create configuration.make_configuration
			create implicit_timezone.make (system_clock.time_now.canonical_duration (utc_system_clock.time_now))
			make_dynamic_context (a_context_item)
			available_documents := a_document_pool
			available_functions := a_function_library
			create {XM_XPATH_DEFAULT_SECURITY_MANAGER} security_manager
			create uri_resolver.make
			create l_file_resolver.make
			uri_resolver.register_scheme (l_file_resolver)
			create collation_map.make_with_equality_testers (1, Void, string_equality_tester)
			create l_collator
			collation_map.put_new (l_collator, Unicode_codepoint_collation_uri)
		ensure
			context_item_set: current_iterator /= Void and then current_iterator.item = a_context_item
			available_documents_set: available_documents = a_document_pool
			available_functions_set: available_functions = a_function_library
		end

	make_restricted (a_function_library: like available_functions) is
			-- Initialize `Current' as restricted (compile-time) context.
		local
			l_date_time: DT_DATE_TIME
			l_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			l_file_resolver: XM_FILE_URI_RESOLVER
			l_collator: ST_COLLATOR
		do
			is_restricted := True
			create configuration.make_configuration
			create implicit_timezone.make (system_clock.time_now.canonical_duration (utc_system_clock.time_now))
			create l_date_time.make_from_epoch (0)
			utc_system_clock.set_date_time_to_now (l_date_time)
			create l_time_zone.make (implicit_timezone.fixed_offset)
			create internal_date_time.make (l_date_time, l_time_zone)
			clear_last_cache
			current_iterator := Void
			available_documents := Void
			available_functions := a_function_library
			create {XM_XPATH_DEFAULT_SECURITY_MANAGER} security_manager
			create uri_resolver.make
			create l_file_resolver.make
			uri_resolver.register_scheme (l_file_resolver)
			create collation_map.make_with_equality_testers (1, Void, string_equality_tester)
			create l_collator
			collation_map.put_new (l_collator, Unicode_codepoint_collation_uri)
		ensure
			restricted_context: is_restricted
			no_available_documents: available_documents = Void
			available_functions_set: available_functions = a_function_library
		end


feature -- Access

	configuration: XM_XPATH_CONFIGURATION
			-- System configuration

	local_variable_frame: XM_XPATH_STACK_FRAME
			-- Local variables in scope

	available_functions: XM_XPATH_FUNCTION_LIBRARY
			-- Available functions

	available_documents: XM_XPATH_DOCUMENT_POOL
			-- Available documents

	last_parsed_document: XM_XPATH_DOCUMENT
		-- Result from last call to `build_document'

	last_parsed_media_type: UT_MEDIA_TYPE
			-- Auxiliary result from last call to `build_document'

	security_manager: XM_XPATH_SECURITY_MANAGER
			-- Security manager

	implicit_timezone: DT_FIXED_OFFSET_TIME_ZONE
			-- Implicit time zone for comparing unzoned times and dates

feature -- Status report

	has_push_processing: BOOLEAN
			-- Is push-processing to a receiver implemented?

	is_minor: BOOLEAN
			-- Is `Current' limited in what can change?

	last_build_error: STRING
			-- Error message from last call to `build_document'

	is_process_error: BOOLEAN
			-- Has a processing error occurred?

feature -- Creation

	new_minor_context: like Current is
			-- Create a minor copy of `Current'
		do
			-- pre-condition is never met
		end

	new_clean_context: like Current is
			-- Created clean context (for XSLT function calls)
		do
			-- pre-condition is never met
		end

feature 	-- Element change

	set_implicit_timezone (an_implicit_timezone: like implicit_timezone) is
			-- Set `implicit_timezone'.
		require
			implicit_timezone_not_void: an_implicit_timezone /= Void
		do
			implicit_timezone := an_implicit_timezone
		ensure
			set: implicit_timezone = an_implicit_timezone
		end

	set_stack_frame (a_local_variable_frame: like local_variable_frame) is
			-- Set stack frame.
		do
			local_variable_frame := a_local_variable_frame
		end

	open_stack_frame (a_slot_manager: XM_XPATH_SLOT_MANAGER) is
			-- Set stack frame.
		local
			an_array: ARRAY [XM_XPATH_VALUE]
		do
			create an_array.make (1, a_slot_manager.number_of_variables)
			create local_variable_frame.make (a_slot_manager, an_array)
		end


	open_sized_stack_frame (a_slot_count: INTEGER) is
			-- Set stack frame.
		local
			an_array: ARRAY [XM_XPATH_VALUE]
			a_slot_manager: XM_XPATH_SLOT_MANAGER
		do
			create an_array.make (1, a_slot_count)
			create a_slot_manager.make
			a_slot_manager.set_number_of_variables (a_slot_count)
			create local_variable_frame.make (a_slot_manager, an_array)
		end

	build_document (a_uri_reference: STRING) is
			-- Build a document.
		local
			l_entity_resolver: XM_URI_EXTERNAL_RESOLVER
			l_parser: XM_EIFFEL_PARSER
			l_tree_pipe: XM_XPATH_TREE_CALLBACKS_PIPE
			l_document_uri: UT_URI
		do
			is_build_document_error := False
			last_parsed_document := Void
			last_parsed_media_type := Void
			uri_resolver.resolve_uri (a_uri_reference)
			if uri_resolver.has_uri_reference_error then
				set_build_error (uri_resolver.last_uri_reference_error)
			else
				if uri_resolver.has_media_type then
					last_parsed_media_type := uri_resolver.last_media_type
				end
				l_entity_resolver := new_file_resolver_current_directory
				create l_parser.make
				l_parser.copy_string_mode (Current)
				l_parser.set_resolver (l_entity_resolver)
				create l_document_uri.make (a_uri_reference)
				create l_tree_pipe.make (l_parser, True, a_uri_reference, l_document_uri)
				l_parser.set_callbacks (l_tree_pipe.start)
				l_parser.set_dtd_callbacks (l_tree_pipe.emitter)
				l_entity_resolver.push_uri (uri_resolver.last_system_id)
				l_parser.parse_from_stream (uri_resolver.last_uri_reference_stream)
				l_parser.entity_resolver.resolve_finish
				if uri_resolver.last_uri_reference_stream.is_closable then uri_resolver.last_uri_reference_stream.close end
				if l_tree_pipe.tree.has_error then
					set_build_error (l_tree_pipe.tree.last_error)
				else
					last_parsed_document	:= l_tree_pipe.document
				end
			end
		end

	-- The following routines are only for contexts capable of push-processing

	change_to_sequence_output_destination (a_destination: XM_XPATH_SEQUENCE_RECEIVER) is
			-- Change to a temporary destination
		do
			-- pre-condition is never met
		end

	report_fatal_error (an_error: XM_XPATH_ERROR_VALUE) is
			-- Report a fatal error.
		do
			-- pre-condition is never met
		end

feature {NONE} -- Implementation

	uri_resolver: XM_SIMPLE_URI_EXTERNAL_RESOLVER
			-- URI reference resolver

	set_build_error (a_message: STRING) is
			-- Set `last_build_error'.
		require
			message_not_void: a_message /= Void
		do
			last_build_error := a_message
			is_build_document_error := True
		ensure
			error_set: last_build_error = a_message
			is_build_document_error: is_build_document_error
		end

invariant

	no_push_processing: not has_push_processing

end
