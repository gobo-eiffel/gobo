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

	XM_XPATH_UNARY_EXPRESSION
		redefine
			analyze, iterator, evaluate_item, compute_cardinality
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
			make_unary (a_sequence)
			required_cardinality := a_request
			role_locator := a_role_locator
			compute_static_properties
			initialize
		ensure
			sequence_set: base_expression = a_sequence
			required_cardinality_set: required_cardinality = a_request
			role_locator_set: role_locator = a_role_locator
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	required_cardinality: INTEGER
			-- The required cardinality

	role_locator: XM_XPATH_ROLE_LOCATOR
			-- Role locator for error messages

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			mark_unreplaced
			base_expression.analyze (a_context)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				if required_cardinality = Required_cardinality_zero_or_more then
					set_replacement (base_expression)
				elseif base_expression.cardinality_subsumes (required_cardinality) then
					set_replacement (base_expression)
				end
			end
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
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (STRING_.appended_string ("A sequence of more than one item is not allowed as the ",
																																						 role_locator.message), Xpath_errors_uri, "XP0006", Type_error)
							finished := True
						else
							an_iterator.forth
						end
					end
				end

				if not an_iterator.is_error then
					if items = 0 and then not is_cardinality_allows_zero (required_cardinality) then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (STRING_.appended_string ("An empty sequence is not allowed as the ",
																																					 role_locator.message), Xpath_errors_uri, "XP0006", Type_error)
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
			an_iterator := base_expression.iterator (a_context)
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
					create an_invalid_item.make_from_string (STRING_.appended_string ("An empty sequence is not allowed as the ",
																											role_locator.message), Xpath_errors_uri, "XP0006", Type_error)
					create Result.make_item (an_invalid_item)
				end

				-- We don't include the stopper in the result
				
					Result := Void
			else -- no stopper
				if a_position = 2 and then not cardinality_allows_many then
					create an_invalid_item.make_from_string (STRING_.appended_string ("A sequence of more than one item is not allowed as the ",
																											role_locator.message), Xpath_errors_uri, "XP0006", Type_error)
					create Result.make_item (an_invalid_item)
				else
					create Result.make_item (an_item)
				end
			end
		end

feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "checkCardinality (" + cardinality_in_english (required_cardinality) + ")"
		end

feature {XM_XPATH_EXPRESSION} -- Restricted
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality (required_cardinality)
		end

invariant

	role_locator_not_void: role_locator /= void
	valid_cardinality_request: is_valid_required_cardinality (required_cardinality)

end

