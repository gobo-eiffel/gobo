indexing

	description:

		"Objects that implement the XSLT function-available() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FUNCTION_AVAILABLE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, check_arguments
		end

	XM_XPATH_SHARED_FUNCTION_FACTORY

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "function-available"
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
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
				create Result.make_single_integer
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_arity: INTEGER
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
			a_qname, a_uri, a_local_name, an_xml_prefix: STRING
			a_splitter: ST_SPLITTER
			qname_parts: DS_LIST [STRING]
			a_boolean: BOOLEAN
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			an_arity := -1
			if arguments.count = 2 then
				arguments.item (2).evaluate_item (a_context)
				if arguments.item (2).last_evaluated_item.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (arguments.item (2).last_evaluated_item.error_value)
				else
					an_integer_value ?= arguments.item (2).last_evaluated_item
					check
						integer: an_integer_value /= Void
						-- static typing
					end
					an_arity := an_integer_value.value.to_integer
				end
			end
			if not is_error then
				arguments.item (1).evaluate_item (a_context)
				if arguments.item (1).last_evaluated_item.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("First argument to 'function-available' is not a lexical QName", "XT1400", Dynamic_error)
				else
					an_atomic_value ?= arguments.item (1).last_evaluated_item
					if an_atomic_value = Void then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("First argument to 'function-available' is not a lexical QName", "XT1400", Dynamic_error)
					else
						a_qname := an_atomic_value.string_value
										create a_splitter.make
										a_splitter.set_separators (":")
										qname_parts := a_splitter.split (a_qname)
						if qname_parts.count = 0 or else qname_parts.count > 2 then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("First argument to 'function-available' is not a lexical QName", "XT1400", Dynamic_error)
						else
							if qname_parts.count = 1 then
								a_uri := Xpath_functions_uri
								a_local_name := qname_parts.item (1)
							else
								an_xml_prefix := qname_parts.item (1)
								a_uri := namespace_context.uri_for_defaulted_prefix (an_xml_prefix, False)
								a_local_name := qname_parts.item (2)
							end
							if a_uri = Void then
								create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("QName prefix in first argument to 'function-available' has not been declared.", "XT1400", Dynamic_error)
							else
								a_boolean := function_factory.is_function_available (a_uri, a_local_name, an_arity)
								create a_boolean_value.make (a_boolean)
								last_evaluated_item := a_boolean_value
							end
						end
					end
				end
			end
		end


	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		local
			an_arity: INTEGER
			a_string_value: XM_XPATH_STRING_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
			a_qname, a_uri, a_local_name, an_xml_prefix: STRING
			a_splitter: ST_SPLITTER
			qname_parts: DS_LIST [STRING]
			a_boolean: BOOLEAN
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			an_arity := -1
			if arguments.count = 2 then
				arguments.item (2).evaluate_item (Void)
				if arguments.item (2).last_evaluated_item.is_error then
					set_last_error (arguments.item (2).last_evaluated_item.error_value)
				else
					an_integer_value ?= arguments.item (2).last_evaluated_item
					check
						integer: an_integer_value /= Void
						-- static typing
					end
					an_arity := an_integer_value.value.to_integer
				end
			end
			if not is_error then
				a_string_value ?= arguments.item (1)
				check
					fixed_string: a_string_value /= Void
					-- static typing and `pre_evaluate' is only called for foxed values
				end
				a_qname := a_string_value.string_value
				create a_splitter.make
				a_splitter.set_separators (":")
				qname_parts := a_splitter.split (a_qname)
				if qname_parts.count = 0 or else qname_parts.count > 2 then
					set_last_error_from_string ("First argument to 'function-available' is not a lexical QName", "XT1400", Static_error)
				else
					if qname_parts.count = 1 then
						a_uri := Xpath_functions_uri
						a_local_name := qname_parts.item (1)
					else
						an_xml_prefix := qname_parts.item (1)
						a_uri := a_context.uri_for_prefix (an_xml_prefix)
						a_local_name := qname_parts.item (2)
					end
					a_boolean := function_factory.is_function_available (a_uri, a_local_name, an_arity)
					create a_boolean_value.make (a_boolean)
					set_replacement (a_boolean_value)
				end
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			a_value: XM_XPATH_VALUE
			namespaces_needed: BOOLEAN
			an_expression_context: XM_XSLT_EXPRESSION_CONTEXT
		do
			if not checked then
				Precursor (a_context)
				a_value ?= arguments.item (1)
				if a_value = Void then
					if arguments.count = 1 then
						namespaces_needed := True
					else
						a_value ?= arguments.item (2)
						if a_value /= Void then
							namespaces_needed := True
						end
					end
					if namespaces_needed then
						an_expression_context ?= a_context
						check
							expression_context: an_expression_context /= Void
							-- as this is XSLT
						end
						namespace_context := an_expression_context.namespace_context
					end
				end
				checked := True
			end
		ensure then
			arguments_cheked: checked
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT
			-- Saved namespace context

	checked: BOOLEAN
			-- Has `check_arguments' been called already?

end
	
