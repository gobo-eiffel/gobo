indexing

	description:

		"Compiled xsl:functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_CALLABLE_FUNCTION

inherit

	HASHABLE

	XM_XPATH_EXPRESSION_CONTAINER

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	XM_XPATH_SHARED_EXPRESSION_TESTER

	UC_SHARED_STRING_EQUALITY_TESTER

feature -- Access

	function_name: STRING
			-- QName of function

	last_called_value: XM_XPATH_VALUE
			-- Result of last call

	parameter_definitions: DS_ARRAYED_LIST [XM_XSLT_USER_FUNCTION_PARAMETER]
			-- Parameters to the call

	hash_code: INTEGER is
			-- hash code
		do
			Result := function_name.hash_code
		end

	parameter_references (a_binding: XM_XPATH_BINDING): INTEGER is
			-- Approximate count of references by parameters of `Current' to `a_binding'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_USER_FUNCTION_PARAMETER]
		do
			if parameter_definitions /= Void then
				from
					a_cursor := parameter_definitions.new_cursor; a_cursor.start
				variant
					parameter_definitions.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					if a_binding = a_cursor.item then
						Result := 1
						a_cursor.go_after
					else
						a_cursor.forth
					end
				end
				if Result = 0 then Result := 10 end -- if binding not found, assume many references
			end
		end

feature -- Status report

	is_memo_function: BOOLEAN
			-- Is `Current' marked as a memo function?

	is_computed_expression: BOOLEAN is
			-- Is `Current' a computed expression?
		do
			-- Result := False
		end

	is_user_function: BOOLEAN is
			-- Is `Current' a compiled user function?
		do
			Result := True
		end

feature -- Evaluation

	call (some_actual_arguments: DS_LIST [XM_XPATH_VALUE]; a_transformer: XM_XSLT_TRANSFORMER; evaluate_tail_calls: BOOLEAN) is
			-- Evaluate function call.
			-- If `evaluate_tail_calls' is `False', then `last_called_value' may be an  `XM_XSLT_FUNCTION_CALL_PACKAGE'.
		require
			arguments_not_void: some_actual_arguments /= Void
			transformer_not_void: a_transformer /= Void
		deferred
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

	put_cached_value (a_transformer: XM_XSLT_TRANSFORMER; some_actual_arguments: DS_LIST [XM_XPATH_VALUE]; a_cached_result: XM_XPATH_VALUE) is
			-- Save value in cache.
		require
			memo_function: is_memo_function
			transformer_not_void: a_transformer /= Void
			arguments_not_void: some_actual_arguments /= Void
		local
			a_function_cache: DS_HASH_TABLE [XM_XPATH_VALUE, STRING]
			a_key: STRING
		do
			a_function_cache ?= a_transformer.user_data (Current, "memo-function-cache")
			if a_function_cache = Void then
				create a_function_cache.make_with_equality_testers (10, Void, string_equality_tester)
				a_transformer.put_user_data (Current, "memo-function-cache", a_function_cache)
			end
			a_key := combined_key (some_actual_arguments)
			a_function_cache.force (a_cached_result, a_key)
		end

	cached_value (a_transformer: XM_XSLT_TRANSFORMER; some_actual_arguments: DS_LIST [XM_XPATH_VALUE]): XM_XPATH_VALUE is
			-- Saved value from cache
		require
			memo_function: is_memo_function
			transformer_not_void: a_transformer /= Void
			arguments_not_void: some_actual_arguments /= Void
		local
			a_function_cache: DS_HASH_TABLE [XM_XPATH_VALUE, STRING]
			a_key: STRING
		do
			a_function_cache ?= a_transformer.user_data (Current, "memo-function-cache")
			if a_function_cache /= Void then
				a_key := combined_key (some_actual_arguments)
				if a_function_cache.has (a_key) then
					Result := a_function_cache.item (a_key)
				end
			end
		end

	combined_key (some_actual_arguments: DS_LIST [XM_XPATH_VALUE]): STRING is
			-- Representation of all argument values
		require
			arguments_not_void: some_actual_arguments /= Void
		local
			a_value: XM_XPATH_VALUE
			a_cursor: DS_LIST_CURSOR [XM_XPATH_VALUE]
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			a_node: XM_XPATH_NODE
		do
			create Result.make (0)
			from
				a_cursor := some_actual_arguments.new_cursor; a_cursor.start
			variant
				some_actual_arguments.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_value := a_cursor.item
				from
					an_iterator := a_value.iterator (Void);an_iterator.start
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
				a_cursor.forth
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

end
	
