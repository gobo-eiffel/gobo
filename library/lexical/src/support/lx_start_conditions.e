﻿note

	description:

		"Lexical analyzer start condition lists"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

class LX_START_CONDITIONS

inherit

	DS_ARRAYED_LIST [LX_START_CONDITION]

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal,
			copy
		end

	KL_IMPORTED_ARRAY_ROUTINES
		undefine
			is_equal,
			copy
		end

create

	make,
	make_with_initial

feature {NONE} -- Initialization

	make_with_initial (a_capacity: INTEGER)
			-- Create a new start condition list and
			-- insert the "INITIAL" start condition.
		require
			a_capacity_positive: a_capacity > 0
		local
			initial: LX_START_CONDITION
		do
			make (a_capacity)
			create initial.make ("INITIAL", 0, False)
			put_first (initial)
		ensure
			capacity_set: capacity = a_capacity
			initial_inserted: has_start_condition ("INITIAL")
		end

feature -- Status report

	has_start_condition (a_name: STRING): BOOLEAN
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
				a_lower_name := a_name.as_lower
			until
				Result or i > nb
			loop
				Result := a_lower_name.same_string (item (i).name.as_lower)
				i := i + 1
			end
		end

feature -- Access

	start_condition (a_name: STRING): LX_START_CONDITION
			-- Start condition named `a_name'
			-- (Start condition names are case insensitive.)
		require
			a_name_not_void: a_name /= Void
			has_start_condition: has_start_condition (a_name)
		local
			i, nb: INTEGER
			a_lower_name: STRING
			l_result: detachable LX_START_CONDITION
		do
			from
				i := 1
				nb := count
				a_lower_name := a_name.as_lower
			until
				l_result /= Void or i > nb
			loop
				l_result := item (i)
				if not a_lower_name.same_string (l_result.name.as_lower) then
					l_result := Void
					i := i + 1
				end
			end
			check has_start_condition: l_result /= Void then
				Result := l_result
			end
		ensure
			start_condition_not_void: Result /= Void
		end

	names: ARRAY [STRING]
			-- Names of the start conditions held in current list
		local
			i, nb: INTEGER
		do
			nb := count
			if nb = 0 then
				Result := string_array_routines.make_empty_with_lower (0)
			else
				from
					create Result.make_filled (first.name, 0, nb - 1)
					i := 2
				until
					i > nb
				loop
					Result.put (item (i).name, i - 1)
					i := i + 1
				end
			end
		ensure
			names_not_void: Result /= Void
			lower_set: Result.lower = 0
			same_count: Result.count = count
--			definition: forall i in 1..count, Result.item (i - 1) = item (i).name
		end

feature -- Element change

	force_new_start_condition (a_name: STRING; is_exclusive: BOOLEAN)
			-- Create a new start condition named `a_name' and insert
			-- it at the end of list.
		require
			a_name_not_void: a_name /= Void
			new_start_condition: not has_start_condition (a_name)
		local
			a_start_condition: LX_START_CONDITION
		do
				-- Start conditions are indexed starting from 0.
			create a_start_condition.make (a_name, count, is_exclusive)
			force_last (a_start_condition)
		ensure
			one_more: count = old count + 1
			inserted: has_start_condition (a_name)
			name_set: last.name = a_name
			is_exclusive_set: last.is_exclusive = is_exclusive
		end

	append_start_conditions (other: LX_START_CONDITIONS)
			-- Insert `other''s start conditions which are not
			-- inserted yet at the end of list.
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			a_start_condition: LX_START_CONDITION
		do
			nb := other.count
			from
				i := 1
			until
				i > nb
			loop
				a_start_condition := other.item (i)
				if not has (a_start_condition) then
					force_last (a_start_condition)
				end
				i := i + 1
			end
		end

	append_non_eof_start_conditions (other: LX_START_CONDITIONS)
			-- Insert `other''s start conditions which have no
			-- EOF rule yet at the end of list.
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			a_start_condition: LX_START_CONDITION
		do
			nb := other.count
			from
				i := 1
			until
				i > nb
			loop
				a_start_condition := other.item (i)
				if not a_start_condition.has_eof then
					force_last (a_start_condition)
				end
				i := i + 1
			end
		end

feature -- Traversal

	add_nfa_to_all (a_nfa: LX_NFA; a_bol: BOOLEAN)
			-- Add `a_nfa' to `patterns' (or to `bol_patterns'
			-- depending on the value of `a_bol') of all start
			-- conditions in current list.
		require
			a_nfa_not_void: a_nfa /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from
				i := 1
			until
				i > nb
			loop
				item (i).add_nfa (a_nfa, a_bol)
				i := i + 1
			end
		end

	add_nfa_to_non_exclusive (a_nfa: LX_NFA; a_bol: BOOLEAN)
			-- Add `a_nfa' to `patterns' (or to `bol_patterns'
			-- depending on the value of `a_bol') of all
			-- non-exclusive start conditions in current list.
		require
			a_nfa_not_void: a_nfa /= Void
		local
			i, nb: INTEGER
			a_start_condition: LX_START_CONDITION
		do
			nb := count
			from
				i := 1
			until
				i > nb
			loop
				a_start_condition := item (i)
				if not a_start_condition.is_exclusive then
					a_start_condition.add_nfa (a_nfa, a_bol)
				end
				i := i + 1
			end
		end

invariant

	no_void_start_condition: not has_void

end
