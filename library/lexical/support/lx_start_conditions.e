indexing

	description:

		"Lexical analyzer start condition lists"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_START_CONDITIONS

inherit

	DS_ARRAYED_LIST [LX_START_CONDITION]

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal, copy
		end

creation

	make, make_with_initial

feature {NONE} -- Initialization

	make_with_initial (a_capacity: INTEGER) is
			-- Create a new start condition list and 
			-- insert the "INITIAL" start condition.
		require
			a_capacity_positive: a_capacity > 0
		local
			initial: LX_START_CONDITION
		do
			make (a_capacity)
			!! initial.make ("INITIAL", 0, False)
			put_first (initial)
		ensure
			capacity_set: capacity = a_capacity
			initial_inserted: has_start_condition ("INITIAL")
		end

feature -- Status report

	has_start_condition (a_name: STRING): BOOLEAN is
			-- Does current list include a start condition named `a_name'?
			-- (Start condition names are case insensitive.)
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			a_lower_name: STRING
		do
			from
				i := 1
				nb := count
				a_lower_name := STRING_.to_lower (a_name)
			until
				Result or i > nb
			loop
				Result :=
					a_lower_name.is_equal (STRING_.to_lower (item (i).name))
				i := i + 1
			end
		end

feature -- Access

	start_condition (a_name: STRING): LX_START_CONDITION is
			-- Start condition named `a_name'
			-- (Start condition names are case insensitive.)
		require
			a_name_not_void: a_name /= Void
			has_start_condition: has_start_condition (a_name)
		local
			i, nb: INTEGER
			a_lower_name: STRING
		do
			from
				i := 1
				nb := count
				a_lower_name := STRING_.to_lower (a_name)
			until
				Result /= Void or i > nb
			loop
				Result := item (i)
				if
					not a_lower_name.is_equal (STRING_.to_lower (Result.name))
				then
					Result := Void
					i := i + 1
				end
			end
		ensure
			start_condition_not_void: Result /= Void
		end

	names: ARRAY [STRING] is
			-- Names of the start conditions held in current list
		local
			i, nb: INTEGER
		do
			nb := count
			!! Result.make (0, nb - 1)
			from i := 1 until i > nb loop
				Result.put (item (i).name, i - 1)
				i := i + 1
			end
		ensure
			names_not_void: Result /= Void
			lower_set: Result.lower = 0
			same_count: Result.count = count
--			definition: forall i in 1..count,
--				Result.item (i - 1) = item (i).name
		end

feature -- Element change

	force_new_start_condition (a_name: STRING; is_exclusive: BOOLEAN) is
			-- Create a new start condition named `a_name' and insert
			-- it at the end of list.
		require
			a_name_not_void: a_name /= Void
			new_start_condition: not has_start_condition (a_name)
		local
			a_start_condition: LX_START_CONDITION
		do
				-- Start conditions are indexed starting from 0.
			!! a_start_condition.make (a_name, count, is_exclusive)
			force_last (a_start_condition)
		ensure
			one_more: count = old count + 1
			inserted: has_start_condition (a_name)
			name_set: last.name = a_name
			is_exclusive_set: last.is_exclusive = is_exclusive
		end

	append_start_conditions (other: LX_START_CONDITIONS) is
			-- Insert `other''s start conditions which are not
			-- inserted yet at the end of list.
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			a_start_condition: LX_START_CONDITION
		do
			nb := other.count
			from i := 1 until i > nb loop
				a_start_condition := other.item (i)
				if not has (a_start_condition) then
					force_last (a_start_condition)
				end
				i := i + 1
			end
		end

	append_non_eof_start_conditions (other: LX_START_CONDITIONS) is
			-- Insert `other''s start conditions which have no
			-- EOF rule yet at the end of list.
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			a_start_condition: LX_START_CONDITION
		do
			nb := other.count
			from i := 1 until i > nb loop
				a_start_condition := other.item (i)
				if not a_start_condition.has_eof then
					force_last (a_start_condition)
				end
				i := i + 1
			end
		end

feature -- Traversal

	add_nfa_to_all (a_nfa: LX_NFA) is
			-- Add `a_nfa' to `patterns' of all start
			-- conditions in current list.
		require
			a_nfa_not_void: a_nfa /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				item (i).put_nfa (a_nfa)
				i := i + 1
			end
		end

	add_nfa_to_non_exclusive (a_nfa: LX_NFA) is
			-- Add `a_nfa' to `patterns' of all non-exclusive
			-- start conditions in current list.
		require
			a_nfa_not_void: a_nfa /= Void
		local
			i, nb: INTEGER
			a_start_condition: LX_START_CONDITION
		do
			nb := count
			from i := 1 until i > nb loop
				a_start_condition := item (i)
				if not a_start_condition.is_exclusive then
					a_start_condition.put_nfa (a_nfa)
				end
				i := i + 1
			end
		end

	add_bol_nfa_to_all (a_nfa: LX_NFA) is
			-- Add `a_nfa' to `bol_patterns' of all start
			-- conditions in current list.
		require
			a_nfa_not_void: a_nfa /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				item (i).put_bol_nfa (a_nfa)
				i := i + 1
			end
		end

	add_bol_nfa_to_non_exclusive (a_nfa: LX_NFA) is
			-- Add `a_nfa' to `bol_patterns' of all non-exclusive
			-- start conditions in current list.
		require
			a_nfa_not_void: a_nfa /= Void
		local
			i, nb: INTEGER
			a_start_condition: LX_START_CONDITION
		do
			nb := count
			from i := 1 until i > nb loop
				a_start_condition := item (i)
				if not a_start_condition.is_exclusive then
					a_start_condition.put_bol_nfa (a_nfa)
				end
				i := i + 1
			end
		end

invariant

	no_void_start_condition: not has (Void)

end -- class LX_START_CONDITIONS
