indexing

	description:

		"DFA which can generate scanners implemented with full tables"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_FULL_DFA

inherit

	LX_GENERATABLE_DFA
		rename
			make as make_generatable_dfa
		redefine
			build, print_constants,
			print_backing_up_report
		select
			print_constants,
			print_backing_up_report
		end

	LX_GENERATABLE_DFA
		rename
			make as make_generatable_dfa,
			print_constants as generatable_dfa_print_constants,
			print_backing_up_report as generatable_dfa_print_backing_up_report
		export
			-- Bug in SE -0.81: Unable to load class NONE!
			-- {NONE} all
		redefine
			build
		end

	LX_FULL_TABLES
		export
			{LX_FULL_TABLES, LX_DFA_REGULAR_EXPRESSION} all;
			{ANY} to_tables
		undefine
			is_equal, copy
		end

creation

	make

feature {NONE} -- Initialization

	make (a_description: LX_DESCRIPTION) is
			-- Create a new full table DFA using `start_conditions'
			-- from `a_description' to build the start states and
			-- user-defined options held in `a_description'.
		require
			a_description_not_void: a_description /= Void
			full_tables: a_description.full_table
		do
			initialize (a_description)
			put_eob_state
			build
		end

feature -- Generation

	new_scanner: LX_FULL_SCANNER is
			-- New scanner corresponding to current DFA
		do
			!! Result.make (Current)
		end

	print_backing_up_report (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print a backing-up report to `a_file'.
		do
			generatable_dfa_print_backing_up_report (a_file)
			inspect backing_up_count
			when 0 then
				a_file.put_string ("No backing up.%N")
			when 1 then
				a_file.put_integer (backing_up_count)
				a_file.put_string (" backing up (non-accepting) state.%N")
			else
				a_file.put_integer (backing_up_count)
				a_file.put_string (" backing up (non-accepting) states.%N")
			end
		end

feature {NONE} -- Generation

	print_build_tables (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print code for `yy_build_tables' to `a_file'.
		do
			a_file.put_string ("%Tyy_build_tables is%N%
				%%T%T%T-- Build scanner tables.%N%T%Tdo%N")
			a_file.put_string (Indentation)
			a_file.put_string ("yy_nxt ?= yy_nxt_template%N")
			if yy_ec /= Void then
				a_file.put_string (Indentation)
				a_file.put_string ("yy_ec ?= yy_ec_template%N")
			end
			a_file.put_string (Indentation)
			a_file.put_string ("yy_accept ?= yy_accept_template%N")
			a_file.put_string ("%T%Tend%N")
		end

	print_eiffel_tables (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print Eiffel code for full tables to `a_file'.
		do
			print_eiffel_array ("yy_nxt_template", yy_nxt, a_file)
			if yy_ec /= Void then
				a_file.put_character ('%N')
				print_eiffel_array ("yy_ec_template", yy_ec, a_file)
			end
			a_file.put_character ('%N')
			print_eiffel_array ("yy_accept_template", yy_accept, a_file)
		end

	print_constants (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print code for constants to `a_file'.
		do
			a_file.put_string ("%TyyNull_equiv_class: INTEGER is ")
			a_file.put_integer (yyNull_equiv_class)
			a_file.put_string ("%N%T%T%T-- Equivalence code for NULL character%
				%%N%N%TyyNb_rows: INTEGER is ")
			a_file.put_integer (yyNb_rows)
			a_file.put_string ("%N%T%T%T-- Number of rows in `yy_nxt'%N%N%
				%%TyyBacking_up: BOOLEAN is ")
			BOOLEAN_FORMATTER_.put_eiffel_boolean (a_file, yyBacking_up)
			a_file.put_string ("%N%T%T%T-- Does current scanner back up?%N%
				%%T%T%T-- (i.e. does it have non-accepting states)%N%N")
			generatable_dfa_print_constants (a_file)
		end

feature -- Building

	build is
			-- Build current DFA.
		local
			i: INTEGER
			a_state: LX_DFA_STATE
		do
			backing_up_count := 0
			!! partitions.make (minimum_symbol, maximum_symbol)
			from i := 1 until i > start_states_count loop
				a_state := item (i)
				build_transitions (a_state)
				i := i + 1
			end
				-- Process end-of-buffer state.
			a_state := item (i)
			build_transitions (a_state)
			from i := i + 1 until i > count loop
				a_state := item (i)
				build_transitions (a_state)
				if not a_state.is_accepting then
					backing_up_count := backing_up_count + 1
				end
				i := i + 1
			end
			yyBacking_up := backing_up_count > 0
				-- Free memory space.
			partitions := Void
				-- Build tables.
			build_nxt_table
			build_accept_table
		end

feature {NONE} -- Building

	build_nxt_table is
			-- Build `yy_nxt' table.
		local
			yy_nxt_: ARRAY [INTEGER]
			i, j, k, nb: INTEGER
			max: INTEGER
			a_state, target: LX_DFA_STATE
			transitions: LX_TRANSITION_TABLE [LX_DFA_STATE]
			eob_state_id: INTEGER
		do
				-- Take into account the fact null transition entries
				-- will be included in the transition table.
				-- Build it from 0 to `maximum_symbol'.
			yyNb_rows := maximum_symbol + 1
			!! yy_nxt_.make (0, yyNb_rows * (count + 1) - 1)
			eob_state_id := start_states_count + 1
			nb := yyNb_rows - 1
				-- `0' entries for state #0.
			j := yyNb_rows
			from i := 1 until i > count loop
				from
					a_state := item (i)
					transitions := a_state.transitions
					if a_state.id = eob_state_id then
						yy_nxt_.put (- eob_state_id, j)
					else
						yy_nxt_.put (eob_state_id, j)
					end
					nb := nb + yyNb_rows
					k := 1
					j := j + 1
				until
					j > nb
				loop
					target := transitions.target (k)
					if target /= Void then
						yy_nxt_.put (target.id, j)
					else
							-- Jams are marked by negative of state number.
						yy_nxt_.put (- a_state.id, j)
					end
					k := k + 1
					j := j + 1
				end
				i := i + 1
			end
			yy_nxt := yy_nxt_
		ensure
			yy_nxt_not_void: yy_nxt /= Void
		end

	build_accept_table is
			-- Build `yy_accept' table.
		local
			yy_accept_: ARRAY [INTEGER]
			i, nb: INTEGER
			a_state: LX_DFA_STATE
		do
			nb := count
			!! yy_accept_.make (0, nb)
			from i := 1 until i > nb loop
				a_state := item (i)
				if a_state.is_accepting then
					yy_accept_.put (a_state.accepted_rules.first.id, i)
				else
					yy_accept_.put (0, i)
				end
				i := i + 1
			end
			yy_accept := yy_accept_
		ensure
			yy_accept_not_void: yy_accept /= Void
		end

feature {NONE} -- Constants

	Initial_max_xpairs: INTEGER is 2000
	Max_xpairs_increment: INTEGER is 2000
			-- Maximum number of next/check pairs for non-templates

end -- class LX_FULL_DFA
