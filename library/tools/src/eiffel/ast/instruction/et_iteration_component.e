note

	description:

	"[
		Eiffel iteration components (either across expressions/instructions,
		quantifier expressions or repeat instructions).
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ITERATION_COMPONENT

inherit

	ET_AST_NODE

	HASHABLE

feature -- Initialization

	reset
			-- Reset component as it was just after it was last parsed.
		do
			iterable_expression.reset
			if attached invariant_part as l_invariant_part then
				l_invariant_part.reset
			end
			if attached variant_part as l_variant_part then
				l_variant_part.reset
			end
			if attached until_conditional as l_until_conditional then
				l_until_conditional.expression.reset
			end
			reset_unfolded_form
		end

feature -- Status report

	has_cursor_name: BOOLEAN
			-- Should `item_name' represent the cursor used for the traversal?
			-- Otherwise it represents the items being traversed.
			-- True in case of 'across ... as ...' when 'obsolete_iteration_mode'
			-- is set to True in the surrounding universe, False otherwise.
		deferred
		end

feature -- Access

	iterable_expression: ET_EXPRESSION
			-- Expression returning the object to which the iteration applies

	item_name: ET_IDENTIFIER
			-- Iteration item name
			--
			-- It's either then folded form for the calls to the 'item'
			-- feature of the iteration cursor (the unfolded form is
			-- `unfolded_cursor_name'.item), or the name of the iteration
			-- cursor when `has_item_cursor' is False.

	invariant_part: detachable ET_LOOP_INVARIANTS
			-- Invariant part
		deferred
		end

	variant_part: detachable ET_VARIANT
			-- Variant part
		deferred
		end

	until_conditional: detachable ET_CONDITIONAL
			-- Until conditional
		deferred
		end

	hash_code: INTEGER
			-- Hash value
		do
			Result := item_name.hash_code
		end

feature -- Unfolded form

	unfolded_cursor_name: ET_IDENTIFIER
			-- Name of the iteration cursor, to be used in unfolded form

	new_cursor_expression: ET_QUALIFIED_CALL_EXPRESSION
			-- Expression corresponding to `iterable_expression'.new_cursor

	cursor_item_expression: ET_QUALIFIED_CALL_EXPRESSION
			-- Expression corresponding to `unfolded_cursor_name'.item,

	cursor_after_expression: ET_QUALIFIED_CALL_EXPRESSION
			-- Expression corresponding to `unfolded_cursor_name'.after

	cursor_forth_instruction: ET_QUALIFIED_CALL_INSTRUCTION
			-- Instruction corresponding to `unfolded_cursor_name'.forth

	create_unfolded_form
			-- Create the components of the unfolded form.
		local
			l_name: ET_IDENTIFIER
		do
			create l_name.make (tokens.new_cursor_name)
			l_name.set_position (item_name.line, item_name.column)
			create new_cursor_expression.make (iterable_expression, l_name, Void)
			create unfolded_cursor_name.make (item_name.name)
			unfolded_cursor_name.set_position (item_name.line, item_name.column)
			create l_name.make (tokens.item_name)
			l_name.set_position (item_name.line, item_name.column)
			create cursor_item_expression.make (unfolded_cursor_name, l_name, Void)
			create l_name.make (tokens.after_name)
			l_name.set_position (item_name.line, item_name.column)
			create cursor_after_expression.make (unfolded_cursor_name, l_name, Void)
			create l_name.make (tokens.forth_name)
			l_name.set_position (item_name.line, item_name.column)
			create cursor_forth_instruction.make (unfolded_cursor_name, l_name, Void)
		end

	reset_unfolded_form
			-- Reset the components of the unfolded form as
			-- they were just after it was last parsed.
		do
			new_cursor_expression.name.reset
			cursor_item_expression.name.reset
			cursor_after_expression.name.reset
			cursor_forth_instruction.name.reset
		end

invariant

	iterable_expression_not_void: iterable_expression /= Void
	item_name_not_void: item_name /= Void
	unfolded_cursor_name_not_void: unfolded_cursor_name /= Void
	new_cursor_expression_not_void: new_cursor_expression /= Void
	cursor_item_expression_not_void: cursor_item_expression /= Void
	cursor_after_expression_not_void: cursor_after_expression /= Void
	cursor_forth_instruction_not_void: cursor_forth_instruction /= Void

end
