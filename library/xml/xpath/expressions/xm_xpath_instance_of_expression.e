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

	XM_XPATH_UNARY_EXPRESSION
		redefine
			same_expression, analyze, effective_boolean_value, evaluate_item,
			compute_cardinality, item_type, display
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
			make_unary (a_source)
			target_type := a_target_type
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_source
			target_set: target_type = a_target_type
		end

feature -- Access

	target_type: XM_XPATH_SEQUENCE_TYPE
			-- Target sequence type

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			other_instance_of: XM_XPATH_INSTANCE_OF_EXPRESSION
		do
			other_instance_of ?= other
			if other_instance_of /= Void then
				Result := base_expression.same_expression (other_instance_of.base_expression) 
					and then other_instance_of.target_type = target_type
					and then other_instance_of.cardinality = cardinality
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
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
				base_expression.display (a_level + 1)
				a_string := STRING_.appended_string (indentation (a_level + 1), target_type.primary_type.conventional_name)
				a_string := STRING_.appended_string (a_string, target_type.occurence_indicator)			
				std.error.put_string (a_string)
				std.error.put_new_line
			end
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		local
			a_value: XM_XPATH_VALUE
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_expression: XM_XPATH_EXPRESSION
		do
			mark_unreplaced
			base_expression.analyze (a_context)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				a_value ?= base_expression
				if a_value /= Void then
					evaluate_item (Void)
					if last_evaluated_item /= Void then
						an_atomic_value ?= last_evaluated_item
						set_replacement (an_atomic_value)
					end
				else
					
					-- See if we can get the answer by static analysis.
					
					if target_type.cardinality_subsumes (base_expression.cardinality) and then
						is_sub_type (base_expression.item_type, target_type.primary_type) then
						create {XM_XPATH_BOOLEAN_VALUE} an_expression.make (True)
						set_replacement (an_expression)
					end
				end
			end
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
			an_iterator := base_expression.iterator (a_context)
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

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			-- not used
		end

invariant

	target_sequence_type_not_void: target_type /= Void

end
