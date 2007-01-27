indexing
	description:

		"Objects that represent xsl:functions compiled as a single expression"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_USER_FUNCTION

inherit

	ANY -- for SE 2.1

	XM_XSLT_COMPILED_PROCEDURE

	XM_XPATH_EXPRESSION_CONTAINER

	XM_XPATH_VARIABLE_DECLARATION_ROUTINES
		export {NONE} all end

	XM_XSLT_SHARED_EMPTY_PROPERTIES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	HASHABLE

create

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
			contains_tail_calls := a_body.is_tail_recursive
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

	function_name: STRING
			-- QName of function

	result_type: XM_XPATH_SEQUENCE_TYPE
			-- Return type from function

	parameter_definitions: DS_ARRAYED_LIST [XM_XSLT_USER_FUNCTION_PARAMETER]
			-- Parameters to the call

	parameter_count: INTEGER
			-- Number of parameters passed

	hash_code: INTEGER is
			-- hash code
		do
			Result := function_name.hash_code
		end

	parameter_references (a_binding: XM_XPATH_BINDING): INTEGER is
			-- Approximate count of references by parameters of `Current' to `a_binding'
			-- If `a_binding' is a user-function parameter of `Current' then return 1.
			-- Else return many.
		local
			found: BOOLEAN
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_USER_FUNCTION_PARAMETER]
		do
			from
				a_cursor := parameter_definitions.new_cursor; a_cursor.start
			until
				found or else a_cursor.after
			loop
				if a_cursor.item = a_binding then
					Result := a_cursor.item.reference_count
					if Result > 1 then Result := Many_references end
					found := True
				end
				a_cursor.forth
			end
			if not found then Result := Many_references end
		end

	system_id_from_module_number (a_module_number: INTEGER): STRING is
			-- System identifier
		do
			Result := executable.system_id (a_module_number)
		end

feature -- Status report

	is_memo_function: BOOLEAN
			-- Is `Current' a memo function?

	is_user_function: BOOLEAN is
			-- Is `Current' a compiled user function?
		do
			Result := True
		end

	is_computed_expression: BOOLEAN is
			-- Is `Current' a computed expression?
		do
			Result := False
		end

	contains_tail_calls: BOOLEAN
			-- Does `Current' contain tail calls?

