indexing

	description:

		"DFA which can generate scanners implemented with compressed tables"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_COMPRESSED_DFA

inherit

	LX_GENERATABLE_DFA
		rename
			make as make_generatable_dfa
		redefine
			build, resize, print_constants,
			print_backing_up_report
		select
			resize, print_constants,
			print_backing_up_report
		end

	LX_GENERATABLE_DFA
		rename
			make as make_generatable_dfa,
			resize as generatable_dfa_resize,
			print_constants as generatable_dfa_print_constants,
			print_backing_up_report as generatable_dfa_print_backing_up_report
		export
			-- Bug in SE -0.81: Unable to load class NONE!
			-- {NONE} all
		redefine
			build
		end

	LX_COMPRESSED_TABLES
		export
			{LX_COMPRESSED_TABLES} all;
			{ANY} to_tables
		undefine
			is_equal, copy
		end

creation

	make

feature {NONE} -- Initialization

	make (a_description: LX_DESCRIPTION) is
			-- Create a new compressed table DFA using `start_conditions'
			-- from `a_description' to build the start states and
			-- user-defined options held in `a_description'.
		require
			a_description_not_void: a_description /= Void
			compressed_tables: not a_description.full_table
		do
			yyReject_used := a_description.reject_used
			yyVariable_trail_context := a_description.variable_trail_context
			meta_equiv_classes_used := a_description.meta_equiv_classes_used
			initialize (a_description)
			put_eob_state
			build
		end

feature -- Generation

	new_scanner: LX_COMPRESSED_SCANNER is
			-- New scanner corresponding to current DFA
		do
			!! Result.make (Current)
		end

	print_backing_up_report (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print a backing up report to `a_file'.
		do
			generatable_dfa_print_backing_up_report (a_file)
			a_file.put_string ("Compressed tables always back up.%N")
		end

feature -- Access

	dangerous_variable_trail_rules: DS_ARRAYED_LIST [LX_RULE] is
			-- Rules containing "dangerous" variable trailing context.
			-- A trailing context is dangerous if both the head and the 
			-- trailing part are of variable size and there is a DFA
			-- state which contains both an accepting state for the 
			-- rule and NFA states which occur after the beginning
			-- of the trailing context.
			-- When such a rule is matched, it is impossible to tell
			-- if having been in the DFA state indicates the beginning
			-- of the trailing context or further-along scanning of
			-- the pattern.
		local
			i, j, k: INTEGER
			a_state: LX_DFA_STATE
			a_nfa_state: LX_NFA_STATE
			a_sorter: DS_BUBBLE_SORTER [LX_RULE]
			acc_set: DS_ARRAYED_LIST [LX_RULE]
		do
			!! Result.make (yy_rules.count)
			if yyVariable_trail_context then
				from i := count until i < 1 loop
					a_state := item (i)
					if a_state.is_accepting_head then
						acc_set := a_state.accepted_head_rules
						from j := a_state.count until j < 1 loop
							a_nfa_state := a_state.item (j)
							if a_nfa_state.in_trail_context then
								from
									k := acc_set.count
								until
									k < 1 or else
									not Result.has (acc_set.item (k)) and then
									acc_set.item (k).pattern.has (a_nfa_state)
								loop
									k := k - 1
								end
								if k >= 1 then
									Result.put_last (acc_set.item (k))
								end
							end
							j := j - 1
						end
					end
					i := i - 1
				end
			end
			!! a_sorter
			Result.sort (a_sorter)
		ensure
			rules_not_void: Result /= Void
			no_void_rule: not Result.has (Void)
		end

