indexing

	description:
	
		"Split a string into tokens"
	
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
class ST_SPLITTER

inherit
	
	ANY
	
	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

creation

	make
	
feature {NONE} -- Creation

	make is
			-- Initialise.
		do
			set_separators (Default_Separators)
		ensure
			default_separators: separators = Default_separators 
			no_escape_character: not has_escape_character
		end
		
feature -- Status	

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

feature {NONE} -- Status

	separator_codes: DS_HASH_SET [INTEGER]
			-- Character codes of separators 
			-- (Hashed, and integer for unicode compatibility.)
			
feature -- Setting

	set_separators (a_string: STRING) is
			-- Set characters used as separators within string.
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: not a_string.is_empty
			escape_character_not_separator: has_escape_character implies
					not a_string.has (escape_character)
		local
			i: INTEGER
		do
			separators := a_string
				-- Initialise codes hash set from separators.
			create separator_codes.make (separators.count)
			from
				i := 1
			variant
				separators.count - i + 1
			until
				i > separators.count
			loop
				separator_codes.put (separators.item_code (i))
				i := i + 1
			end
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

feature -- Operation(s)

	split (a_string: STRING): DS_LIST [STRING] is
			-- Split a string according to separator 
			-- and escape character settings.
		local
			i: INTEGER
			cnt: INTEGER
			in_separator: BOOLEAN
			last_after_separator: INTEGER
		do
			create {DS_LINKED_LIST [STRING]} Result.make
			from
				i := 1
				cnt := a_string.count
				last_after_separator := 1
			invariant
				last_after_separator_before_index: last_after_separator <= i
			variant
				cnt - i + 1
			until
				i > cnt
			loop
				if is_separator (a_string, i) then
					if not in_separator then
						if i > 1 then
							Result.force_last (unescape (a_string.substring (last_after_separator, i - 1)))
						else
								-- First character is separator: no previous string.
						end
						in_separator := True
					end
					check in: in_separator end
				else
					if in_separator then
						last_after_separator := i
						in_separator := False
					end
					check not_in: not in_separator end
				end
				i := i + 1
			end
			if not in_separator and last_after_separator <= cnt then
				Result.force_last (unescape (a_string.substring (last_after_separator, cnt)))
			end
		ensure
			result_not_void: Result /= Void
			count_ceiling: Result.count <= a_string.count // 2 + 1
			last_escape_character_verbatim: (a_string.count >= 2
				and then a_string.item (a_string.count) = escape_character 
				and then a_string.item (a_string.count - 1) /= escape_character)
					implies (Result.last.item (Result.last.count) = escape_character)
		end
		
	join (a_linear: DS_LINEAR [STRING]): STRING is
			-- Join sequence to a string using the first of 
			-- the separators as separator, and escape separators 
			-- within tokens.
		require
			has_escape_character: has_escape_character
			a_linear_not_void: a_linear /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
			a_separator: STRING
		do
			create Result.make_empty
			from
					-- Using a_string for separator is unicode compatible.
				a_separator := separators.substring (1, 1)
				a_cursor := a_linear.new_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				Result := escape_appended_string (Result, a_cursor.item)
				a_cursor.forth
				if not a_cursor.after then
					Result := STRING_.appended_string (Result, a_separator)
				end
			end
		ensure
			result_not_void: Result /= Void
			same_count: split (Result).count = a_linear.count
			stable_reversible: join (split (Result)).is_equal (Result)
		end
		
feature {NONE} -- Implementation

	is_separator (a_string: STRING; a_position: INTEGER): BOOLEAN is
			-- Is the character at this position a separator?
		require
			a_string_not_void: a_string /= Void
			a_position_bounds: a_position > 0 and a_position <= a_string.count
		do
			if has_escape_character and a_position > 1 then
				Result := separator_codes.has (a_string.item_code (a_position))
						and a_string.item (a_position - 1) /= escape_character
			else
				Result := separator_codes.has (a_string.item_code (a_position))
			end
		end
		
	escape_appended_string (a_result: STRING; a_string: STRING): STRING is
			-- Append a string, with escaping if necessary.
		require
			a_result_not_void: a_result /= Void
			a_string_not_void: a_string /= Void
		local
			i: INTEGER
			cnt: INTEGER
			last_after: INTEGER
		do
			Result := a_result
			from
				i := 1
				cnt := a_string.count
				last_after := 1
			variant
				cnt - i + 1
			until
				i > cnt
			loop
				if a_string.item (i) = escape_character or separator_codes.has (a_string.item_code (i)) then
					Result := STRING_.appended_string (Result, a_string.substring (last_after, i - 1))
					Result.append_character (escape_character)
					last_after := i
				end
				i := i + 1
			end
			if last_after = 1 then
				Result := STRING_.appended_string (Result, a_string)
			else
				Result := STRING_.appended_string (Result, a_string.substring (last_after, cnt))
			end
		end
		
	unescape (a_string: STRING): STRING is
			-- Remove escaped character sequences from input string.
		require
			not_void: a_string /= Void
		local
			i: INTEGER
			cnt: INTEGER
			last_after: INTEGER
		do
			if has_escape_character then
				create Result.make_empty
				from
					i := 1
					cnt := a_string.count
					last_after := 1
				invariant
					last_after <= cnt
				variant
					cnt - i + 1
				until
					i >= cnt -- (stop at cnt - 1 because last character cannot be escape).
				loop
					if a_string.item (i) = escape_character then
						Result := STRING_.appended_string (Result, a_string.substring (last_after, i - 1))
						i := i + 1 -- skip test on escaped character
						last_after := i
					end
					i := i + 1
				end
				if last_after = 1 then
					Result := a_string
				else
					Result := STRING_.appended_string (Result, a_string.substring (last_after, cnt))
				end
			else
				Result := a_string
			end
		end
				
invariant

	separators_not_void: separators /= Void
	separators_not_empty: not separators.is_empty
	escape_character_not_separator: has_escape_character 
			implies not separators.has(escape_character)

end
