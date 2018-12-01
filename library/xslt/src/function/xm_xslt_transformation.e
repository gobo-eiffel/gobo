note

	description:

		"Objects that implement the gexslt:transformation() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TRANSFORMATION

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, create_iterator, check_static_type
		end

	XM_XPATH_NODE_FACTORY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "transformation"; namespace_uri := Gexslt_eiffel_type_uri
			fingerprint := Gexslt_transformation_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 7
			create arguments.make (7)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := any_item
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			inspect
				argument_number
			when 1 then
				create Result.make_single_string
			when 2 then
				if arguments.count = 7 then
					create Result.make_optional_node
				else
					create Result.make_single_node
				end
			when 3, 4 then
				create Result.make_optional_qname
			when 5 then
				create Result.make_qname_sequence
			when 6 then
				create Result.make_any_sequence
			when 7 then
				create Result.make_optional_string
			end
		end


feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			if attached {like static_context} a_context as l_static_context then
				static_context := l_static_context
			else
				static_context := Void
			end
			Precursor (a_replacement, a_context, a_context_item_type)
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		local
			l_result: XM_XSLT_TRANSFORMATION_RESULT
			l_builder: XM_XPATH_TREE_BUILDER
			l_config: XM_XSLT_CONFIGURATION
			l_tracer: detachable XM_XSLT_TRACE_LISTENER
		do
			last_iterator := Void
			last_error := Void
			check attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_context then
				evaluate_arguments (l_context)
				check attached transformer as l_transformer then
					if last_error /= Void then
						last_iterator := qname_value_iterator
					elseif initial_context = Void and l_transformer.initial_template = Void then
						create last_error.make_from_string ("An initial template is required when no source document is present",
																		Gexslt_eiffel_type_uri, "NO_INITIAL_TEMPLATE", Static_error)
						last_iterator := qname_value_iterator
					else
						check attached static_context as l_static_context then
							create l_builder.make (Current, l_static_context.base_uri.full_reference, Void)
							create l_result.make_receiver (l_builder)
							l_config := l_transformer.configuration
							l_tracer := l_config.trace_listener
							l_config.set_trace_listener (Void)
							l_transformer.transform_document (initial_context, l_result)
							l_config.set_trace_listener (l_tracer)
							last_iterator := result_iterator
						end
					end
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_one_or_more
		end

