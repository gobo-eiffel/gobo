note

	description:

		"Objects that pair a compiled regular expression with matched inputs"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REGEXP_CACHE_ENTRY

inherit

	UC_SHARED_STRING_EQUALITY_TESTER

	XM_XPATH_REGEXP_CACHE_ROUTINES

		-- TODO: this class uses an infinite-memory cache (DS_HASH_TABLE)
		--       for the match records. Make this some kind of finite-memory
		--       cache.

create

	make

feature {NONE} -- Initialization

	make (a_pattern, a_flags_string: STRING)
			-- Establish invariant.
		require
			pattern_not_void: a_pattern /= Void
			flags_not_void: a_flags_string /= Void
			normalised_flags: are_normalized_flags (a_flags_string)
		do
			create regexp.make
			set_flags (a_flags_string)
			regexp.compile (a_pattern)
			if not regexp.is_compiled then
				is_error := True
			end
			create match_records.make_with_equality_testers (10, Void, string_equality_tester)
		end

feature -- Access

	regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Compiled regular expression

	has_match_record (an_input_string: STRING): BOOLEAN
			-- Does `Current' have a previous match for `an_input_string'?
		require
			input_string_not_void: an_input_string /= Void
			no_error: not is_error
		do
			Result := match_records.has (an_input_string)
		end

	match_record (an_input_string: STRING): XM_XPATH_REGEXP_MATCH_RECORD
			-- Possible previous match against `an_input_string'
		require
			input_string_not_void: an_input_string /= Void
			no_error: not is_error
		do
			if match_records.has (an_input_string) then
				Result := match_records.item (an_input_string)
			end
		ensure
			maybe_not_match: True
		end

feature -- Status report

	is_error: BOOLEAN
			-- Did compilation fail?

feature -- Element change

	add_splitting_match (an_input_string: STRING; some_tokens: ARRAY [STRING])
			-- Add a splitting match record.
		require
			input_string_not_void: an_input_string /= Void
			tokens_not_void: some_tokens /= Void
			no_error: not is_error
		local
			a_match_record: XM_XPATH_REGEXP_MATCH_RECORD
		do
			create a_match_record.make (some_tokens)
			match_records.force (a_match_record, an_input_string)
		ensure
			match_added: has_match_record (an_input_string)
			correct_match: match_record (an_input_string).tokens = some_tokens
		end

feature {NONE} -- Implementation

	match_records: DS_HASH_TABLE [XM_XPATH_REGEXP_MATCH_RECORD, STRING]
			-- Records of previous matches

	set_flags (a_flags_string: STRING)
			-- Set regular expression flags.
		require
			flag_string_not_void: a_flags_string /= Void
			normalized_flags: are_normalized_flags (a_flags_string)
		local
			an_index: INTEGER
		do
			regexp.set_default_options
			regexp.set_strict (True)
			-- TODO regexp.set_unicode
			from
				an_index := 1
			until
				an_index > a_flags_string.count
			loop
				inspect
					a_flags_string.item (an_index)
				when 'm' then
					regexp.set_multiline (True)
				when 'i' then
					regexp.set_caseless (True)
				when 's' then
					regexp.set_dotall (True)
				when 'x' then
					regexp.set_extended (True)
				end
				an_index := an_index + 1
			variant
				a_flags_string.count + 1 - an_index
			end
		end

invariant

	error_or_regexp_not_void: not is_error implies regexp /= Void
	match_records_not_void: match_records /= Void

end

