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

	make (a_sequence: XM_XPATH_EXPRESSION; an_item_type: INTEGER; a_content_type: INTEGER; a_role_locator: XM_XPATH_ROLE_LOCATOR) is
			-- Establish invariant.
		require
				underlying_expression_not_void: a_sequence /= Void
				role_locator_not_void: a_role_locator /= void
				valid_item_type: is_valid_type (an_item_type)
				valid_content_type: is_valid_type (a_content_type)
		do
			sequence := a_sequence
			role_locator := a_role_locator
			required_item_type := an_item_type
			required_content_type := a_content_type
			compute_static_properties
		ensure
			sequence_set: sequence = a_sequence
			role_locator_set: role_locator = a_role_locator
			item_type_set: required_item_type = an_item_type
			content_type_set: required_content_type = a_content_type
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	sequence: XM_XPATH_EXPRESSION
			-- The underlying expression

	required_item_type: INTEGER
			-- The required typr for items
	
	required_content_type : INTEGER
			-- The required type for the content of items
		
	role_locator: XM_XPATH_ROLE_LOCATOR
			-- Role locator for error messages

	item_type: INTEGER is
			-- Determine the data type of the expression, if possible
		do
			Result := required_item_type
		end


	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put_last (sequence)
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "treat as ")
			a_string := STRING_.appended_string (a_string, type_name (required_item_type))
			std.error.put_string (a_string)
			std.error.put_new_line
			sequence.display (a_level + 1, a_pool)
		end

feature -- Optimization

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify `Current'
		local
			a_result_expression: XM_XPATH_ITEM_CHECKER
		do
			a_result_expression := clone (Current)
			a_result_expression.set_sequence (sequence.simplify)
			if required_item_type = Any_item then
				Result := a_result_expression.sequence
			else
				Result := a_result_expression
			end
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
				if required_content_type = Any_item and then is_sub_type (sequence.item_type, required_item_type) then
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
		do
			sequence.evaluate_item (a_context)
			if sequence.is_error then
				set_last_error (sequence.last_error)
			elseif last_evaluated_item = Void then
				do_nothing -- can this occur?
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
			create {XM_XPATH_MAPPING_ITERATOR} Result.make (an_iterator, Current, Void, Void)
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT; an_information_object: ANY): XM_XPATH_MAPPED_ITEM is
			-- Map `an_item' to a sequence
		do
			test_conformance (an_item)
			if not is_error then create Result.make_item (an_item) end
		end

feature {XM_XPATH_ITEM_CHECKER} -- Local

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
			clone_cardinality (sequence)
		end

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (sequence)
		end

feature {NONE} -- Implementation

	test_conformance (an_item: XM_XPATH_ITEM) is
			-- Test conformance to `required_item_type' and `required_content_type'.
		require
			item_not_void: an_item /= Void
		local
			a_type, a_content_type: INTEGER
			a_message: STRING
		do
			a_type := an_item.item_type
			if not is_sub_type (a_type, required_item_type) then
				a_message := STRING_.appended_string ("Required type of ", role_locator.message)
				a_message := STRING_.appended_string (a_message, " is ")
				a_message := STRING_.appended_string (a_message, type_name (required_item_type))
				a_message := STRING_.appended_string (a_message, "; supplied value is ")
				a_message := STRING_.appended_string (a_message, type_name (a_type))
				set_last_error_from_string (a_message, 6, Type_error)
			elseif required_content_type /= Any_item then
				--a_content_type := a_node.type_annotation
				-- this is only needed for Schema-aware processors, so for now:
					check
						basic_xslt_processor: False
					end
			end
		end

invariant

	underlying_expression_not_void: sequence /= Void
	role_locator_not_void: role_locator /= void
	valid_item_type: is_valid_type (required_item_type)
	valid_content_type: is_valid_type (required_content_type)

end

