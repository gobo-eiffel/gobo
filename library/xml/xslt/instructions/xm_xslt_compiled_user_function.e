indexing
	description:

		"Objects that represent xsl:functions compiled as a single expression"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_USER_FUNCTION

inherit

	XM_XSLT_COMPILED_PROCEDURE

	XM_XSLT_SHARED_EMPTY_PROPERTIES

	KL_IMPORTED_INTEGER_ROUTINES

	HASHABLE

creation

	make

feature {NONE} -- Initialization

	make (an_executable: like executable; a_body: like body; a_function_name: like function_name; a_system_id: like system_id;
			a_line_number: like line_number; a_slot_manager: like slot_manager; a_result_type: like result_type; memo_function: BOOLEAN) is
				-- Establish invariant
		require
			executable_not_void: an_executable /= Void
			body_not_void: a_body /= Void
			system_id_not_void: a_system_id /= Void
			slot_manager_not_void: a_slot_manager /= Void
			function_name_not_void: a_function_name /= Void
			system_id_not_void: a_system_id /= Void
			result_type_not_void: a_result_type /= Void
		do
			make_procedure (an_executable, a_body, a_line_number, a_system_id,  a_slot_manager)
			function_name := a_function_name
			result_type := a_result_type
			is_memo_function := memo_function
			create details.make ("xsl:function", a_system_id, a_line_number, empty_property_set)
		ensure
			executable_set: executable = an_executable
			body_set: body = a_body
			system_id_set: system_id = a_system_id
			line_number_set: line_number = a_line_number
			slot_manager_set: slot_manager = a_slot_manager
			function_name_set: function_name = a_function_name
			memo_status_set: is_memo_function = memo_function
			result_type_set: result_type = a_result_type
		end	

feature -- Access

	details: XM_XSLT_TRACE_DETAILS
			-- Trace details

	function_name: STRING
			-- QName of function

	result_type: XM_XPATH_SEQUENCE_TYPE
			-- Return type from function

	parameter_definitions: DS_ARRAYED_LIST [XM_XSLT_USER_FUNCTION_PARAMETER]
			-- Parameters to the call

	last_called_value: XM_XPATH_VALUE
			-- Result of last call

	hash_code: INTEGER is
			-- hash code
		do
			Result := function_name.hash_code
		end

feature -- Status report

	is_memo_function: BOOLEAN
			-- Is `Current' a memo function?

	is_user_function: BOOLEAN is
			-- Is `Current' a compiled user function?
		do
			Result := True
		end

feature -- Evaluation

	call (some_actual_arguments: ARRAY [XM_XPATH_VALUE]; a_context: XM_XSLT_EVALUATION_CONTEXT; evaluate_tail_calls: BOOLEAN) is
			-- Evaluate function call.
		require
			arguments_not_void: some_actual_arguments /= Void
			major_context_not_void: a_context /= Void and then not a_context.is_minor
		local
			an_object_value: XM_XPATH_OBJECT_VALUE
			a_function_package: XM_XSLT_FUNCTION_CALL_PACKAGE
			a_transformer: XM_XSLT_TRANSFORMER
			a_stack_frame: XM_XPATH_STACK_FRAME
		do
			a_transformer := a_context.transformer
			if a_transformer.is_tracing then
				a_transformer.trace_listener.trace_instruction_entry (details)
			end
			if is_memo_function then
				last_called_value := cached_value (a_transformer, some_actual_arguments)
			end
			if last_called_value = Void then
				create a_stack_frame.make (slot_manager, some_actual_arguments)
				a_context.set_stack_frame (a_stack_frame)
				body.lazily_evaluate (a_context, False)
				last_called_value := body.last_evaluation
				if evaluate_tail_calls then
					an_object_value ?= last_called_value
					if an_object_value /= Void then
						from
							a_function_package ?= an_object_value.value
						until
							a_function_package = Void
						loop
							a_function_package.call
							last_called_value := a_function_package.last_called_value
							an_object_value ?= last_called_value
							if an_object_value /= Void then
								a_function_package ?= an_object_value.value
							end
						end
					end
				end
				if is_memo_function then
					put_cached_value (a_transformer, some_actual_arguments, last_called_value)
				end
			end
			if a_transformer.is_tracing then
				a_transformer.trace_listener.trace_instruction_exit (details)
			end
		ensure
			called_value_not_void: last_called_value /= Void -- but may be an error value
		end

