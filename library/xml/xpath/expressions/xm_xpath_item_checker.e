indexing

	description:

	"Objects that implement the type checking of 'treat as':%
	%that is, return the supplied sequence, checking that all its items are of the correct type"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ITEM_CHECKER

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, promote, sub_expressions, iterator, evaluate_item, compute_special_properties
		end

	XM_XPATH_MAPPING_FUNCTION

creation

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION; an_item_type: XM_XPATH_ITEM_TYPE; a_role_locator: XM_XPATH_ROLE_LOCATOR) is
			-- Establish invariant.
		require
				underlying_expression_not_void: a_sequence /= Void
				role_locator_not_void: a_role_locator /= Void
				item_type_not_void: an_item_type /= Void
		do
			sequence := a_sequence
			role_locator := a_role_locator
			required_item_type := an_item_type
			compute_static_properties
			initialize
		ensure
			sequence_set: sequence = a_sequence
			role_locator_set: role_locator = a_role_locator
			item_type_set: required_item_type = an_item_type
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	sequence: XM_XPATH_EXPRESSION
			-- The underlying expression

	required_item_type: XM_XPATH_ITEM_TYPE
			-- The required type for items
	
	role_locator: XM_XPATH_ROLE_LOCATOR
			-- Role locator for error messages

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := required_item_type
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
			a_string := STRING_.appended_string (indentation (a_level), "treat as ")
			a_string := STRING_.appended_string (a_string, required_item_type.conventional_name)
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				sequence.display (a_level + 1)
			end
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		do
			sequence.simplify
			if sequence.was_expression_replaced then
				set_sequence (sequence.replacement_expression)
			end
			if required_item_type = any_item or else sequence.is_error then
				set_replacement (sequence)
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
				if is_sub_type (sequence.item_type, required_item_type) then
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
		do
			sequence.evaluate_item (a_context)
			last_evaluated_item := sequence.last_evaluated_item
			if last_evaluated_item = Void then
				do_nothing  -- can this occur?
			elseif last_evaluated_item.is_error then
				do_nothing
			else
				test_conformance (last_evaluated_item)
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
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
		do
			if not an_item.is_error then test_conformance (an_item) end
			create Result.make_item (an_item)
		end

feature {XM_XPATH_ITEM_CHECKER} -- Local

	set_sequence (a_sequence: XM_XPATH_EXPRESSION) is
			-- Set `sequence'.
		require
			underlying_expression_not_void: a_sequence /= Void
		do
			sequence := a_sequence
			if sequence.was_expression_replaced then sequence.mark_unreplaced end
		ensure
			sequence_set: sequence = a_sequence
			sequence_not_marked_for_replacement: not sequence.was_expression_replaced
		end

feature {XM_XPATH_EXPRESSION} -- Restricted
	
	compute_cardinality is
			-- Compute cardinality.
		do
			clone_cardinality (sequence)
		end

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (sequence)
		end

feature {NONE} -- Implementation

	test_conformance (an_item: XM_XPATH_ITEM) is
			-- Test conformance to `required_item_type'.
			-- Marks `an_item' as in error if check fails.
		require
			item_not_in_error: an_item /= Void and then not an_item.is_error 
		local
			a_message: STRING
		do
			if not required_item_type.matches_item (an_item) then
				a_message := STRING_.appended_string ("Required type of ", role_locator.message)
				a_message := STRING_.appended_string (a_message, " is ")
				a_message := STRING_.appended_string (a_message, required_item_type.conventional_name)
				a_message := STRING_.appended_string (a_message, "; supplied value is ")
				a_message := STRING_.appended_string (a_message, an_item.item_type.conventional_name)
				an_item.set_last_error_from_string (a_message, Xpath_errors_uri, "XP0006", Type_error)
			end
		end

invariant

	underlying_expression_not_void: sequence /= Void
	role_locator_not_void: role_locator /= void
	item_type_not_void: required_item_type /= Void

end

