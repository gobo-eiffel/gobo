indexing

	description:

		"XPath values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_VALUE

	-- A value is the result of an expression but it is also an expression in its own right;
	-- Note that every value can be regarded as a sequence - in many cases, a sequence of length one

inherit

	XM_XPATH_EXPRESSION

feature {NONE} -- Initialization

	make_value is
			-- Establish static properties
		do
			create special_properties.make (1, 6) -- All False
			create dependencies.make (1, 6) -- All False
			intrinsic_dependencies := dependencies
			create cardinalities.make (1, 3) -- All False
			are_intrinsic_dependencies_computed := True
			are_dependencies_computed := True
			are_cardinalities_computed := True
			are_special_properties_computed := True
		end
	
feature -- Access

	frozen sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make_default
			Result.set_equality_tester (expression_tester)
		end

feature -- Status report
	
	last_static_type_error: STRING is
			-- Last static type error message
		do
			Result := ""
		end

feature -- Status setting

	set_last_static_type_error (msg: STRING) is
			-- Set result of `last_static_type_error'.
		do
			do_nothing -- (Pre-condition cannot be True)
		end
	
feature -- Optimization

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify `Current'
		do
			Result := Current
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of `Current' and its subexpressions
		do
			Result := Current
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for this subexpression
		do
			Result := Current
		end

end


