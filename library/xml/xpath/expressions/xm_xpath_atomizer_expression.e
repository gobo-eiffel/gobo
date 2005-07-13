indexing

	description:

		"Objects that map a sequence by replacing nodes with their typed values. Corresponds to fn:data()"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIZER_EXPRESSION

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			item_type, simplify, analyze, create_iterator, evaluate_item, compute_cardinality, compute_special_properties
		end

	XM_XPATH_SHARED_ATOMIZING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			sequence_not_void: a_sequence /= Void
		do
			make_unary (a_sequence)
			compute_static_properties
			initialized := True
		ensure
			base_expression_set: base_expression = a_sequence
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := base_expression.item_type
			if not Result.is_atomic_type then
				Result := type_factory.any_atomic_type -- best guess
			end			
		end

feature -- Optimization	

	simplify is
			-- Perform context-independent static optimizations
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			finished: BOOLEAN
		do
			base_expression.simplify
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			elseif base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_atomic_value then
				set_replacement (base_expression.as_atomic_value)
			else
				if base_expression.is_value then
					from
						base_expression.create_iterator (Void)
						an_iterator := base_expression.last_iterator
						if an_iterator.is_error then
							finished := True
							set_last_error (an_iterator.error_value)
						else
							an_iterator.start
						end
					until
						finished or else an_iterator.after
					loop

						-- If all items in the sequence are atomic (they generally will be, since this is
						--  done at compile time), then return the sequence.

						if an_iterator.item.is_node then
							finished := True
						else
							an_iterator.forth
						end
					end
					if not finished then
						set_replacement (base_expression)
					end
				end
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		do
			mark_unreplaced
			base_expression.analyze (a_context)
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				if base_expression.was_expression_replaced then
					set_base_expression (base_expression.replacement_expression)
				end
				reset_static_properties
				if is_sub_type (base_expression.item_type, type_factory.any_atomic_type) then
					set_replacement (base_expression)
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE]
		do
			base_expression.evaluate_item (a_context)
			if base_expression.last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif base_expression.last_evaluated_item.is_error then
				last_evaluated_item := base_expression.last_evaluated_item
			else
				if base_expression.last_evaluated_item.is_node then
					an_iterator := base_expression.last_evaluated_item.as_node.typed_value
					if an_iterator.is_error then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
					else
						an_iterator.start
						if an_iterator.is_error then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
						else
							last_evaluated_item := an_iterator.item
						end
					end
				else
					last_evaluated_item := base_expression.last_evaluated_item
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.create_iterator (a_context)
			an_iterator := base_expression.last_iterator
			if an_iterator.is_error then
				last_iterator := an_iterator
			else
				last_iterator := shared_atomizing_function.new_atomizing_iterator (an_iterator)
			end
		end

feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "atomize"
		end

	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more -- TODO: we can do better than this
		end

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

end

	
