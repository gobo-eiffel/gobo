indexing

	description:

		"Split a string into tokens"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_SPLITTER

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make, make_with_separators

feature {NONE} -- Initialization

	make is
			-- Create a new string splitter.
		do
			set_separators (Default_separators)
		ensure
			default_separators: separators = Default_separators
			no_escape_character: not has_escape_character
		end

	make_with_separators (a_string: STRING) is
			-- Create a new string splitter with separators specified in `a_string'.
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: not a_string.is_empty
		do
			set_separators (a_string)
		ensure
			separators_set: separators = a_string
			no_escape_character: not has_escape_character
		end

feature -- Access

	separators: STRING
			-- Characters used as token separators

	has_escape_character: BOOLEAN
			-- Is there an escape character set?

	escape_character: CHARACTER
			-- Escape character
			-- (When in an input string, it is removed and replaced
			-- with the character following it. This following
			-- character is not treated as a separator.)

	Default_separators: STRING is " %T%R%N"
			-- Space, Tab, CR, Newline

feature -- Setting

	set_separators (a_string: STRING) is
			-- Set characters used as separators within string.
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: not a_string.is_empty
			escape_character_not_separator: has_escape_character implies
				not a_string.has (escape_character)
		local
			i, nb: INTEGER
		do
			separators := a_string
				-- Initialize codes hash set from separators.
			nb := a_string.count
			create separator_codes.make (nb)
			from i := 1 until i > nb loop
				separator_codes.put (a_string.item_code (i))
				i := i + 1
			end
		ensure
			separators_set: separators = a_string
		end

	set_escape_character (a_character: CHARACTER) is
			-- Set escape character.
		require
			escape_character_not_separator: not separators.has (a_character)
		do
			escape_character := a_character
			has_escape_character := True
		ensure
			has_escape_character: has_escape_character
			escape_character_set: escape_character = a_character
		end

	reset_escape_character is
			-- Remove escape character.
		do
			has_escape_character := False
		ensure
			not_has_escape_character: not has_escape_character
		end

feature -- Status report

	has_empty (a_linear: DS_LINEAR [STRING]): BOOLEAN is
			-- Is there an empty string in this sequence?
		require
			a_linear_not_void: a_linear /= Void
			no_void_item: not a_linear.has (Void)
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
		do
			a_cursor := a_linear.new_cursor
			from a_cursor.start until a_cursor.after loop
				if a_cursor.item.is_empty then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			definition_empty: a_linear.is_empty implies not Result
			definition_for_first: a_linear.count > 0
				implies (a_linear.first.is_empty implies Result)
		end

feature -- Operation(s)

	split (a_string: STRING): DS_LIST [STRING] is
			-- Split a string according to separator
			-- and escape character settings.
			-- A sequence of separators is a single separator,
			-- a separator at start/end of string is ignored.
		require
			a_string_not_void: a_string /= Void
		do
			Result := do_split (a_string, False)
		ensure
			separators_as_sequence: split (separators).is_empty
			split_not_void: Result /= Void
			no_void_item: not Result.has (Void)
			no_empty_item: not has_empty (Result)
			count_ceiling: Result.count <= a_string.count // 2 + 1
			last_escape_character_verbatim: (a_string.count >= 2
				and then a_string.item (a_string.count) = escape_character
				and then a_string.item (a_string.count - 1) /= escape_character)
				implies (Result.last.item (Result.last.count) = escape_character)
		end

	split_greedy (a_string: STRING): DS_LIST [STRING] is
			-- Split a string according to separator
			-- and escape character settings.
			-- Each separator character makes a separate separator
			-- e.g. split ("/a//") = << "", "a", "", "" >>.
			-- So we end up with as many items (possibly empty) as
			-- possible, hence the name "greedy".
		require
			a_string_not_void: a_string /= Void
		do
			Result := do_split (a_string, True)
		ensure
			separators_as_character: split_greedy (separators).count = separators.count + 1
			split_character_not_void: Result /= Void
			no_void_item: not Result.has (Void)
			count_ceiling: Result.count <= a_string.count + 1
			last_escape_character_verbatim: (a_string.count >= 2
				and then a_string.item (a_string.count) = escape_character
				and then a_string.item (a_string.count - 1) /= escape_character)
				implies (Result.last.item (Result.last.count) = escape_character)
		end

	join (a_linear: DS_LINEAR [STRING]): STRING is
			-- Join sequence to a string using the first of the
			-- `separators' as separator, and escape separators
			-- within tokens.
		require
			has_escape_character: has_escape_character
			a_linear_not_void: a_linear /= Void
			no_void_item: not a_linear.has (Void)
			no_empty_item: not has_empty (a_linear)
		do
			Result := do_join (a_linear, False)
		ensure
			join_not_void: Result /= Void
			same_count: split (Result).count = a_linear.count
			stable_reversible: STRING_.same_string (join (split (Result)), Result)
		end

	join_greedy (a_linear: DS_LINEAR [STRING]): STRING is
			-- Join sequence to a string using the first of the
			-- `separators' as separator, and escape separators
			-- within tokens.
		require
			has_escape_character: has_escape_character
			a_linear_not_void: a_linear /= Void
			no_void_item: not a_linear.has (Void)
		do
			Result := do_join (a_linear, True)
		ensure
			join_not_void: Result /= Void
			same_count: split_greedy (Result).count = a_linear.count
			stable_reversible: STRING_.same_string (join_greedy (split_greedy (Result)), Result)
		end

	join_unescaped (a_linear: DS_LINEAR [STRING]): STRING is
			-- Join sequence to a string using the first of the
			-- `separators' as separator. Separators within items
			-- are NOT escaped, see `join' for escaping version.
		require
			a_linear_not_void: a_linear /= Void
			no_void_item: not a_linear.has (Void)
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
			a_separator: STRING
		do
			create Result.make_empty
				-- Using a string for separator is unicode compatible.
			a_separator := separators.substring (1, 1)
			a_cursor := a_linear.new_cursor
			from a_cursor.start until a_cursor.after loop
				Result := STRING_.appended_string (Result, a_cursor.item)
				a_cursor.forth
				if not a_cursor.after then
					Result := STRING_.appended_string (Result, a_separator)
				end
			end
		ensure
			join_unescaped_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	separator_codes: DS_HASH_SET [INTEGER]
			-- Character codes of separators
			-- (Hashed, and integer for unicode compatibility.)

	do_split (a_string: STRING; a_greedy: BOOLEAN): DS_LIST [STRING] is
			-- Split implementation.
		local
			i, nb: INTEGER
			last_separator: INTEGER
			last_escaped: INTEGER
			escape_code: INTEGER
			a_code: INTEGER
			an_item: STRING
		do
			create {DS_LINKED_LIST [STRING]} Result.make
			nb := a_string.count
			if nb > 0 then
				if has_escape_character then
					escape_code := escape_character.code
				end
				from
					i := 1
					last_separator := 0
					last_escaped := 1
				invariant
					last_separator: last_separator < i
					last_escaped: last_escaped <= i
				until
					i > nb
				loop
					a_code := a_string.item_code (i)
					if has_escape_character and then a_code = escape_code and then i < nb then
						if an_item = Void then
							an_item := a_string.substring (last_escaped, i - 1)
						else
							an_item := STRING_.appended_substring (an_item, a_string, last_escaped, i - 1)
						end
						i := i + 1
						last_escaped := i
					elseif separator_codes.has (a_code) then
						if last_separator = i - 1 then
							if a_greedy then
								Result.force_last ("")
							end
						else
							if an_item = Void then
								an_item := a_string.substring (last_escaped, i - 1)
							else
								an_item := STRING_.appended_substring (an_item, a_string, last_escaped, i - 1)
							end
							Result.force_last (an_item)
						end
						an_item := Void
						last_separator := i
						last_escaped := i + 1
					end
					i := i + 1
				end
				if last_separator = 0 then
					if an_item = Void then
						an_item := a_string
					else
						an_item := STRING_.appended_substring (an_item, a_string, last_escaped, nb)
					end
					Result.force_last (an_item)
				elseif last_separator < nb then
					if an_item = Void then
						an_item := a_string.substring (last_escaped, nb)
					else
						an_item := STRING_.appended_substring (an_item, a_string, last_escaped, nb)
					end
					Result.force_last (an_item)
				elseif a_greedy then
					Result.force_last ("")
				end
			end
		ensure
			split_not_void: Result /= Void
			no_void_item: not Result.has (Void)
		end

	do_join (a_linear: DS_LINEAR [STRING]; a_greedy: BOOLEAN): STRING is
			-- Join sequence to a string using the first of the
			-- `separators' as separator, and escape separators
			-- within tokens.
		require
			has_escape_character: has_escape_character
			a_linear_not_void: a_linear /= Void
			no_void_item: not a_linear.has (Void)
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
			a_separator: STRING
		do
			create Result.make_empty
				-- Using a string for separator is unicode compatible.
			a_separator := separators.substring (1, 1)
			a_cursor := a_linear.new_cursor
			from a_cursor.start until a_cursor.after loop
				Result := escape_appended_string (Result, a_cursor.item)
				a_cursor.forth
				if not a_cursor.after then
					Result := STRING_.appended_string (Result, a_separator)
				end
			end
		ensure
			join_not_void: Result /= Void
		end

	escape_appended_string (a_result: STRING; a_string: STRING): STRING is
			-- Append `a_string' to `a_result', with escaping if necessary.
		require
			a_result_not_void: a_result /= Void
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			last_after: INTEGER
			a_code: INTEGER
		do
			Result := a_result
			last_after := 1
			nb := a_string.count
			from i := 1 until i > nb loop
				a_code := a_string.item_code (i)
				if a_code = escape_character.code or separator_codes.has (a_code) then
					Result := STRING_.appended_substring (Result, a_string, last_after, i - 1)
					Result.append_character (escape_character)
					last_after := i
				end
				i := i + 1
			end
			if last_after = 1 then
				Result := STRING_.appended_string (Result, a_string)
			else
				Result := STRING_.appended_substring (Result, a_string, last_after, nb)
			end
		ensure
			appended_string_not_void: Result /= Void
		end

invariant

	separators_not_void: separators /= Void
	separators_not_empty: not separators.is_empty
	escape_character_not_separator: has_escape_character
		implies not separators.has (escape_character)

end
