note

	description:

		"Range variable assignations"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ASSIGNATION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, sub_expressions, allocate_slots, promote,
			is_assignation, as_assignation
		end

	XM_XPATH_BINDING

	XM_XPATH_PROMOTION_ACTIONS

	XM_XPATH_TOKENS

	XM_XPATH_CARDINALITY

feature -- Access

	operator: INTEGER
			-- "let", "for", "some" or "every" operator

	sequence: XM_XPATH_EXPRESSION
			-- Sequence expression

	action: XM_XPATH_EXPRESSION
			-- Action expression

	declaration: XM_XPATH_RANGE_VARIABLE_DECLARATION
			-- Range variable

	slot_number: INTEGER
			-- Slot number for range variable

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (sequence, 1)
			Result.put (action, 2)
		end

	is_assignation: BOOLEAN
			-- Is `Current' a assignation?
		do
			Result := True
		end

	as_assignation: XM_XPATH_ASSIGNATION
			-- `Current' seen as a assignation
		do
			Result := Current
		end

feature -- Status report

		is_global: BOOLEAN
			-- Is binding global or local?
		do
			Result := False
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if declaration /= Void then
				simplified := True
				create l_replacement.make (Void)
				sequence.simplify (l_replacement)
				if sequence.is_error then
					set_replacement (a_replacement, sequence)
				else
					set_sequence (l_replacement.item)
					l_replacement.put (Void)
					action.simplify (l_replacement)
					if action.is_error then
						set_replacement (a_replacement, action)
					else
						set_action (l_replacement.item) -- this fixes up references on the declaration
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this subexpression.
		local
			l_promotion: XM_XPATH_EXPRESSION
			l_cursor: DS_LIST_CURSOR [XM_XPATH_BINDING]
			l_saved_binding_list, l_new_binding_list: DS_LIST [XM_XPATH_BINDING]
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			a_offer.accept (Current)
			l_promotion := a_offer.accepted_expression
			if l_promotion /= Void then
				set_replacement (a_replacement, l_promotion)
			else
				create l_replacement.make (Void)
				sequence.promote (l_replacement, a_offer)
				if l_replacement.item /= sequence then
					set_sequence (l_replacement.item)
					reset_static_properties
				end
				if a_offer.action = Inline_variable_references or a_offer.action = Unordered or
					a_offer.action = Replace_current then
					-- Don't pass on other requests. We could pass them on, but only after augmenting
					-- them to say we are interested in subexpressions that don't depend on either the
					-- outer context or the inner context.
					l_replacement.put (Void)
					action.promote (l_replacement, a_offer)
					if action /= l_replacement.item then
						replace_action (l_replacement.item)
						reset_static_properties
					end
				elseif a_offer.action = Range_independent then
					-- Pass the offer to the action only if the action isn't dependent on the
					--  variable bound by this assignation
					l_saved_binding_list := a_offer.binding_list
					create {DS_ARRAYED_LIST [XM_XPATH_BINDING]} l_new_binding_list.make (l_saved_binding_list.count + 1)
					from
						l_cursor := a_offer.binding_list.new_cursor
						l_cursor.start
					until
						l_cursor.after
					loop
						l_new_binding_list.put (l_cursor.item, l_cursor.index)
						l_cursor.forth
					end
					l_new_binding_list.put_last (Current)
					a_offer.set_binding_list (l_new_binding_list)
					l_replacement.put (Void)
					action.promote (l_replacement, a_offer)
					if action /= l_replacement.item then
						replace_action (l_replacement.item)
						reset_static_properties
					end
					a_offer.set_binding_list (l_saved_binding_list)
				end
				a_replacement.put (Current)
			end
		end

feature -- Evaluation

	evaluate_variable (a_context: XM_XPATH_CONTEXT)
			-- Evaluate variable
		do
			last_evaluated_binding := a_context.evaluated_local_variable (slot_number)
			if last_evaluated_binding.is_memo_closure
				and then last_evaluated_binding.as_memo_closure.is_all_read then
				a_context.set_local_variable (last_evaluated_binding.as_memo_closure.materialized, slot_number)
			end
		end

feature -- Element change

	allocate_slots (next_free_slot: INTEGER; a_slot_manager: XM_XPATH_SLOT_MANAGER)
			-- Allocate slot numbers for all range variable in `Current' and it's sub-expresions.
		do
			set_slot_number (next_free_slot)
			if a_slot_manager /= Void then
				a_slot_manager.allocate_slot_number (variable_name)
			end
			Precursor (next_free_slot + 1, a_slot_manager)
		end

	set_sequence (a_sequence: XM_XPATH_EXPRESSION)
			-- Set `sequence.
		require
			sequence_not_void: a_sequence /= Void
		do
			sequence := a_sequence
			adopt_child_expression (sequence)
		ensure
			sequence_set: sequence = a_sequence
		end

	replace_action (a_action: XM_XPATH_EXPRESSION)
			-- Set `action'.
		require
			a_action_not_void: a_action /= Void
		do
			action := a_action
			adopt_child_expression (action)
		ensure
			action_set: action = a_action
		end

	set_action (a_action: XM_XPATH_EXPRESSION)
			-- Set `action'.
		require
			a_action_not_void: a_action /= Void
			declaration_not_void: declaration /= Void
		do
			replace_action (a_action)
			declaration.fix_up_references (Current)
		ensure
			action_set: action = a_action
		end

	set_declaration (a_declaration: XM_XPATH_RANGE_VARIABLE_DECLARATION)
			-- Set `declaration'.
		require
			dclaration_is_void: declaration = Void
			new_declaration_not_void: a_declaration /= Void
		do
			declaration := a_declaration
			variable_name := declaration.variable_name
		ensure
			declaration_set: declaration = a_declaration
			name_not_void: variable_name /= Void
		end

	set_declaration_void
			-- Set `declaration' to `Void'.
		require
			declaration_not_void: declaration /= Void
		do
			declaration := Void
		ensure
			declaration_void: declaration = Void
		end

	set_slot_number (a_slot_number: INTEGER)
			-- Set `slot_number.
		require
			strictly_positive_slot_number: a_slot_number > 0
		do
			slot_number := a_slot_number
		ensure
			slot_number_set: slot_number = a_slot_number
		end

feature {XM_XPATH_ASSIGNATION} -- Local

	simplified: BOOLEAN
			-- Has simplify been run?

invariant

	valid_operator: operator = For_token or operator = Some_token or operator = Every_token or operator = Let_token
	sequence_not_void: initialized implies sequence /= Void
	action_not_void: initialized implies action /= Void

end
