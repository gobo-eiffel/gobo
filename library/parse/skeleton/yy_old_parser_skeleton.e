indexing

	description:

		"Skeletons for parsers implemented with tables"

	note:

		"To be used with 'geyacc --old_typing'. Use YY_NEW_PARSER_SKELETON %
		%and 'geyacc --new_typing' instead."

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class YY_OLD_PARSER_SKELETON [G]

obsolete

	"[030409] Use YY_NEW_PARSER_SKELETON and 'geyacc --new_typing' instead."

inherit

	YY_NEW_PARSER_SKELETON
		redefine
			yy_clear_all
		end

	KL_IMPORTED_FIXED_ARRAY_TYPE [G]

feature {YY_PARSER_ACTION} -- Scanning

	last_value: G is
			-- Semantic value of last token read
		deferred
		end

feature {NONE} -- Implementation

	yy_create_value_stacks is
			-- Create value stacks.
		do
			create FIXED_ARRAY_
			yyvsc := yyInitial_stack_size
			yyvs := FIXED_ARRAY_.make (yyvsc)
		end

	yy_init_value_stacks is
			-- Initialize value stacks.
		do
			yyvsp := -1
		end

	yy_clear_value_stacks is
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			FIXED_ARRAY_.clear_all (yyvs)
		end

	yy_push_last_value (yychar1: INTEGER) is
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			yyvsp := yyvsp + 1
			if yyvsp >= yyvsc then
				yyvsc := yyvsc + yyInitial_stack_size
				yyvs := FIXED_ARRAY_.resize (yyvs, yyvsc)
				debug ("GEYACC")
					std.error.put_string ("Stack (yyvs) size increased to ")
					std.error.put_integer (yyvsc)
					std.error.put_new_line
				end
			end
			yyvs.put (last_value, yyvsp)
		end

	yy_push_error_value is
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		local
			yyv: G
		do
			yyvsp := yyvsp + 1
			if yyvsp >= yyvsc then
				yyvsc := yyvsc + yyInitial_stack_size
				yyvs := FIXED_ARRAY_.resize (yyvs, yyvsc)
				debug ("GEYACC")
					std.error.put_string ("Stack (yyvs) size increased to ")
					std.error.put_integer (yyvsc)
					std.error.put_new_line
				end
			end
			yyvs.put (yyv, yyvsp)
		end

	yy_pop_last_value (yystate: INTEGER) is
			-- Pop semantic value from stack when in state `yystate'.
		do
			yyvsp := yyvsp - 1
		end

	yyvs: like FIXED_ARRAY_TYPE
			-- FIXED_ARRAY [G]
			-- Semantic value stack

	yyvsp: INTEGER
			-- Top of semantic value stack

	yyvsc: INTEGER
			-- Capacity of semantic value stack

	yyval: G
			-- Semantic value from action

	yyval_default: G is do end
			-- Default value for `yyval'

	yy_clear_all is
			-- Clear temporary objects so that they can be collected
			-- by the garbage collector. This routine is called by
			-- `parse' before exiting.
		local
			default_value: G
		do
			clear_all
			yyval := default_value
		end

feature {NONE} -- Constants

	FIXED_ARRAY_: KL_FIXED_ARRAY_ROUTINES [G]
			-- Routines that ought to be in FIXED_ARRAY

invariant

	yyvs_not_void: yyvs /= Void
	fixed_array_routines_not_void: FIXED_ARRAY_ /= Void

end
