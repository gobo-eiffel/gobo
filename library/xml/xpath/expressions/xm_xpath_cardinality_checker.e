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
			simplify, promote, sub_expressions, iterator, evaluate_item, compute_special_properties
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

	item_type: INTEGER is
			-- Determine the data type of the expression, if possible
		do
			Result := sequence.item_type
		end


	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put_last (sequence)
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_iterator := sequence.iterator (a_context)
			an_iterator.start
			if an_iterator.after then
				if not is_cardinality_allows_zero (required_cardinality) then
					Result := Void
					set_last_error_from_string (STRING_.appended_string ("An empty sequence is not allowed as the ", role_locator.message), 6, Type_error)
				end
			end
			if not is_error then
				if not is_cardinality_allows_zero (required_cardinality) then
					todo ("iterator", True)
					-- TODO need mapping iterator for this
				else
					Result := an_iterator
				end
			end
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT; an_information_object: ANY): XM_XPATH_MAPPED_ITEM is
			-- Map `an_item' to a sequence
		do
			-- TODO
			todo ("map", False)
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "check-cardinality (")
			a_string := STRING_.appended_string (a_string, required_cardinality.out)
			a_string := STRING_.appended_string (a_string, "%)")
			std.error.put_string (a_string)
			std.error.put_new_line
			sequence.display (a_level + 1, a_pool)
		end

feature -- Optimization

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify `Current'
		local
			a_result_expression: XM_XPATH_CARDINALITY_CHECKER
		do
			a_result_expression := clone (Current)
			a_result_expression.set_sequence (sequence.simplify)
			Result := a_result_expression
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			set_analyzed
				check
					sequence.may_analyze -- TODO - this certainly won't be the case
				end
			sequence.analyze (a_context)
			if sequence.was_expression_replaced then
				set_sequence (sequence.replacement_expression)
			end
			if sequence.is_error then
				set_last_error (sequence.last_error)
			else
				if required_cardinality = Required_cardinality_zero_or_more then
					was_expression_replaced := True
					replacement_expression := sequence
				elseif sequence.cardinality_subsumes (required_cardinality) then
					was_expression_replaced := True
					replacement_expression := sequence
				end
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for `Current'
		do
			set_sequence (sequence.promote (an_offer))
			Result := Current
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			last_evaluated_item := Void
			an_iterator := iterator (a_context)
			an_iterator.start
			if an_iterator.after then
				if required_cardinality = Required_cardinality_empty then
					set_last_error_from_string (STRING_.appended_string ("An empty sequence is not allowed as the ", role_locator.message), 6, Type_error)
				end
			end
			if not is_error then
				 last_evaluated_item := an_iterator.item
				if not is_cardinality_allows_many (required_cardinality) then
					an_iterator.forth
					if not an_iterator.after then
						last_evaluated_item := Void
						set_last_error_from_string (STRING_.appended_string ("A sequence of more than one item is not allowed as the ", role_locator.message), 6, Type_error)
					end
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

