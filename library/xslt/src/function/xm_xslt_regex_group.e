note

	description:

		"Objects that implement the XSLT regex-group() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_REGEX_GROUP

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, compute_intrinsic_dependencies
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "regex-group"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Regex_group_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			create Result.make_single_integer
		end

feature -- Status setting

	compute_intrinsic_dependencies
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_regexp_group
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			l_regex_iterator: detachable XM_XSLT_REGEXP_ITERATOR
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			check attached a_result.item as l_result_item then
				if not l_result_item.is_error then
					check
						integer: l_result_item.is_machine_integer_value
						-- Static typing
					end
					l_integer_value := l_result_item.as_machine_integer_value
					a_result.put (Void)
					if attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_evaluation_context then
						l_regex_iterator := l_evaluation_context.current_regexp_iterator
						if l_regex_iterator /= Void then
							if l_integer_value.is_platform_integer then
								if not l_regex_iterator.is_matching then
									a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
								else
									a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_regex_iterator.regex_group (l_integer_value.as_integer)))
								end
							else
								a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
							end
						else
							a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
						end
					else
						a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
					end
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
			-- Supress pre-evaluation
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end

