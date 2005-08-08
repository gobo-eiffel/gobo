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
			same_expression, check_static_type, calculate_effective_boolean_value, evaluate_item,
			compute_cardinality, item_type, display, is_instance_of_expression,
			as_instance_of_expression
		end

create

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
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_source
			target_set: target_type = a_target_type
		end

feature -- Access

	target_type: XM_XPATH_SEQUENCE_TYPE
			-- Target sequence type

	is_instance_of_expression: BOOLEAN is
			-- Is `Current' an instance-of expression?
		do
			Result := True
		end

	as_instance_of_expression: XM_XPATH_INSTANCE_OF_EXPRESSION is
			-- `Current' seen as an instance-of expression
		do
			Result := Current
		end

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
			if other.is_instance_of_expression then
				other_instance_of := other.as_instance_of_expression
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
			std.error.put_new_line
			base_expression.display (a_level + 1)
			a_string := STRING_.appended_string (indentation (a_level + 1), target_type.primary_type.conventional_name)
			a_string := STRING_.appended_string (a_string, target_type.occurence_indicator)			
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		local
			an_expression: XM_XPATH_EXPRESSION
		do
			mark_unreplaced
			base_expression.check_static_type (a_context)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				if base_expression.is_value then
					evaluate_item (Void)
					if last_evaluated_item /= Void then
						set_replacement (last_evaluated_item.as_atomic_value)
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

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			counter: INTEGER
			finished: BOOLEAN
		do
			base_expression.create_iterator (a_context)
			an_iterator := base_expression.last_iterator
			if an_iterator.is_error then
				create last_boolean_value.make (False)
				last_boolean_value.set_last_error (an_iterator.error_value)
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
						create last_boolean_value.make (False); finished := True
					elseif counter = 2 and then not target_type.cardinality_allows_many then
						create last_boolean_value.make (False)
					end
					an_iterator.forth
				end
				if last_boolean_value = Void then
					if counter = 0 and then not target_type.cardinality_allows_zero then
						create last_boolean_value.make (False)
					else
						create last_boolean_value.make (True)
					end
				end
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			calculate_effective_boolean_value (a_context)
			last_evaluated_item := last_boolean_value
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

	target_sequence_type_not_void: initialized implies target_type /= Void

end
