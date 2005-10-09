indexing

	description:

		"Objects that implement the XPath nilled() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NILLED

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	XM_XPATH_TOKENS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "nilled"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Nilled_function_type_code
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
			create Result.make_optional_node
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_node: XM_XPATH_NODE
		do
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif arguments.item (1).last_evaluated_item.is_error then
				last_evaluated_item := arguments.item (1).last_evaluated_item
			elseif arguments.item (1).last_evaluated_item.is_node then
				a_node := arguments.item (1).last_evaluated_item.as_node
				if a_node.node_type = Element_node then
					check
						not_schema_aware: conformance.basic_xslt_processor
						-- Actually, the real critereon is that
						--  the data model has been built from an infoset,
						--  not a PSVI
					end
					create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (False)
				else
					last_evaluated_item := Void
				end
			else
				last_evaluated_item := Void
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

end
	
