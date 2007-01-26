indexing

	description:

		"Objects that implement the XSLT current-grouping-key() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CURRENT_GROUPING_KEY

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, compute_intrinsic_dependencies, is_current_grouping_key
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "current-grouping-key"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Current_grouping_key_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 0
			create arguments.make (0)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.any_atomic_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	is_current_grouping_key: BOOLEAN is
			-- Is `Current' the XSLT "current-grouping-key()" function?
		do
			Result := True
		end

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			-- will never be called
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_current_group
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			a_group_iterator: XM_XSLT_GROUP_ITERATOR
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
		do
			an_evaluation_context ?= a_context
			check
				evaluation_context: an_evaluation_context /= Void
				-- as this is an XSLT function
			end
			a_group_iterator := an_evaluation_context.current_group_iterator
			if a_group_iterator = Void then
				last_evaluated_item := Void
			else
				last_evaluated_item := a_group_iterator.current_grouping_key
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			-- Suppress compile-time evaluation
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
			set_cardinality_optional
		end

end
	

