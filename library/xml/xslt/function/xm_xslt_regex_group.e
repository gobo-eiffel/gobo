indexing

	description:

		"Objects that implement the XSLT regex-group() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_REGEX_GROUP

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, compute_intrinsic_dependencies
		end

create

	make

feature {NONE} -- Initialization

	make is
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

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_single_integer
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_regexp_group
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			a_regex_iterator: XM_XSLT_REGEXP_ITERATOR
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
		do
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item.is_error then
				last_evaluated_item := arguments.item (1).last_evaluated_item
			else
				check
					integer: arguments.item (1).last_evaluated_item.is_machine_integer_value
					-- Static typing
				end
				an_evaluation_context ?= a_context
				a_regex_iterator := an_evaluation_context.current_regexp_iterator
				if a_regex_iterator /= Void then
					an_integer_value := arguments.item (1).last_evaluated_item.as_machine_integer_value
					if an_integer_value.is_platform_integer then
						create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (a_regex_iterator.regex_group (arguments.item (1).as_machine_integer_value.as_integer))
					else
						create {XM_XPATH_STRING_VALUE} last_evaluated_item.make ("")
					end
				end
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			-- Supress pre-evaluation
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
