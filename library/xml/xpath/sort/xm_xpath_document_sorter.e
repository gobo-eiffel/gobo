indexing

	description:

		"Expressions that sort a sequence of nodes into document order"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DOCUMENT_SORTER

inherit

		XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, compute_special_properties, sub_expressions, promote, iterator, effective_boolean_value
		end

creation

	make

feature {NONE} -- Initialization

	make (an_expression: XM_XPATH_EXPRESSION) is
		require
			expression_not_void: an_expression /= Void and then an_expression.are_static_properties_computed
		do
			base_expression := an_expression
			if base_expression.context_document_nodeset then
				-- TODO - comparer
			else
				-- TODO - comparer
			end
			compute_static_properties
		end

feature -- Access

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression

	item_type: INTEGER is
			-- Determine the data type of the expression, if possible
		do
			Result := base_expression.item_type
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (base_expression, 1)
		end

		iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		do
			Result := Void -- TODO
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "Sort into Document Order")
			std.error.put_string (a_string)
			std.error.put_new_line
			base_expression.display (a_level + 1, a_pool)
		end

feature -- Optimization

		simplify: XM_XPATH_EXPRESSION is
			-- Simplify `Current'
	local
		a_result_expression: XM_XPATH_DOCUMENT_SORTER
		an_expression: XM_XPATH_EXPRESSION
		do
			a_result_expression := clone (Current)
			an_expression := base_expression.simplify
			if not an_expression.is_error then
				a_result_expression.set_base_expression (an_expression)
			else
				a_result_expression.set_last_error (an_expression.last_error)
			end			
			
			Result := a_result_expression
			Result.set_analyzed			
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		local
			an_expression: XM_XPATH_EXPRESSION
		do
				check
					base_expression.may_analyze
				end
				base_expression.analyze (a_context)
				if base_expression.was_expression_replaced then
					set_base_expression (base_expression.replacement_expression)
				end
				if base_expression.is_error then
					set_last_error (base_expression.last_error)
				end
			set_analyzed
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for `Current'
		local
			a_result_expression: XM_XPATH_DOCUMENT_SORTER
			an_expression: XM_XPATH_EXPRESSION		
		do
			an_expression := an_offer.accept (Current)
			if an_expression = Void then
				a_result_expression := clone (Current)
				an_expression := base_expression.promote (an_offer)
				a_result_expression.set_base_expression (an_expression)
				Result := a_result_expression
			else
				Result := an_expression
			end
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			Result := base_expression.effective_boolean_value (a_context)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (base_expression)
			set_ordered_nodeset
		end
	
feature {XM_XPATH_DOCUMENT_SORTER} -- Local

	set_base_expression (an_expression: XM_XPATH_EXPRESSION) is
			-- Set `base_expression'.
		require
			expression_not_void: an_expression /= Void
		do
			base_expression := an_expression
		ensure
			set: base_expression = an_expression
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			clone_cardinality (base_expression)
		end

invariant

	base_expression_not_void: base_expression /= Void

end
	
