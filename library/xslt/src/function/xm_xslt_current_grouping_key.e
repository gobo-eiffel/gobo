note

	description:

		"Objects that implement the XSLT current-grouping-key() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
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

	make
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

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.any_atomic_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	is_current_grouping_key: BOOLEAN
			-- Is `Current' the XSLT "current-grouping-key()" function?
		do
			Result := True
		end

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			-- will never be called
			check False then end
		end

feature -- Status setting

	compute_intrinsic_dependencies
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_current_group
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_group_iterator: detachable XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM]
		do
			check
				evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_evaluation_context
				-- as this is an XSLT function
			then
				l_group_iterator := l_evaluation_context.current_group_iterator
				if l_group_iterator = Void then
					a_result.put (Void)
				else
					a_result.put (l_group_iterator.current_grouping_key)
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
			-- Suppress compile-time evaluation
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

end


