indexing

	description:

		"Objects that implement the gexslt:transformation() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TRANSFORMATION

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, create_iterator, check_static_type
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "transformation"; namespace_uri := Gexslt_eiffel_type_uri
			fingerprint := Transformation_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 7
			create arguments.make (7)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := any_item			
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
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

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			static_context ?= a_context
			Precursor (a_context, a_context_item_type)
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			l_context: XM_XSLT_EVALUATION_CONTEXT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
			l_builder: XM_XPATH_TINY_BUILDER
			l_config: XM_XSLT_CONFIGURATION
			l_tracer: XM_XSLT_TRACE_LISTENER
		do
			last_iterator := Void
			last_error := Void
			l_context ?= a_context
			evaluate_arguments (l_context)
			if last_error /= Void then
				last_iterator := qname_value_iterator
			elseif initial_context = Void and transformer.initial_template = Void then
				create last_error.make_from_string ("An initial template is required when no source document is present",
																Gexslt_eiffel_type_uri, "NO_INITIAL_TEMPLATE", Static_error)
				last_iterator := qname_value_iterator
			else
				create l_builder.make (static_context.base_uri, Void)
				create l_result.make_receiver (l_builder)
				l_config := transformer.configuration
				l_tracer := l_config.trace_listener
				l_config.set_trace_listener (Void)
				transformer.transform_document (initial_context, l_result)
				l_config.set_trace_listener (l_tracer)
				last_iterator := result_iterator
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			--	do_nothing
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Unused routine to satisfy interface.
		do
			-- Pre-condition will not be met.
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_one_or_more
		end

feature {NONE} -- Implementation

	static_context: XM_XSLT_EXPRESSION_CONTEXT
			-- Saved static context for base URI

	last_error: XM_XPATH_ERROR_VALUE
			-- Last reported error

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer to run transformation

	initial_context: XM_XPATH_NODE
			-- Optional initial context

	evaluate_arguments (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Evaluate and validate arguments to function call.
		require
			last_error_is_void: last_error = Void
			a_context_not_void: a_context /= Void
		local
			l_argument: XM_XPATH_ITEM
			l_source: XM_XSLT_URI_SOURCE
			l_factory: XM_XSLT_TRANSFORMER_FACTORY
		do
			arguments.item (1).evaluate_item (a_context)
			l_argument := arguments.item (1).last_evaluated_item
			if l_argument.is_error then
				last_error := l_argument.error_value
			else
				create l_source.make (l_argument.as_string_value.string_value)
				l_factory := a_context.transformer.transformer_factory
				l_factory.create_new_transformer (l_source, static_context.base_uri)
				if l_factory.was_error then
					create last_error.make_from_string (l_factory.last_error_message, Gexslt_eiffel_type_uri, "COMPILE_FAILED", Static_error)
				else
					transformer := l_factory.created_transformer
					arguments.item (2).evaluate_item (a_context)
					if arguments.item (2).last_evaluated_item = Void then
						initial_context := Void
					elseif arguments.item (2).last_evaluated_item.is_error then
						last_error := arguments.item (2).last_evaluated_item.error_value
					else
						initial_context := arguments.item (2).last_evaluated_item.as_node
					end
					if arguments.count > 2 then
						evaluate_optional_arguments (a_context)
					end
				end
			end
		ensure
			no_error_implies_transformer_not_void: last_error = Void implies transformer /= Void
		end

	evaluate_optional_arguments (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Evaluate arguments beyond second argument.
		require
			last_error_is_void: last_error = Void
			a_context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
			seven_arguments: arguments.count = 7
		local
			l_argument: XM_XPATH_ITEM
			l_iterator, l_iterator_2: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			arguments.item (3).evaluate_item (a_context)
			l_argument := arguments.item (3).last_evaluated_item
			if l_argument /= Void then
				if l_argument.is_error then
					last_error := l_argument.error_value
				else
					transformer.set_initial_template (l_argument.as_qname_value.expanded_name)
				end
			end
			if not is_error then
				arguments.item (4).evaluate_item (a_context)
				l_argument := arguments.item (4).last_evaluated_item
				if l_argument /= Void then
					if l_argument.is_error then
						last_error := l_argument.error_value
					else
						transformer.set_initial_mode (l_argument.as_qname_value.expanded_name)
					end
				end
			end
			if not is_error then
				arguments.item (5).create_iterator (a_context)
				l_iterator := arguments.item (5).last_iterator
				if l_iterator.is_error then
					last_error := l_iterator.error_value
				else
					arguments.item (6).create_iterator (a_context)
					l_iterator_2 := arguments.item (6).last_iterator
					if l_iterator_2.is_error then
						last_error := l_iterator.error_value
					else
						process_parameters (l_iterator, l_iterator_2)
					end
				end
			end
			if not is_error then
				arguments.item (7).create_iterator (a_context)
				l_iterator := arguments.item (7).last_iterator
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

	process_parameters (a_names, a_values: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
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
					transformer.set_xpath_parameter (l_value, l_name.expanded_name)
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

	result_iterator: XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over result documents
		require
			last_error_is_void: last_error = Void
			transformer_not_void: transformer /= Void
		local
			l_list: DS_ARRAYED_LIST [XM_XPATH_NODE]
			l_builder: XM_XPATH_BUILDER
		do
			if transformer.is_error then
				last_error := transformer.last_error
				Result := qname_value_iterator
			else
				create l_list.make (1)
				l_builder := transformer.principal_result.principal_receiver.as_builder
				if l_builder.current_root /= Void then
					l_list.put_first (l_builder.current_root)
				end
				create {XM_XPATH_ARRAY_NODE_LIST_ITERATOR} Result.make (l_list)
			end
		ensure
			result_not_void: Result /= Void
		end

	qname_value_iterator: XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM] is
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
			l_uri := last_error.namespace_uri
			l_local_part := last_error.code
			create l_desc.make (last_error.description)
			l_value := last_error.value
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
		ensure
			result_not_void: Result /= Void
		end

	arbitrary_qname_prefix (a_uri: STRING): STRING is
			-- Arbitrary XML prefix
		require
			a_uri_not_void: a_uri /= Void
			a_uri_not_empty: not a_uri.is_empty
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			found: BOOLEAN
			i: INTEGER
		do
			-- First see if we already have a binding in the stylesheet
			from l_cursor := static_context.style_element.namespace_codes_in_scope.new_cursor; l_cursor.start until l_cursor.after loop
				if STRING_.same_string (shared_name_pool.uri_from_namespace_code (l_cursor.item), a_uri) then
					Result := shared_name_pool.prefix_from_namespace_code (l_cursor.item)
					found := True
					l_cursor.go_after
				else
					l_cursor.forth
				end
			end
			-- Maybe the namespace is already known to the name pool
			if not found then
				Result := shared_name_pool.suggested_prefix_for_uri (a_uri)
				if Result = Void then
					from i := 0
						Result := "ns" + i.out
					until not shared_name_pool.is_code_for_prefix_allocated (Result) loop
						i := i + 1
						Result := "ns" + i.out
					end
				end
			end
		ensure
			chosen_prefix_not_void: Result /= Void
			chosen_prefix_not_empty: not Result.is_empty
		end

end
	

