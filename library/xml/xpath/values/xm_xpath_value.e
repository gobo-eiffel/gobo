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

	is_convertible_to_item (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Can `Current' be converted to an `XM_XPATH_ITEM'?
		deferred
		end

feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		do
			Result := Current
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			mark_unreplaced
		end

	
	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			do_nothing
		end

feature -- Conversion

	as_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Convert to an item
		require
			is_convertible_to_item (a_context)
		deferred
		end
	
feature {NONE} -- Implementation

		trim_white_space (a_string: STRING): STRING is
			-- Remove all leading and trailing characters below character code 33;
			-- Onlu ysable for values that do not permit internal white space
		require
			string_not_void: a_string /= Void
		local
			counter, start_position, finish_position: INTEGER
			started, finished: BOOLEAN
		do
			from
				counter := 1
			variant
				a_string.count + 1 - counter
			until
				counter > a_string.count 
			loop
				if a_string.item_code (counter) < 21 then
					if started then
						finished := True
						finish_position := counter - 1
					end
				elseif not started then
					started := True
					start_position := counter
				end
				counter := counter + 1
			end
			if not finished then finish_position := counter - 1 end
			if start_position > 0 then
					check
						finish_position: finish_position >= start_position
					end
				Result := a_string.substring (start_position, finish_position)
			end
		ensure
			trimmed_string_not_void: Result /= Void
		end

end


