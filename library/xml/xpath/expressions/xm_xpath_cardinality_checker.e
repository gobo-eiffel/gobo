indexing

	description:

	"Objects that implement the cardinality checking of 'treat as':%
	%that is, return the supplied sequence, checking that its cardinality is correct"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CARDINALITY_CHECKER

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplified_expression, promote, sub_expressions, iterator, evaluate_item, compute_special_properties
		end

	XM_XPATH_MAPPING_FUNCTION

creation

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION; a_request: INTEGER; a_role_locator: XM_XPATH_ROLE_LOCATOR) is
			-- Establish invariant.
		require
				underlying_expression_not_void: a_sequence /= Void
				role_locator_not_void: a_role_locator /= void
				valid_cardinality_request: is_valid_required_cardinality (a_request)
		do
			sequence := a_sequence
			required_cardinality := a_request
			role_locator := a_role_locator
			compute_static_properties
			initialize
		ensure
			sequence_set: sequence = a_sequence
			required_cardinality_set: required_cardinality = a_request
			role_locator_set: role_locator = a_role_locator
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	sequence: XM_XPATH_EXPRESSION
			-- The underlying expression

	required_cardinality: INTEGER
			-- The required cardinality

	role_locator: XM_XPATH_ROLE_LOCATOR
			-- Role locator for error messages

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := sequence.item_type
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
			Result.put_last (sequence)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "check-cardinality (")
			a_string := STRING_.appended_string (a_string, required_cardinality.out)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				sequence.display (a_level + 1)
			end
		end

feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			a_result_expression: XM_XPATH_CARDINALITY_CHECKER
			an_expression: XM_XPATH_EXPRESSION
		do
			an_expression := sequence.simplified_expression
			if an_expression.is_error then
				Result := an_expression
			else
				a_result_expression := clone (Current)
				a_result_expression.set_sequence (an_expression)
				Result := a_result_expression
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			mark_unreplaced
			sequence.analyze (a_context)
			if sequence.was_expression_replaced then
				set_sequence (sequence.replacement_expression)
			end
			if sequence.is_error then
				set_last_error (sequence.error_value)
			else
				if required_cardinality = Required_cardinality_zero_or_more then
					set_replacement (sequence)
				elseif sequence.cardinality_subsumes (required_cardinality) then
					set_replacement (sequence)
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
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			finished: BOOLEAN
			items: INTEGER
			an_item: XM_XPATH_ITEM
		do
			last_evaluated_item := Void
			an_iterator := iterator (a_context)
			if not an_iterator.is_error then
				from
					an_iterator.start
				until
					finished or else an_iterator.is_error
				loop
					if an_iterator.is_error then
						finished := True
					elseif an_iterator.after then
						finished := True
					else
						an_item := an_iterator.item
						if an_item /= Void then
							last_evaluated_item := an_item
							items := items + 1
						end
						if items > 1 then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (STRING_.appended_string ("A sequence of more than one item is not allowed as the ", role_locator.message), 6, Type_error)
							finished := True
						else
							an_iterator.forth
						end
					end
				end

				if not an_iterator.is_error then
					if items = 0 and then not is_cardinality_allows_zero (required_cardinality) then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (STRING_.appended_string ("An empty sequence is not allowed as the ", role_locator.message), 6, Type_error)
					end
				else
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
				end
			else
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_stopper: XM_XPATH_OBJECT_VALUE
		do
			an_iterator := sequence.iterator (a_context)
			if not an_iterator.is_error then
				if not is_cardinality_allows_zero (required_cardinality) then

					-- To check for an empty sequence, we add a special item to the base
					-- iteration, to ensure that the mapping function gets called at least
					-- once. This item will cause an error if it is the first in the sequence,
					-- and will be ignored otherwise.
			
					create a_stopper.make (Current)
					create {XM_XPATH_APPEND_ITERATOR} an_iterator.make (an_iterator, a_stopper, a_context)
				end
				create {XM_XPATH_MAPPING_ITERATOR} Result.make (an_iterator, Current, Void, an_iterator)
			else
				Result := an_iterator 
			end
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT; an_information_object: ANY): XM_XPATH_MAPPED_ITEM is
			-- Map `an_item' to a sequence
		local
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_stopper: XM_XPATH_OBJECT_VALUE
			a_position: INTEGER
			an_invalid_item: XM_XPATH_INVALID_ITEM
		do
				check
					information_object_not_void: an_information_object /= Void
				end

			a_sequence_iterator ?= an_information_object
				check
					iterator_not_void: a_sequence_iterator /= Void
					iterator_not_in_error: not a_sequence_iterator.is_error
					-- See logic of `iterator' above.
				end
			a_position := a_sequence_iterator.index
			a_stopper ?= an_item
			if a_stopper /= Void then
				if a_position = 1 then
					create an_invalid_item.make_from_string (STRING_.appended_string ("An empty sequence is not allowed as the ", role_locator.message), 6, Type_error)
					create Result.make_item (an_invalid_item)
				end

				-- We don't include the stopper in the result
				
					Result := Void
			else -- no stopper
				if a_position = 2 and then not cardinality_allows_many then
					create an_invalid_item.make_from_string (STRING_.appended_string ("A sequence of more than one item is not allowed as the ", role_locator.message), 6, Type_error)
					create Result.make_item (an_invalid_item)
				else
					create Result.make_item (an_item)
				end
			end
		end

feature {XM_XPATH_CARDINALITY_CHECKER} -- Local

	set_sequence (a_sequence: XM_XPATH_EXPRESSION) is
			-- Set `sequence'.
		require
			underlying_expression_not_void: a_sequence /= Void
		do
			sequence := a_sequence
		ensure
			sequence_set: sequence = a_sequence
		end


feature {XM_XPATH_EXPRESSION} -- Restricted
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality (required_cardinality)
		end
		

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (sequence)
		end

invariant

	underlying_expression_not_void: sequence /= Void
	role_locator_not_void: role_locator /= void
	valid_cardinality_request: is_valid_required_cardinality (required_cardinality)

end

