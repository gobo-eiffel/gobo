indexing

	description:

	"Objects that implement an XQuery let expression: let $x := expr return expr.%
	%Used internally by XPath for optimizing the expression tree"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LET_EXPRESSION

inherit

	XM_XPATH_ASSIGNATION
		redefine
			promote, iterator, evaluate_item, compute_special_properties
		end

	XM_XPATH_ROLE

	XM_XPATH_PROMOTION_ACTIONS

creation

	make

feature {NONE} -- Initialization

	make (a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION; a_sequence_expression: XM_XPATH_EXPRESSION; an_action: XM_XPATH_EXPRESSION) is
		require
			range_variable_not_void: a_range_variable /= Void
			sequence_expression_not_void: a_sequence_expression /= Void
			action_not_void: an_action /= Void
		do
			operator := Let_token
			set_declaration (a_range_variable)
			set_sequence (a_sequence_expression)
			set_action (an_action)
			compute_static_properties
		ensure
			declaration_set: declaration = a_range_variable
			action_set: action = an_action
			sequence_set: sequence = a_sequence_expression
		end

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
				Result := action.item_type
		end

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of variable
		do
			create Result.make (sequence.item_type, sequence.cardinality)
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "let $")
			a_string := STRING_.appended_string (a_string, declaration.name)
			std.error.put_string (a_string)
			std.error.put_new_line
			sequence.display (a_level + 1, a_pool)
			a_string := STRING_.appended_string (indent (a_level), "return")
			std.error.put_string (a_string)
			std.error.put_new_line
			action.display (a_level + 1, a_pool)
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions;
		local
			an_expression: XM_XPATH_EXPRESSION
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_type: INTEGER
			a_value: XM_XPATH_VALUE
		do
				check
					declaration /= Void
				end
			
			-- The order of events is critical here. First we ensure that the type of the
			-- sequence expression is established. This is used to establish the type of the variable,
			-- which in turn is required when type-checking the action part.

			if	sequence.may_analyze then
				sequence.analyze (a_context)
			end	
			if sequence.is_error then
				set_last_error (sequence.last_error)
			else
				if sequence.was_expression_replaced then
					an_expression := sequence.replacement_expression
				else
					an_expression := sequence
				end
				create a_role.make (Variable_role, declaration.name, 1)
				create a_type_checker
				an_expression := a_type_checker.static_type_check (an_expression, declaration.required_type, False, a_role)
				if an_expression = Void then
						check
							static_type_error: a_type_checker.is_static_type_check_error
						end
					set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
				else
					set_sequence (an_expression)
					a_type := sequence.item_type
					a_value ?= sequence

					-- Now set the static type of the binding reference, more accurately:
					
					declaration.refine_type_information (a_type, sequence.cardinalities, a_value, sequence.dependencies, sequence.special_properties)

					if	action.may_analyze then
						action.analyze (a_context)
					end
					if action.was_expression_replaced then set_action (action.replacement_expression) end
					if action.is_error then
						set_last_error (action.last_error)
					end
				end
			end
			set_declaration_void -- also sets `analyzed' to `True'
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for `Current'
		local
			an_expression: XM_XPATH_EXPRESSION
			a_result_expression: XM_XPATH_LET_EXPRESSION
			a_variable_reference: XM_XPATH_VARIABLE_REFERENCE
			another_offer: XM_XPATH_PROMOTION_OFFER
		do
			an_expression := an_offer.accept (Current)
			if an_expression /= Void then
				Result := an_expression
			else
				a_result_expression := clone (Current)

				-- Pass the offer on to the sequence expression

				an_expression := sequence.promote (an_offer)
				a_result_expression.set_sequence (sequence)
				if an_offer.action = Inline_variable_references
					or else an_offer.action = Unordered then

					-- Don't pass on other requests. We could pass them on, but only after augmenting
					--  them to say we are interested in subexpressions that don't depend on either the
					--  outer context or the inner context.

					a_result_expression.set_action (action.promote (an_offer))
				end

				-- If this results in the expression (let $x := $y return Z), replace all references to
				-- to $x by references to $y in the Z part, and eliminate this LetExpression by
				-- returning the action part.

				a_variable_reference ?= a_result_expression.sequence
				if a_variable_reference /= Void then
					create another_offer.make (Inline_variable_references, Current, a_variable_reference, False, False)
					Result := a_result_expression.action.promote (another_offer)
				end
				
				if Result = Void then Result := a_result_expression end
			end
		end


feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_value: XM_XPATH_VALUE
		do
			sequence.lazily_evaluate (a_context)
			a_value := last_evaluation
			a_context.set_local_variable (slot_number, a_value)
			action.evaluate_item (a_context)
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		local
			a_value: XM_XPATH_VALUE
		do
			sequence.lazily_evaluate (a_context)
			a_value ?= sequence.last_evaluation
			
			a_context.set_local_variable (slot_number, a_value)
			Result := action.iterator (a_context)
			end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (action)
			are_special_properties_computed := True
		end

feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality (action.cardinality)
		end

invariant

	operator_is_let: operator = Let_token

end
