indexing

	description:

		"XPath InstanceOf Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INSTANCE_OF_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			sub_expressions, simplified_expression, promote, effective_boolean_value, evaluate_item
		end

creation

	make

feature {NONE} -- Initialization

	make (a_source: XM_XPATH_EXPRESSION; a_target_type: XM_XPATH_SEQUENCE_TYPE) is
			-- Establish invariant.
		require
			source_expression_not_void: a_source /= Void
			target_sequence_type_not_void: a_target_type /= Void
		do
			source := a_source
			target_type := a_target_type
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed
			source_set: source = a_source
			target_set: target_type = a_target_type
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
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
			a_string := STRING_.appended_string (indentation (a_level), "instance-of ")
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				source.display (a_level + 1, a_pool)
				a_string := STRING_.appended_string (indentation (a_level + 1), target_type.primary_type.conventional_name)
				a_string := STRING_.appended_string (a_string, target_type.occurence_indicator)			
				std.error.put_string (a_string)
				std.error.put_new_line
			end
		end

feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			a_result_expression: XM_XPATH_INSTANCE_OF_EXPRESSION
			an_expression: XM_XPATH_EXPRESSION
		do
			an_expression := source.simplified_expression
			if an_expression.is_error then
				Result := an_expression
			else
				a_result_expression := clone (Current)
				a_result_expression.set_source (an_expression)
				Result := a_result_expression
			end		
			
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		local
			a_value: XM_XPATH_VALUE
			an_expression: XM_XPATH_EXPRESSION
		do
			mark_unreplaced
			source.analyze (a_context)
			if source.was_expression_replaced then
				set_source (source.replacement_expression)
			end
			if source.is_error then
				set_last_error (source.error_value)
			else
				a_value ?= source
				if a_value /= Void then
					create {XM_XPATH_BOOLEAN_VALUE} an_expression.make (True)
				else
					
					-- See if we can get the answer by static analysis.

					if target_type.cardinality_subsumes (source.cardinality) and then
						is_sub_type (source.item_type, target_type.primary_type) then

						create {XM_XPATH_BOOLEAN_VALUE} an_expression.make (True)
					end
				end
				if an_expression /= Void then set_replacement (an_expression) end
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			source.promote (an_offer)
			if source.was_expression_replaced then set_source (source.replacement_expression) end
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			counter: INTEGER
			finished: BOOLEAN
		do
			an_iterator := source.iterator (a_context)
			if an_iterator.is_error then
				create Result.make (False)
				Result.set_last_error (an_iterator.error_value)
			else
				from
					counter := 0; finished := False
					an_iterator.start
				until
					finished or else an_iterator.after
				loop
					an_item := an_iterator.item
					counter := counter + 1
					if not is_sub_type (an_item.item_type, target_type.primary_type) then
						create Result.make (False); finished := True
					elseif counter = 2 and then not target_type.cardinality_allows_many then
						create Result.make (False)
					end
					an_iterator.forth
				end
				if Result = Void then
					if counter = 0 and then not target_type.cardinality_allows_zero then
						create Result.make (False)
					else
						create Result.make (True)
					end
				end
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			last_evaluated_item := effective_boolean_value (a_context)
		end

feature {XM_XPATH_INSTANCE_OF_EXPRESSION} -- Local

	set_source (a_source: XM_XPATH_EXPRESSION) is
			-- Set `source'.
		require
			source_expression_not_void: a_source /= Void
		do
			source := a_source
			if source.was_expression_replaced then source.mark_unreplaced end
		ensure
			source_set: source = a_source
			source_not_marked_for_replacement: not source.was_expression_replaced
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end
	
	source: XM_XPATH_EXPRESSION
			--  Source expression

	target_type: XM_XPATH_SEQUENCE_TYPE
			-- Target sequence type

invariant

	source_expression_not_void: source /= Void
	target_sequence_type_not_void: target_type /= Void

end