feature {NONE} -- Implementation

	static_context: detachable XM_XSLT_EXPRESSION_CONTEXT
			-- Saved static context for base URI

	last_error: detachable XM_XPATH_ERROR_VALUE
			-- Last reported error

	transformer: detachable XM_XSLT_TRANSFORMER
			-- Transformer to run transformation

	initial_context: detachable XM_XPATH_NODE
			-- Optional initial context

	evaluate_arguments (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Evaluate and validate arguments to function call.
		require
			last_error_is_void: last_error = Void
			a_context_not_void: a_context /= Void
		local
			l_argument: DS_CELL [detachable XM_XPATH_ITEM]
			l_source: XM_XSLT_URI_SOURCE
			l_factory: XM_XSLT_TRANSFORMER_FACTORY
		do
			create l_argument.make (Void)
			arguments.item (1).evaluate_item (l_argument, a_context)
			check attached l_argument.item as l_argument_item_1 then
				if l_argument_item_1.is_error then
					last_error := l_argument_item_1.error_value
				else
					create l_source.make (l_argument_item_1.as_string_value.string_value)
					check attached a_context.transformer as l_context_transformer then
						l_factory := l_context_transformer.transformer_factory
						check attached static_context as l_static_context then
							l_factory.create_new_transformer (l_source, l_static_context.base_uri)
							if attached l_factory.last_error_message as l_last_error_message then
								check was_error: l_factory.was_error end
								create last_error.make_from_string (l_last_error_message, Gexslt_eiffel_type_uri, "COMPILE_FAILED", Static_error)
							else
								transformer := l_factory.created_transformer
								create l_argument.make (Void)
								arguments.item (2).evaluate_item (l_argument, a_context)
								if not attached l_argument.item as l_argument_item_2 then
									initial_context := Void
								elseif l_argument_item_2.is_error then
									last_error := l_argument_item_2.error_value
								else
									initial_context := l_argument_item_2.as_node
								end
								if arguments.count > 2 then
									evaluate_optional_arguments (a_context)
								end
							end
						end
					end
				end
			end
		ensure
			no_error_implies_transformer_not_void: last_error = Void implies transformer /= Void
		end

	evaluate_optional_arguments (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Evaluate arguments beyond second argument.
		require
			last_error_is_void: last_error = Void
			a_context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
			seven_arguments: arguments.count = 7
		local
			l_argument: DS_CELL [detachable XM_XPATH_ITEM]
			l_iterator, l_iterator_2: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			check precondition_transformer_not_void: attached transformer as l_transformer then
				create l_argument.make (Void)
				arguments.item (3).evaluate_item (l_argument, a_context)
				if attached l_argument.item as l_argument_item then
					if attached l_argument_item.error_value as l_error_value then
						check is_error: l_argument_item.is_error end
						last_error := l_error_value
					else
						l_transformer.set_initial_template (l_argument_item.as_qname_value.expanded_name)
					end
				end
				if not is_error then
					create l_argument.make (Void)
					arguments.item (4).evaluate_item (l_argument, a_context)
					if attached l_argument.item as l_argument_item then
						if attached l_argument_item.error_value as l_error_value then
							check is_error: l_argument_item.is_error end
							last_error := l_error_value
						else
							l_transformer.set_initial_mode (l_argument_item.as_qname_value.expanded_name)
						end
					end
				end
				if not is_error then
					arguments.item (5).create_iterator (a_context)
					check postcondition_of_create_iterator: attached arguments.item (5).last_iterator as l_last_iterator then
						l_iterator := l_last_iterator
						if l_iterator.is_error then
							last_error := l_iterator.error_value
						else
							arguments.item (6).create_iterator (a_context)
							check postcondition_of_create_iterator: attached arguments.item (6).last_iterator as l_last_iterator_2 then
							l_iterator_2 := l_last_iterator_2
								if l_iterator_2.is_error then
									last_error := l_iterator.error_value
								else
									process_parameters (l_iterator, l_iterator_2)
								end
							end
						end
					end
				end
				if not is_error then
					arguments.item (7).create_iterator (a_context)
					check postcondition_of_create_iterator: attached arguments.item (7).last_iterator as l_last_iterator then
						l_iterator := l_last_iterator
						if l_iterator.is_error then
							last_error := l_iterator.error_value
						else
							l_iterator.start
							if l_iterator.is_error then
								last_error := l_iterator.error_value
							elseif not l_iterator.after then
								create last_error.make_from_string ("Feature name " + l_iterator.item.string_value + " is not recognized",
																				Gexslt_eiffel_type_uri, "UNRECOGNIZED_FEATURE", Dynamic_error)
							end
						end
					end
				end
			end
		end

	process_parameters (a_names, a_values: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM])
			-- Process global stylesheet parameters.
		require
			a_names_not_void: a_names /= Void
			a_names_before: a_names.before
			a_values_not_void: a_values /= Void
			a_values_before: a_values.before
		local
			l_name: XM_XPATH_QNAME_VALUE
			l_value: STRING
		do
			from
				a_names.start
				a_values.start
			until
				last_error /= Void or a_names.after or a_values.after
			loop
				if a_names.is_error then
					last_error := a_names.error_value
				elseif a_values.is_error then
					last_error := a_values.error_value
				else
					l_name := a_names.item.as_qname_value
					l_value := a_values.item.string_value
					check attached transformer as l_transformer then
						l_transformer.set_xpath_parameter (l_value, l_name.expanded_name)
					end
					a_names.forth
					a_values.forth
				end
			end
			if last_error = Void then
				if not a_names.after then
					create last_error.make_from_string ("Not enough parameter values supplied",
																	Gexslt_eiffel_type_uri, "PARAMETER_MISMATCH", Dynamic_error)
				elseif not a_values.after then
					create last_error.make_from_string ("Too many parameter values supplied",
																	Gexslt_eiffel_type_uri, "PARAMETER_MISMATCH", Dynamic_error)
				end
			end
		end

	result_iterator: XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]
			-- Iterator over result documents
		require
			last_error_is_void: last_error = Void
			transformer_not_void: transformer /= Void
		local
			l_list: DS_ARRAYED_LIST [XM_XPATH_NODE]
			l_builder: XM_XPATH_BUILDER
		do
			check precondition_transformer_not_void: attached transformer as l_transformer then
				if l_transformer.is_error then
					last_error := l_transformer.last_error
					Result := qname_value_iterator
				else
					create l_list.make (1)
					check
						attached l_transformer.principal_result as l_principal_result
						attached l_principal_result.principal_receiver as l_principal_receiver
					then
						l_builder := l_principal_receiver.as_builder
						if attached l_builder.current_root as l_current_root then
							l_list.put_first (l_current_root)
						end
						create {XM_XPATH_ARRAY_NODE_LIST_ITERATOR} Result.make (l_list)
					end
				end
			end
		ensure
			result_not_void: Result /= Void
		end

	qname_value_iterator: XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]
			-- Iterator over components of `last_error'
		require
			last_error_not_void: last_error /= Void
		local
			l_uri, l_local_part, l_prefix: STRING
			l_desc: XM_XPATH_STRING_VALUE
			l_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_qname: XM_XPATH_QNAME_VALUE
			l_name_code: INTEGER
			l_list: DS_ARRAYED_LIST [XM_XPATH_ITEM]
		do
			check precondition_last_error_not_void: attached last_error as l_last_error then
				l_uri := l_last_error.namespace_uri
				l_local_part := l_last_error.code
				create l_desc.make (l_last_error.description)
				l_value := l_last_error.value
				l_prefix := arbitrary_qname_prefix (l_uri)
				if shared_name_pool.is_name_code_allocated (l_prefix, l_uri, l_local_part) then
					l_name_code := shared_name_pool.name_code (l_prefix, l_uri, l_local_part)
				else
					shared_name_pool.allocate_name (l_prefix, l_uri, l_local_part)
					l_name_code := shared_name_pool.last_name_code
				end
				create l_qname.make (l_name_code)
				create l_list.make_default
				l_list.put_first (l_qname)
				l_list.put_last (l_desc)
				from l_value.start until l_value.after loop
					l_list.force_last (l_value.item)
					l_value.forth
				end
				create Result.make (l_list)
			end
		ensure
			result_not_void: Result /= Void
		end

	arbitrary_qname_prefix (a_uri: STRING): STRING
			-- Arbitrary XML prefix
		require
			a_uri_not_void: a_uri /= Void
			a_uri_not_empty: not a_uri.is_empty
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			i: INTEGER
			l_result: detachable STRING
		do
			-- First see if we already have a binding in the stylesheet
			check attached static_context as l_static_context then
				from l_cursor := l_static_context.style_element.namespace_codes_in_scope.new_cursor; l_cursor.start until l_cursor.after loop
					if STRING_.same_string (shared_name_pool.uri_from_namespace_code (l_cursor.item), a_uri) then
						l_result := shared_name_pool.prefix_from_namespace_code (l_cursor.item)
						l_cursor.go_after
					else
						l_cursor.forth
					end
				end
			end
			-- Maybe the namespace is already known to the name pool
			if l_result = Void then
				l_result := shared_name_pool.suggested_prefix_for_uri (a_uri)
				if l_result = Void then
					from i := 0
						l_result := "ns" + i.out
					until not shared_name_pool.is_code_for_prefix_allocated (l_result) loop
						i := i + 1
						l_result := "ns" + i.out
					end
				end
			end
			Result := l_result
		ensure
			chosen_prefix_not_void: Result /= Void
			chosen_prefix_not_empty: not Result.is_empty
		end

end