feature {NONE} -- Generation

	print_build_tables (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print code for `yy_build_tables' to `a_file'.
		do
			a_file.put_string ("%Tyy_build_tables is%N%
				%%T%T%T-- Build scanner tables.%N%T%Tdo%N")
			a_file.put_string (Indentation)
			a_file.put_string ("yy_nxt ?= yy_nxt_template%N")
			a_file.put_string (Indentation)
			a_file.put_string ("yy_chk ?= yy_chk_template%N")
			a_file.put_string (Indentation)
			a_file.put_string ("yy_base ?= yy_base_template%N")
			a_file.put_string (Indentation)
			a_file.put_string ("yy_def ?= yy_def_template%N")
			if yy_ec /= Void then
				a_file.put_string (Indentation)
				a_file.put_string ("yy_ec ?= yy_ec_template%N")
			end
			if yy_meta /= Void then
				a_file.put_string (Indentation)
				a_file.put_string ("yy_meta ?= yy_meta_template%N")
			end
			a_file.put_string (Indentation)
			a_file.put_string ("yy_accept ?= yy_accept_template%N")
			if yy_acclist /= Void then
				a_file.put_string (Indentation)
				a_file.put_string ("yy_acclist ?= yy_acclist_template%N")
			end
			a_file.put_string ("%T%Tend%N")
		end

	print_eiffel_tables (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print Eiffel code for compressed tables to `a_file'.
		do
			print_eiffel_array ("yy_nxt_template", yy_nxt, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yy_chk_template", yy_chk, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yy_base_template", yy_base, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yy_def_template", yy_def, a_file)
			if yy_ec /= Void then
				a_file.put_character ('%N')
				print_eiffel_array ("yy_ec_template", yy_ec, a_file)
			end
			if yy_meta /= Void then
				a_file.put_character ('%N')
				print_eiffel_array ("yy_meta_template", yy_meta, a_file)
			end
			a_file.put_character ('%N')
			print_eiffel_array ("yy_accept_template", yy_accept, a_file)
			if yy_acclist /= Void then
				a_file.put_character ('%N')
				print_eiffel_array ("yy_acclist_template", yy_acclist, a_file)
			end
		end

	print_constants (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print code for constants to `a_file'.
		do
			a_file.put_string ("%TyyJam_base: INTEGER is ")
			a_file.put_integer (yyJam_base)
			a_file.put_string ("%N%T%T%T-- Position in `yy_nxt'/`yy_chk' tables%
				%%N%T%T%T-- where default jam table starts%N%N%
				%%TyyJam_state: INTEGER is ")
			a_file.put_integer (yyJam_state)
			a_file.put_string ("%N%T%T%T-- State id corresponding to jam state%
				%%N%N%TyyTemplate_mark: INTEGER is ")
			a_file.put_integer (yyTemplate_mark)
			a_file.put_string
				("%N%T%T%T-- Mark between normal states and templates%N%N%
				%%TyyNull_equiv_class: INTEGER is ")
			a_file.put_integer (yyNull_equiv_class)
			a_file.put_string ("%N%T%T%T-- Equivalence code for NULL character%
				%%N%N%TyyReject_used: BOOLEAN is ")
			BOOLEAN_FORMATTER_.put_eiffel_boolean (a_file, yyReject_used)
			a_file.put_string ("%N%T%T%T-- Is `reject' called?%N%N%
				%%TyyVariable_trail_context: BOOLEAN is ")
			BOOLEAN_FORMATTER_.put_eiffel_boolean (a_file, yyVariable_trail_context)
			a_file.put_string ("%N%T%T%T-- Is there a regular expression with%N%
				%%T%T%T-- both leading and trailing parts having%N%
				%%T%T%T-- variable length?%N%N%
				%%TyyReject_or_variable_trail_context: BOOLEAN is ")
			BOOLEAN_FORMATTER_.put_eiffel_boolean (a_file, yyReject_used or yyVariable_trail_context)
			a_file.put_string ("%N%T%T%T-- Is `reject' called or is there a%N%
				%%T%T%T-- regular expression with both leading%N%
				%%T%T%T-- and trailing parts having variable length?%N%N")
			generatable_dfa_print_constants (a_file)
		end

feature -- Building

	build is
			-- Build current DFA.
		local
			i: INTEGER
			a_state: LX_DFA_STATE
			singleton: LX_SINGLETON
		do
			first_free := 1
			table_end := 0
			templates_count := 0
			!! protos.make
			!! singletons.make (Singletons_capacity)
			if meta_equiv_classes_used then
				!! meta_equiv_classes.make (minimum_symbol, maximum_symbol)
			end
			!! templates.make (meta_equiv_classes)
			!! partitions.make (minimum_symbol, maximum_symbol)
				-- Allocate memory for compressed tables.
			!! yy_nxt.make (0, Initial_max_xpairs)
			!! yy_chk.make (0, Initial_max_xpairs)
			!! yy_base.make (0, capacity)
			!! yy_def.make (0, capacity)
				-- The compressed table format jams by entering the
				-- jam state, losing information about the previous
				-- state in the process. In order to recover the
				-- previous state, backing-up information needs
				-- to be kept.
			backing_up_count := 1
			from i := 1 until i > start_states_count loop
				a_state := item (i)
				build_transitions (a_state)
				put_state (a_state)
				i := i + 1
			end
				-- Process end-of-buffer state.
			a_state := item (i)
			build_transitions (a_state)
				-- Make sure it jams on end of buffer.
			!! singleton.make (a_state.id, Jam_id, 0, 0)
			singletons.put_last (singleton)
			from i := i + 1 until i > count loop
				a_state := item (i)
				build_transitions (a_state)
				if not a_state.is_accepting then
					backing_up_count := backing_up_count + 1
				end
				put_state (a_state)
				i := i + 1
			end
			put_templates
			put_singletons
			put_jam_state
				-- Free memory space.
			partitions := Void
			protos := Void
			singletons := Void
			templates := Void
			meta_equiv_classes := Void
				-- Build tables.
			build_nxt_chk_tables
			build_base_def_tables
			build_accept_tables
		end

feature {NONE} -- Building

	build_nxt_chk_tables is
			-- Build `yy_nxt' and `yy_chk' tables.
		require
			valid_yy_nxt: yy_nxt.upper >= table_end
			valid_yy_chk: yy_chk.upper >= table_end
		local
			yy_nxt_, yy_chk_: ARRAY [INTEGER]
			i, nb: INTEGER
		do
				-- `yy_nxt' and `yy_chk' are indexed
				-- from 1 to `table_end'.
			nb := table_end
			!! yy_nxt_.make (0, nb)
			!! yy_chk_.make (0, nb)
			from i := 1 until i > nb loop
				yy_nxt_.put (yy_nxt.item (i), i)
				yy_chk_.put (yy_chk.item (i), i)
				i := i + 1
			end
			yy_nxt := yy_nxt_
			yy_chk := yy_chk_
		ensure
			yy_nxt_not_void: yy_nxt /= Void
			yy_chk_not_void: yy_chk /= Void
		end

	build_base_def_tables is
			-- Build `yy_base' and `yy_def' tables.
		require
			valid_yy_base: yy_base.upper >= count + templates_count
			valid_yy_def: yy_def.upper >= count + templates_count
		local
			yy_base_, yy_def_: ARRAY [INTEGER]
			i, nb: INTEGER
		do
				-- `yy_base' and `yy_def' are indexed
				-- from 1 to `count'+`templates_count'.
			nb := count + templates_count
			!! yy_base_.make (0, nb)
			!! yy_def_.make (0, nb)
			from i := 1 until i > nb loop
				yy_base_.put (yy_base.item (i), i)
				yy_def_.put (yy_def.item (i), i)
				i := i + 1
			end
			yy_base := yy_base_
			yy_def := yy_def_
		ensure
			yy_base_not_void: yy_base /= Void
			yy_def_not_void: yy_def /= Void
		end

	build_accept_tables is
			-- Build `yy_accept' and `yy_acclist' tables.
		local
			i, j, nb: INTEGER
			k, acc_nb: INTEGER
			acc_set: DS_ARRAYED_LIST [LX_RULE]
			a_rule: LX_RULE
			state: LX_DFA_STATE
			yy_accept_, yy_acclist_: ARRAY [INTEGER]
		do
			nb := count
			if yyReject_used or yyVariable_trail_context then
					-- Make room for the jam state accepting id, and
					-- we put a "cap" on the table of associating list
					-- of accepting ids with state ids. This is needed
					-- because we tell where the end of an accepting list
					-- is by looking at where the list for the next
					-- state starts. (Hence nb + 2)
				!! yy_accept_.make (0, nb + 2)
					-- First generate the `yy_acclist' array. In the process,
					-- we compute the indices that go into the `yy_accept'
					-- array which will contain pointers into the
					-- `yy_acclist' array.
				from i := 1 until i > nb loop
					state := item (i)
					j := j + state.accepted_rules.count
					j := j + state.accepted_head_rules.count
					i := i + 1
				end
				!! yy_acclist_.make (0, j.max (1))
				j := 1
				from i := 1 until i > nb loop
					yy_accept_.put (j, i)
					state := item (i)
					acc_set := state.accepted_rules
					acc_nb := acc_set.count
					from k := 1 until k > acc_nb loop
						a_rule := acc_set.item (k)
						if
							yyVariable_trail_context and
							a_rule.variable_trail
						then
								-- Special hack to flag accepting id
								-- as part of trailing context rule.
							yy_acclist_.put (- a_rule.id, j)
						else
							yy_acclist_.put (a_rule.id, j)
						end
						j := j + 1
						k := k + 1
					end
					acc_set := state.accepted_head_rules
					acc_nb := acc_set.count
					from k := 1 until k > acc_nb loop
						a_rule := acc_set.item (k)
							-- Special hack to flag accepting id
							-- as head part of variable trailing
							-- context rule.
						yy_acclist_.put (- a_rule.id - yyNb_rules, j)
						j := j + 1
						k := k + 1
					end
					i := i + 1
				end
					-- Add accepting ids for the jam state
					-- and "cap" for the list.
				yy_accept_.put (j, i)
				yy_accept_.put (j, i + 1)
				yy_accept := yy_accept_
				yy_acclist := yy_acclist_
			else
					-- Make room for the jam state accepting id
					-- (hence nb + 1).
				!! yy_accept_.make (0, nb + 1)
				from i := 1 until i > nb loop
					state := item (i)
					if state.is_accepting then
						yy_accept_.put (state.accepted_rules.first.id, i)
					else
						yy_accept_.put (0, i)
					end
					i := i + 1
				end
					-- Add accepting id for jam state.
				yy_accept_.put (0, i)
				yy_accept := yy_accept_
				yy_acclist := Void
			end
		ensure
			yy_accept_not_void: yy_accept /= Void
		end

feature {NONE} -- Resizing

	resize (n: INTEGER) is
			-- Resize DFA, `yy_base' and `yy_def' so that they can
			-- contain upto `n' states. Do not lose any states.
		do
			generatable_dfa_resize (n)
			yy_base.resize (0, n)
			yy_def.resize (0, n)
		end

feature {NONE} -- Compression

	put_state (state: LX_DFA_STATE) is
			-- Build table entries for `state'.
		require
			state_not_void: state /= Void
			protos_not_void: protos /= Void
			templates_not_void: templates /= Void
			singletons_not_void: singletons /= Void
		local
			transitions: LX_TRANSITION_TABLE [LX_DFA_STATE]
			template: LX_TRANSITION_TABLE [LX_DFA_STATE]
			trans_nb, symb_nb: INTEGER
			i, j, nb: INTEGER
			states: DS_ARRAYED_LIST [LX_DFA_STATE]
			frequencies: DS_ARRAYED_LIST [INTEGER]
			st_cursor: DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE]
			common_state: LX_DFA_STATE
			common_freq: INTEGER
			proto, new_proto: LX_PROTO
			cursor, proto_cursor: DS_BILINKED_LIST_CURSOR [LX_PROTO]
			difference, new_diff: LX_TRANSITION_TABLE [LX_DFA_STATE]
			min_diff: INTEGER
			default_id: INTEGER
		do
			transitions := state.transitions
			trans_nb := transitions.count
			symb_nb := transitions.capacity
			if trans_nb * 100 < symb_nb * Proto_size_percentage then
				put_entry (state.id, Jam_id, transitions)
			else
					-- Search for the state which the most frequently targeted
					-- by `transitions', and number of transitions to it
				!! states.make (trans_nb)
				!! frequencies.make (trans_nb)
				st_cursor := states.new_cursor
				nb := maximum_symbol
				from i := minimum_symbol until i > nb loop
					common_state := transitions.target (i)
					if common_state /= Void then
						st_cursor.start
						st_cursor.search_forth (common_state)
						if not st_cursor.after then
							j := st_cursor.index
							frequencies.replace (frequencies.item (j) + 1, j)
						else
							states.put_last (common_state)
							frequencies.put_last (1)
						end
					end
					i := i + 1
				end
				st_cursor.go_after -- Release cursor to GC.
				nb := states.count
				from i := 1 until i > nb loop
					if common_freq < frequencies.item (i) then
						common_state := states.item (i)
						common_freq := frequencies.item (i)
					end
					i := i + 1
				end
				proto_cursor := protos.new_cursor
				if not protos.is_empty then
					proto := protos.first
					proto_cursor.start
				end
				min_diff := trans_nb
				cursor := protos.new_cursor
				cursor.start
				if common_freq * 100 > trans_nb * Check_common_percentage then
					from
					until
						cursor.after or else
						cursor.item.common_state = common_state
					loop
						cursor.forth
					end
					if not cursor.after then
						proto := cursor.item
						proto_cursor.go_to (cursor)
						difference := transitions.difference
							(proto.transitions, null_state)
						min_diff := difference.count
					end
				else
						-- Since it has been decided that the most common
						-- destination out of `state' does not occur with
						-- high enough frequency, we set the `common_state'
						-- to `null_state', assuring that if this state is
						-- entered into the proto list, it will no be
						-- considered as a template.
					common_state := null_state
					if not protos.is_empty then
						proto := protos.first
						proto_cursor.go_to (cursor)
						difference := transitions.difference
							(proto.transitions, null_state)
						min_diff := difference.count
					end
				end
					-- We now have the first interesting proto. If it
					-- matches within the tolerances set for the first
					-- proto, we don't want to bother scanning the rest
					-- of the proto list to see if we have any other
					-- reasonable matches.
				if min_diff * 100 > trans_nb * First_match_diff_percentage then
						-- Not good enough match. Scan the rest of the protos.
					from until cursor.after loop
						new_proto := cursor.item
						new_diff := transitions.difference
							(new_proto.transitions, null_state)
						if new_diff.count < min_diff then
							proto := new_proto
							proto_cursor.go_to (cursor)
							difference := new_diff
							min_diff := difference.count
						end
						cursor.forth
					end
				else
					cursor.go_after -- Release cursor to GC.
				end
					-- Check if the proto we've decided on as our best bet
					-- is close enough to the state we want to match to
					-- be usable.
				if min_diff * 100 > trans_nb * Acceptable_diff_percentage then
						-- No good. If the state is homogeneous enough,
						-- we make a template out of it. Otherwise, we
						-- make a proto.
					if common_freq * 100 >= trans_nb * Template_same_percentage then
						templates.put (state, common_state)
						template := templates.last
						default_id := - templates.count
						protos.put (default_id, template, common_state)
						put_entry (state.id, default_id,
							transitions.difference (template, null_state))
					else
						protos.put (state.id, clone (transitions), common_state)
						put_entry (state.id, Jam_id, transitions)
					end
				else
						-- Use the proto.
					put_entry (state.id, proto.state_id, difference)
						-- Move `proto' to the front of the proto queue.
					protos.move_to_front (proto_cursor)
						-- If this state was sufficiently different from
						-- the proto we built it from, make it a proto too.
					if min_diff * 100 >= trans_nb * New_proto_diff_percentage then
						protos.put (state.id, clone (transitions), common_state)
					end
				end
				proto_cursor.go_after -- Release cursor to GC.
			end
		end

	put_entry (state_id, default_id: INTEGER;
		transitions: LX_TRANSITION_TABLE [LX_DFA_STATE]) is
			-- Create base/default and next/check entries for
			-- `transitions' out of state `state_id'.
		require
			valid_state_id: yy_base.valid_index (state_id)
			transitions_not_void: transitions /= Void
			singletons_not_void: singletons /= Void
		local
			i, max_index, trans_nb: INTEGER
			symb_nb, min_label, max_label: INTEGER
			base_addr, table_base, table_last: INTEGER
			yy_chk_, yy_nxt_: ARRAY [INTEGER]
			singleton: LX_SINGLETON
			target: LX_DFA_STATE
		do
			inspect transitions.count
			when 0 then
					-- There are no new out-transitions.
				if default_id = Jam_id then
					yy_base.put (Jam_id, state_id)
				else
					yy_base.put (0, state_id)
				end
				yy_def.put (default_id, state_id)
			when 1 then
					-- There is only one out-transition.
					-- Save it for later to fill in holes in tables.
				min_label := transitions.minimum_label
				target := transitions.target (min_label)
				!! singleton.make (state_id, default_id, min_label, target.id)
				if not singletons.is_full then
					singletons.put_last (singleton)
				else
					put_singleton (singleton)
				end
			else
				yy_nxt_ := yy_nxt
				yy_chk_ := yy_chk
					-- Whether we try to fit the state table in the
					-- middle of the table entries we have already
					-- generated, or if we just take the state table
					-- at the end of next/check tables, we must make
					-- sure that we have valid base address (i.e.
					-- non negative).

					-- Find the first transition of `state' that we
					-- need to worry about.
				min_label := transitions.minimum_label
				max_label := transitions.maximum_label
				trans_nb := transitions.count
				symb_nb := transitions.capacity
				if trans_nb * 100 <= symb_nb * Interior_fit_percentage then
						-- Attempt to squeeze it into the middle of tables.
					base_addr := first_free
					from until base_addr >= min_label loop
							-- Using `base_addr' would result in a
							-- negative base address below; find the
							-- next free slot.
						from
							base_addr := base_addr + 1
						until
							yy_chk_.item (base_addr) = 0
						loop
							base_addr := base_addr + 1
						end
					end
					max_index := base_addr + max_label - min_label + 1
					if max_index >= yy_nxt_.upper then
						max_index := max_index + Max_xpairs_increment
						yy_nxt_.resize (0, max_index)
						yy_chk_.resize (0, max_index)
					end
					from i := min_label until i > max_label loop
						if
							transitions.target (i) /= Void and
							yy_chk_.item (base_addr + i - min_label) /= 0
						then
								-- `base_addr' unsuitable. Find another.
							from
								base_addr := base_addr + 1
								max_index := yy_nxt_.upper
							until
								base_addr > max_index or else
								yy_chk_.item (base_addr) = 0
							loop
								base_addr := base_addr + 1
							end
							max_index := base_addr + max_label - min_label + 1
							if max_index >= yy_nxt_.upper then
								max_index := max_index + Max_xpairs_increment
								yy_nxt_.resize (0, max_index)
								yy_chk_.resize (0, max_index)
							end
								-- Reset the loop counter so we'll start
								-- all over again.
							i := min_label
						else
							i := i + 1
						end
					end
				else
						-- Ensure that the base address we eventually
						-- generate is non negative.
					base_addr := min_label.max (table_end + 1)
				end
				table_base := base_addr - min_label
				table_last := table_base + max_label
				max_index := table_last + 1
				if max_index >= yy_nxt_.upper then
					max_index := max_index + Max_xpairs_increment
					yy_nxt_.resize (0, max_index)
					yy_chk_.resize (0, max_index)
				end
				yy_base.put (table_base, state_id)
				yy_def.put (default_id, state_id)
				from i := min_label until i > max_label loop
					if transitions.target (i) /= Void then
						yy_nxt_.put (transitions.target (i).id, table_base + i)
						yy_chk_.put (state_id, table_base + i)
					end
					i := i + 1
				end
				if base_addr = first_free then
						-- Find next free slot in tables.
					from
						i := base_addr + 1
					until
						yy_chk_.item (i) = 0
					loop
						i := i + 1
					end
					first_free := i
				end
				table_end := table_end.max (table_last)
			end
		end

	put_singleton (singleton: LX_SINGLETON) is
			-- Create table entry for `singleton', which
			-- represents a state with only one out-transition.
		require
			singleton_not_void: singleton /= Void
		local
			symbol: INTEGER
			state_id: INTEGER
			max_index: INTEGER
			yy_chk_: ARRAY [INTEGER]
		do
			symbol := singleton.symbol
			state_id := singleton.state_id
			if first_free < symbol then
				first_free := symbol
			end
			from
				yy_chk_ := yy_chk
				max_index := yy_nxt.upper
			until
				first_free > max_index or else
				yy_chk_.item (first_free) = 0
			loop
				first_free := first_free + 1
			end
			if first_free > max_index then
				max_index := max_index + Max_xpairs_increment
				yy_nxt.resize (0, max_index)
				yy_chk_.resize (0, max_index)
			end
			yy_base.put (first_free - symbol, state_id)
			yy_def.put (singleton.default_id, state_id)
			yy_chk_.put (state_id, first_free)
			yy_nxt.put (singleton.target_id, first_free)
			if first_free > table_end then
				table_end := first_free
				first_free := first_free + 1
				max_index := yy_nxt.upper
				if first_free > max_index then
					max_index := max_index + Max_xpairs_increment
					yy_nxt.resize (0, max_index)
					yy_chk_.resize (0, max_index)
				end
			end
		end

	put_templates is
			-- Create compressed template entries.
		require
			templates_not_void: templates /= Void
			singletons_not_void: singletons /= Void
		local
			cursor: DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]]
			template: LX_TRANSITION_TABLE [LX_DFA_STATE]
			i, max_index: INTEGER
		do
			yyTemplate_mark := count + 2
			if meta_equiv_classes /= Void then
				meta_equiv_classes.build
				yy_meta := meta_equiv_classes.to_array (0, maximum_symbol)
			else
				yy_meta := Void
			end
			templates_count := templates.count + 1
			max_index := count + templates_count
			if capacity < max_index then
				yy_base.resize (0, max_index)
				yy_def.resize (0, max_index)
			end
				-- Leave room for the jam-state after the last real state.
			i := count + 2
			cursor := templates.new_cursor
			from cursor.start until cursor.after loop
				template := templates.equiv_template (cursor.item)
					-- It is assumed in the skeleton that if we're using
					-- meta-equivalence classes, the yy_def entry for all
					-- templates is the jam template, i.e. templates never
					-- default to other non-jam table entries (e.g. another
					-- template).
				put_entry (i, Jam_id, template)
				i := i + 1
				cursor.forth
			end
		end

	put_singletons is
			-- Create table entries for `singletons', which
			-- represent states with only one out-transition.
		require
			singletons_not_void: singletons /= Void
		local
			i: INTEGER
		do
			from i := singletons.count until i < 1 loop
				put_singleton (singletons.item (i))
				i := i - 1
			end
		end

	put_jam_state is
			-- Create the default "jam" table entries.
		local
			i, nb, max_index: INTEGER
			default_id: INTEGER
			eob_state_id: INTEGER
			jam_base, jam_state: INTEGER
			yy_base_, yy_def_, yy_nxt_, yy_chk_: ARRAY [INTEGER]
		do
			eob_state_id := start_states_count + 1
				-- Set jam_base values.
			yyJam_state := count + 1
			yyJam_base := table_end + 1
			jam_state := yyJam_state
			jam_base := yyJam_base
			yy_base_ := yy_base
			yy_def_ := yy_def
			nb := count
			from i := 1 until i > nb loop
				if yy_base_.item (i) = Jam_id then
					yy_base_.put (jam_base, i)
				end
				default_id := yy_def_.item (i)
				if default_id = Jam_id then
					yy_def_.put (jam_state, i)
				elseif default_id < 0 then
					yy_def_.put (nb - default_id + 1, i)
				end
				i := i + 1
			end
			yy_base_.put (jam_base, jam_state)
			yy_def_.put (0, jam_state)
			nb := count + templates_count
			from i := i + 1 until i > nb loop
				yy_def_.put (jam_state, i)
				i := i + 1
			end
				-- Process yy_nxt/yy_chk tables.
			yy_nxt_ := yy_nxt
			yy_chk_ := yy_chk
			max_index := table_end + maximum_symbol - minimum_symbol + 2
			if max_index > yy_nxt_.upper then
				yy_nxt_.resize (0, max_index)
				yy_chk_.resize (0, max_index)
			end
			nb := table_end
			from i := 1 until i > nb loop
				if yy_chk_.item (i) = 0 or else yy_nxt_.item (i) = 0 then
					yy_nxt_.put (jam_state, i)
				end
				i := i + 1
			end
				-- Add in default end-of-buffer transition.
			yy_nxt_.put (eob_state_id, jam_base)
			yy_chk_.put (jam_state, jam_base)
			from i := jam_base + 1 until i > max_index loop
				yy_nxt_.put (jam_state, i)
				yy_chk_.put (jam_state, i)
				i := i + 1
			end
			table_end := max_index
		end

feature {NONE} -- Compression data

	meta_equiv_classes: LX_EQUIVALENCE_CLASSES
			-- Meta equivalence classes which are sets of classes
			-- with identical transitions out of templates;
			-- Void if meta equivalence classes are not used

	meta_equiv_classes_used: BOOLEAN
			-- Should meta-equivalence classes be used?

	protos: LX_PROTO_QUEUE
			-- Queue of most recently used protos, which are DFA states
			-- with transition tables that have a high probability of
			-- either being redundant (a state processed later will have
			-- an identical transition table) or nearly redundant (a state
			-- processed later will have many of the same out-transitions),
			-- with the hope that most states will find a proto which is
			-- similar enough to be usable, and therefore compacting the
			-- output tables

	templates: LX_TEMPLATE_LIST
			-- Templates are a special type of proto. If a transition
			-- table is homogeneous or nearly homogeneous (all transitions
			-- go to the same destination) then the odds are good that
			-- future states will also go to the same destination state
			-- on basically the same symbol set. These homogeneous states
			-- are so common when dealing with large rule sets that they
			-- merit special attention. If the transition table were 
			-- simply made into a proto, then (typically) each subsequent,
			-- similar state will differ from the proto for two
			-- out-transitions. One of these out-transitions will be that
			-- symbol on which the proto does not go to the common
			-- destination, and one will be that symbol on which the
			-- state does not go to the common destination. Templates,
			-- on the other hand, go to the common state on every
			-- transition symbol, and therefore cost only one difference

	singletons: DS_ARRAYED_LIST [LX_SINGLETON]
			-- States with only one out-transition, saved
			-- for later to fill in holes in tables

	first_free: INTEGER
			-- First empty entry in `yy_nxt'/`yy_chk' tables

	table_end: INTEGER
			-- Last entry in `yy_nxt'/`yy_chk' tables

	templates_count: INTEGER
			-- Number of templates
			-- (takes `jam_state' into account)

	null_state: LX_DFA_STATE is
			-- DFA state used to identify null transitions
		local
			nfa_states: DS_ARRAYED_LIST [LX_NFA_STATE]
		once
			!! nfa_states.make (0)
			!! Result.make (nfa_states, minimum_symbol, maximum_symbol)
			Result.set_id (0)
		ensure
			null_state_not_void: Result /= Void
			null_id: Result.id = 0
		end

feature {NONE} -- Constants

	Jam_id: INTEGER is -32766
			-- Id of the state that always jams

	Initial_max_xpairs: INTEGER is 2000
	Max_xpairs_increment: INTEGER is 2000
			-- Maximum number of next/check pairs for non-templates

	Singletons_capacity: INTEGER is 500
			-- Maximum number of states with only one out-transition
			-- kept in memory for later insertion in table

	Acceptable_diff_percentage: INTEGER is 50
			-- Percentage the number of differences between a state's
			-- transition table and the most similar proto must be of
			-- the state's total number of out-transitions to use the
			-- proto as an aceeptable close match

	Check_common_percentage: INTEGER is 50
			-- Percentage the number of homogeneous out-transitions
			-- of a state must be of the number of total out-transitions
			-- of the state in order  that the state's transition table
			-- is first compared with potential template of the most
			-- common out-transition instead of with the first proto
			-- in the proto queue

	First_match_diff_percentage: INTEGER is 10
			-- Percentage of number of differences between a state's
			-- transition table and the proto it was compared with must
			-- be of the total number of out-transitions of the state in
			-- order to keep the first proto as a good match and not
			-- search any further

	Interior_fit_percentage: INTEGER is 15
			-- Percentage the total number of out-transitions of a state
			-- must be of the number of equivalence classes in order to
			-- consider trying to fit the transition table into holes
			-- inside the next/check tables

	New_proto_diff_percentage: INTEGER is 20
			-- Percentage the number of differences between a state's
			-- transition table and the most similar proto must be of
			-- the state's total number of out-transitions to create
			-- a new proto from the state
 
	Proto_size_percentage: INTEGER is 15
			-- Percentage the number of out-transitions a state must be
			-- of the number of equivalence classes in order to be 
			-- considered for table compaction by using protos

	Template_same_percentage: INTEGER is 60
			-- Percentage the number of homogeneous out-transitions of
			-- a state must be of the number of total out-transitions
			-- of the state in order to consider making a template from
			-- the state

invariant

	yy_nxt_chk_upper: yy_nxt.upper = yy_chk.upper
	yy_nxt_chk_lower: yy_nxt.lower = yy_chk.lower
	yy_base_def_upper: yy_base.upper = yy_def.upper
	yy_base_def_lower: yy_base.lower = yy_def.lower

end -- class LX_COMPRESSED_DFA
