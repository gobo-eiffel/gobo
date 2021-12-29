note

	description:

		"Eiffel across instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACROSS_INSTRUCTION

inherit

	ET_ITERATION_INSTRUCTION

	ET_ACROSS_COMPONENT
		undefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_iterable_expression: like iterable_expression;
		a_item_name: like item_name;
		a_from_compound: like from_compound;
		an_until_conditional: like until_conditional;
		a_loop_compound: like loop_compound)
			-- Create a new across instruction.
		require
			a_iterable_expression_not_void: a_iterable_expression /= Void
			a_item_name_not_void: a_item_name /= Void
		do
			across_keyword := tokens.across_keyword
			iterable_expression := a_iterable_expression
			as_keyword := tokens.as_keyword
			item_name := a_item_name
			from_compound := a_from_compound
			until_conditional := an_until_conditional
			loop_compound := a_loop_compound
			end_keyword := tokens.end_keyword
			has_cursor_name := False
			create_unfolded_form
		ensure
			iterable_expression_set: iterable_expression = a_iterable_expression
			item_name_set: item_name = a_item_name
			from_compound_set: from_compound = a_from_compound
			until_conditional_set: until_conditional = an_until_conditional
			loop_compound_set: loop_compound = a_loop_compound
			not_has_cursor_name: not has_cursor_name
		end

feature -- Access

	from_compound: detachable ET_COMPOUND
			-- From compound

	loop_compound: detachable ET_COMPOUND
			-- Loop compound

feature -- Setting

	set_from_compound (a_compound: like from_compound)
			-- Set `from_compound' to `a_compound'.
		do
			from_compound := a_compound
		ensure
			from_compound_set: from_compound = a_compound
		end

	set_loop_compound (a_compound: like loop_compound)
			-- Set `loop_compound' to `a_compound'.
		do
			loop_compound := a_compound
		ensure
			loop_compound_set: loop_compound = a_compound
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_across_instruction (Current)
		end

end
