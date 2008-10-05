indexing

	description:

		"Skeletons for parsers implemented with tables"

	remark: "[
		To be used with 'geyacc --old_typing'. Use YY_PARSER_SKELETON
		and 'geyacc --new_typing' instead.
	]"
	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2003-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class YY_OLD_PARSER_SKELETON [G]

obsolete

	"[030409] Use YY_PARSER_SKELETON and 'geyacc --new_typing' instead."

inherit

	YY_PARSER_SKELETON
		redefine
			yy_clear_all
		end

feature {YY_PARSER_ACTION} -- Scanning

	last_value: G is
			-- Semantic value of last token read
		deferred
		end

feature {NONE} -- Implementation

	yy_create_value_stacks is
			-- Create value stacks.
		do
			create yy_special_routines
			yyvsc := yyInitial_stack_size
			yyvs := yy_special_routines.make (yyvsc)
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
			yy_special_routines.clear_all (yyvs)
		end

	yy_push_last_value (yychar1: INTEGER) is
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			yyvsp := yyvsp + 1
			if yyvsp >= yyvsc then
				yyvsc := yyvsc + yyInitial_stack_size
				yyvs := yy_special_routines.resize (yyvs, yyvsc)
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
				yyvs := yy_special_routines.resize (yyvs, yyvsc)
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

	yyvs: SPECIAL [G]
			-- Semantic value stack

	yyvsp: INTEGER
			-- Top of semantic value stack

	yyvsc: INTEGER
			-- Capacity of semantic value stack

	yyval: G
			-- Semantic value from action

	yyval_default: G is
			-- Default value for `yyval'
		do
		end

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

	yy_special_routines: KL_SPECIAL_ROUTINES [G]
			-- Routines that ought to be in SPECIAL

	FIXED_ARRAY_: KL_SPECIAL_ROUTINES [G] is
			-- Routines that ought to be in FIXED_ARRAY
		obsolete
			"[050105] Use `yy_special_routines' instead."
		do
			Result := yy_special_routines
		ensure
			fixed_array_not_void: Result /= Void
		end

invariant

	yyvs_not_void: yyvs /= Void
	yy_special_routines_not_void: yy_special_routines /= Void

end
