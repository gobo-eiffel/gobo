indexing

	description:

		"XPath cast as xs:QName Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CAST_AS_QNAME_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			sub_expressions, evaluate_item
		end

creation

	make

feature {NONE} -- Initialization
	
	make (an_expression: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			source_expression_not_void: an_expression /= Void
		do
			source := an_expression
			compute_static_properties
		ensure
			static_properties_computed: are_static_properties_computed
			source_set: source = an_expression
		end


feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Qname_type
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.put (source, 1)
			Result.set_equality_tester (expression_tester)
		end
	
feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "cast as QName")
			if is_error then
				std.error.put_string (a_string)
				std.error.put_string ("In error%N")
			else
				std.error.put_string (a_string)
				std.error.put_new_line
				source.display (a_level + 1, a_pool)
			end
		end

feature -- Optimization	

		analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		do
			todo ("analyze", False)
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			todo ("evaluate-item", False)
		end

feature {NONE} -- Implementation

	source: XM_XPATH_EXPRESSION
			-- Expression to be cast

	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

invariant

	source_expression_not_void: source /= Void

end
	
