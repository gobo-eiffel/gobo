indexing

	description:

	"Objects that perform a cast on each item in a sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIC_SEQUENCE_CONVERTER

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			sub_expressions, simplify, promote, evaluate_item, iterator
		end

	XM_XPATH_MAPPING_FUNCTION

creation

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION; a_required_type: XM_XPATH_ATOMIC_TYPE) is
			-- Establish invariant.
		require
			sequence_not_void: a_sequence /= Void
			required_type_not_void: a_required_type /= Void
		do
			sequence := a_sequence
			required_type := a_required_type
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed
			sequence_set: sequence = a_sequence
			required_type_set: required_type = a_required_type
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := required_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end


	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (sequence, 1)
		end
			
feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "convert items to ")
			a_string := STRING_.appended_string (a_string, required_type.conventional_name)
			std.error.put_string (a_string)
			sequence.display (a_level + 1)
		end

feature -- Optimization	

	simplify is
			-- Perform context-independent static optimizations.
		do
			sequence.simplify
			if sequence.is_error then
				set_last_error (sequence.error_value)
			elseif sequence.was_expression_replaced then
				set_sequence (sequence.replacement_expression)
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		local
			a_cast_expression: XM_XPATH_CAST_EXPRESSION
		do
			mark_unreplaced
			sequence.analyze (a_context)
			if sequence.was_expression_replaced then
				set_sequence (sequence.replacement_expression)
			end
			if sequence.is_error then
				set_last_error (sequence.error_value)
			else
				if is_sub_type (sequence.item_type, required_type) then
					set_replacement (sequence)
				elseif not sequence.cardinality_allows_many then
					create a_cast_expression.make (sequence, required_type, sequence.cardinality_allows_zero)
					set_replacement (a_cast_expression)
				end
			end
		end


	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			sequence.promote (an_offer)
			if sequence.was_expression_replaced then set_sequence (sequence.replacement_expression) end
		end


feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			sequence.evaluate_item (a_context)
			if sequence.last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif sequence.last_evaluated_item.is_error then
				last_evaluated_item := sequence.last_evaluated_item
			else
				an_atomic_value ?= sequence.last_evaluated_item
				check
					atomic_value: an_atomic_value /= Void
				end
				last_evaluated_item := an_atomic_value.convert_to_type (required_type)
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_iterator := sequence.iterator (a_context)
			if an_iterator.is_error then
				Result := an_iterator
			else
				create {XM_XPATH_MAPPING_ITERATOR} Result.make (an_iterator, Current, Void, Void)
			end
		end
	
	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT; an_information_object: ANY): XM_XPATH_MAPPED_ITEM is
			-- Map `an_item' to a sequence
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			an_atomic_value ?= an_item
			check
				atomic_value: an_atomic_value /= Void
			end
			create Result.make_item (an_atomic_value.convert_to_type (required_type))
		end

feature {XM_XPATH_EXPRESSION} -- Restricted
	
	sequence: XM_XPATH_EXPRESSION
			-- Base expression 

	required_type: XM_XPATH_ATOMIC_TYPE
			-- Target type 

	compute_cardinality is
			-- Compute cardinality.
		do
			clone_cardinality (sequence)
		end

	set_sequence (a_sequence: XM_XPATH_EXPRESSION) is
			-- Set `sequence'
		require
			sequence_not_void: a_sequence /= Void
		do
			sequence := a_sequence
		ensure
			sequence_set: sequence = a_sequence
		end

invariant

	sequence_not_void: sequence /= Void
	required_type_not_void: required_type /= Void

end
