note

	description:

		"ECF custom conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_CUSTOM_CONDITION

inherit

	ET_ECF_CONDITION_ITEM

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make,
	make_excluded

feature {NONE} -- Initialization

	make (a_name, a_value: STRING; a_match: detachable STRING)
			-- Create a new custom condition where variable `a_name' should match to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		do
			name := a_name
			value := a_value
			match := a_match
			is_excluded := False
		ensure
			name_set: name = a_name
			value_set: value = a_value
			match_set: match = a_match
			not_excluded: not is_excluded
		end

	make_excluded (a_name, a_value: STRING; a_match: detachable STRING)
			-- Create a new custom condition where variable `)
			-- Create a new custom condition where variable `a_name' should not match to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		do
			name := a_name
			value := a_value
			match := a_match
			is_excluded := True
		ensure
			name_set: name = a_name
			value_set: value = a_value
			match_set: match = a_match
			excluded: is_excluded
		end

feature -- Access

	name: STRING
			-- Variable name

	value: STRING
			-- Variable value

	match: detachable STRING
			-- Matching strategy

	match_case_sensitive: STRING = "case-sensitive"
			-- Matching strategy "case-sensitive"

	match_case_insensitive: STRING = "case-insensitive"
			-- Matching strategy "case-insensitive"

	match_wildcard: STRING = "wildcard"
			-- Matching strategy "wildcard"

	match_regexp: STRING = "regexp"
			-- Matching strategy "regexp"

feature -- Status report

	is_enabled (a_state: ET_ECF_STATE): BOOLEAN
			-- Does `a_state' fulfill current condition?
		local
			l_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_wildcard: LX_DFA_WILDCARD
			l_actual_value: STRING
		do
			if attached a_state.target.variables.value (name) as l_variable then
				l_actual_value := l_variable
			else
				l_actual_value := ""
			end
			if not attached match as l_match then
				Result := STRING_.same_string (value, l_actual_value)
			elseif STRING_.same_case_insensitive (l_match, match_case_insensitive) then
				Result := STRING_.same_case_insensitive (value, l_actual_value)
			elseif STRING_.same_case_insensitive (l_match, match_wildcard) then
				create l_wildcard.compile_case_sensitive (value)
				if l_wildcard.is_compiled then
					Result := l_wildcard.recognizes (l_actual_value)
				end
			elseif STRING_.same_case_insensitive (l_match, match_regexp) then
			io.error.put_string (name)
			io.error.put_string ("%N")
			io.error.put_string (l_actual_value)
			io.error.put_string ("%N")
				create l_regexp.make
				l_regexp.compile (value)
				if l_regexp.is_compiled then
					Result := l_regexp.recognizes (l_actual_value)
				end
				io.error.put_string (Result.out)
			io.error.put_string ("%N")
			else
				Result := STRING_.same_string (value, l_actual_value)
			end
			Result := (is_excluded /= Result)
		end

	is_excluded: BOOLEAN
			-- Should variable not be equal to `value'?

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty
	value_not_void: value /= Void
	value_not_empty: not value.is_empty

end