feature -- Evaluation

	call (a_return_value: DS_CELL [XM_XPATH_VALUE]; some_actual_arguments: ARRAY [XM_XPATH_VALUE]; a_parameter_count: INTEGER; a_context: XM_XSLT_EVALUATION_CONTEXT; evaluate_tail_calls: BOOLEAN) is
			-- Evaluate function call.
			-- Result returned as `a_return_value.item'.
		require
			a_return_value_not_void: a_return_value /= Void
			return_value_is_void: a_return_value.item = Void
			arguments_not_void: some_actual_arguments /= Void
			positive_parameter_count: a_parameter_count >= 0
			major_context_not_void: a_context /= Void and then not a_context.is_minor
		local
			a_function_package: XM_XSLT_FUNCTION_CALL_PACKAGE
			a_transformer: XM_XSLT_TRANSFORMER
			a_stack_frame: XM_XPATH_STACK_FRAME
		do
			parameter_count := a_parameter_count
			a_transformer := a_context.transformer
			if is_memo_function then
				fetch_cached_value (a_return_value, a_transformer, some_actual_arguments)
			end
			if a_return_value.item = Void then
				create a_stack_frame.make (slot_manager, some_actual_arguments)
				a_context.set_stack_frame (a_stack_frame)
				if contains_tail_calls or else is_memo_function then
					
					-- we cannot risk evaluating to an XM_XPATH_CLOSURE,
					-- as the tail call will escape, and might reappear anywhere.
					-- Eager evaluation also makes sense for a memo function.
					
					body.eagerly_evaluate (a_context)
				else
					body.lazily_evaluate (a_context, 1)
				end
				a_return_value.put (body.last_evaluation)
				if evaluate_tail_calls and then a_return_value.item.is_function_package then
					from
						a_function_package ?= a_return_value.item
					until
						a_function_package = Void
					loop
						a_return_value.put (Void)
						a_function_package.call (a_return_value)
						a_function_package ?= a_return_value.item
					end
				end
				if is_memo_function then
					put_cached_value (a_transformer, some_actual_arguments, a_return_value.item)
				end
			end
		ensure
			called_value_not_void: a_return_value.item /= Void -- but may be an error value
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
			l_key: DS_CELL [STRING]
		do
			a_function_cache := a_transformer.function_results_cache (Current)
			if a_function_cache = Void then
				create a_function_cache.make_with_equality_testers (10, Void, string_equality_tester)
				a_transformer.save_function_results (a_function_cache, Current)
			end
			create l_key.make (Void)
			calculate_combined_key (l_key, some_actual_arguments, a_transformer)
			if not a_transformer.is_error then
				a_function_cache.force (a_cached_result, l_key.item)
			end
		end

	fetch_cached_value (a_return_value: DS_CELL [XM_XPATH_VALUE]; a_transformer: XM_XSLT_TRANSFORMER; some_actual_arguments: ARRAY [XM_XPATH_VALUE]) is
			-- Save value from cache into `a_return_value.item'.
		require
			a_return_value_not_void: a_return_value /= Void
			return_value_is_void: a_return_value.item = Void
			memo_function: is_memo_function
			transformer_not_void: a_transformer /= Void
			arguments_not_void: some_actual_arguments /= Void
		local
			l_function_cache: DS_HASH_TABLE [XM_XPATH_VALUE, STRING]
			l_key: DS_CELL [STRING]
		do
			l_function_cache := a_transformer.function_results_cache (Current)
			if l_function_cache /= Void then
				create l_key.make (Void)
				calculate_combined_key (l_key, some_actual_arguments, a_transformer)
				if not a_transformer.is_error then
					if l_function_cache.has (l_key.item) then
						a_return_value.put (l_function_cache.item (l_key.item))
					end
				end
			end
		end

	calculate_combined_key (a_key: DS_CELL [STRING]; some_actual_arguments: ARRAY [XM_XPATH_VALUE]; a_transformer: XM_XSLT_TRANSFORMER) is
			-- Calculate representation of all argument values.
		require
			a_key_not_void: a_key /= Void
			key_is_void: a_key.item = Void
			arguments_not_void: some_actual_arguments /= Void
			transformer_not_void: a_transformer /= Void
		local
			l_value: XM_XPATH_VALUE
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_item: XM_XPATH_ITEM
			l_node: XM_XPATH_NODE
			l_index: INTEGER
			l_key: STRING
		do
			create l_key.make (0)
			a_key.put (l_key)
			from
				l_index := 1
			variant
				parameter_count + 1 - l_index
			until
				a_transformer.is_error or else l_index > parameter_count
			loop
				l_value := some_actual_arguments.item (l_index)
				if l_value.is_error then
					a_transformer.report_fatal_error (l_value.error_value)
					l_index := l_index + 1
				else
					from
						l_value.create_iterator (Void)
						l_iterator := l_value.last_iterator
						if l_iterator.is_error then
							a_key.put (Void)
							a_transformer.report_fatal_error (l_iterator.error_value)
						else
							l_iterator.start
						end
					until
						l_iterator.is_error or else l_iterator.after
					loop
						l_item := l_iterator.item
						if l_item.is_node then
							l_node := l_item.as_node
							if l_node.generated_id = Void then
								l_node.generate_id
							end
							l_key.append_string (l_node.generated_id)
						else
							l_key.append_string (l_item.item_type.conventional_name)
							l_key.append_string ("/")
							l_key.append_string (l_item.string_value)
						end
						l_key.append_character (code_one)
						l_iterator.forth
					end
					if l_iterator.is_error then
						a_key.put (Void)
						a_transformer.report_fatal_error (l_iterator.error_value)
					else
						l_key.append_character (code_two)
					end
					l_index := l_index + 1
				end
			end
		ensure
			error_or_combined_key_set: not a_transformer.is_error implies a_key.item /= Void
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
	result_type_not_void: result_type /= Void
	
end
	