feature -- Element change

	set_parameter_definitions (some_parameters: DS_ARRAYED_LIST [XM_XSLT_USER_FUNCTION_PARAMETER]) is
			-- Set `parameter_definitions'.
		require
			parameter_definitions_not_void: some_parameters /= Void
		do
			parameter_definitions := some_parameters
		ensure
			parameter_definitions_set: parameter_definitions = some_parameters
		end

feature {NONE} -- Implementation

	put_cached_value (a_transformer: XM_XSLT_TRANSFORMER; some_actual_arguments: ARRAY [XM_XPATH_VALUE]; a_cached_result: XM_XPATH_VALUE) is
			-- Save value in cache.
		require
			memo_function: is_memo_function
			transformer_not_void: a_transformer /= Void
			arguments_not_void: some_actual_arguments /= Void
		local
			a_function_cache: DS_HASH_TABLE [XM_XPATH_VALUE, STRING]
			a_key: STRING
		do
			a_function_cache := a_transformer.function_results_cache (Current)
			if a_function_cache = Void then
				create a_function_cache.make_with_equality_testers (10, Void, string_equality_tester)
				a_transformer.save_function_results (a_function_cache, Current)
			end
			a_key := combined_key (some_actual_arguments)
			a_function_cache.force (a_cached_result, a_key)
		end

	cached_value (a_transformer: XM_XSLT_TRANSFORMER; some_actual_arguments: ARRAY [XM_XPATH_VALUE]): XM_XPATH_VALUE is
			-- Saved value from cache
		require
			memo_function: is_memo_function
			transformer_not_void: a_transformer /= Void
			arguments_not_void: some_actual_arguments /= Void
		local
			a_function_cache: DS_HASH_TABLE [XM_XPATH_VALUE, STRING]
			a_key: STRING
		do
			a_function_cache := a_transformer.function_results_cache (Current)
			if a_function_cache /= Void then
				a_key := combined_key (some_actual_arguments)
				if a_function_cache.has (a_key) then
					Result := a_function_cache.item (a_key)
				end
			end
		end

	combined_key (some_actual_arguments: ARRAY [XM_XPATH_VALUE]): STRING is
			-- Representation of all argument values;
			-- Not 100% pure as it creates an iterator on each actual argument.
		require
			arguments_not_void: some_actual_arguments /= Void
		local
			a_value: XM_XPATH_VALUE
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			a_node: XM_XPATH_NODE
			an_index: INTEGER
		do
			create Result.make (0)
			from
				an_index := 1
			variant
				some_actual_arguments.count + 1
			until
				an_index > some_actual_arguments.count
			loop
				a_value := some_actual_arguments.item (an_index)
				from
					a_value.create_iterator (Void)
					an_iterator := a_value.last_iterator; an_iterator.start
				until
					an_iterator.after
				loop
					an_item := an_iterator.item
					a_node ?= an_item
					if a_node /= Void then
						if a_node.generated_id = Void then
							a_node.generate_id
						end
						Result.append_string (a_node.generated_id)
					else
						Result.append_string (an_item.item_type.conventional_name)
						Result.append_string ("/")
						Result.append_string (an_item.string_value)
					end
					Result.append_character (code_one)
					an_iterator.forth
				end
				Result.append_character (code_two)
				an_index := an_index + 1
			end
				
		ensure
			combined_key_not_void: Result /= Void
		end

	code_one: CHARACTER is
			-- Control-A
		once
			Result := INTEGER_.to_character (1)
		ensure
			code_is_one: Result.code = 1
		end

	code_two: CHARACTER is
			-- Control-B
		once
			Result := INTEGER_.to_character (2)
		ensure
			code_is_two: Result.code = 2
		end

invariant

	function_name_void: function_name /= Void
	body_not_void: body /= Void
	trace_details_not_void: details /= Void
	result_type_not_void: result_type /= Void
	
end
	
