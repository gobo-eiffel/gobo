note

	description:

		"Feature name routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_NAME_ROUTINES

inherit

	ANY

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	feature_name (a_feature_name: STRING): detachable ET_FEATURE_NAME
			-- Feature name corresponding to `a_feature_name';
			-- Void if not a valid feature name
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_feature_name_not_empty: not a_feature_name.is_empty
		local
			l_manifest_string: ET_REGULAR_MANIFEST_STRING
		do
			if identifier_regexp.recognizes (a_feature_name) then
				create {ET_IDENTIFIER} Result.make (a_feature_name)
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_and_name) then
				Result := tokens.infix_and_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_implies_name) then
				Result := tokens.infix_implies_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_or_name) then
				Result := tokens.infix_or_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_xor_name) then
				Result := tokens.infix_xor_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_div_name) then
				Result := tokens.infix_div_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_divide_name) then
				Result := tokens.infix_divide_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_ge_name) then
				Result := tokens.infix_ge_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_gt_name) then
				Result := tokens.infix_gt_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_le_name) then
				Result := tokens.infix_le_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_lt_name) then
				Result := tokens.infix_lt_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_minus_name) then
				Result := tokens.infix_minus_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_mod_name) then
				Result := tokens.infix_mod_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_plus_name) then
				Result := tokens.infix_plus_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_power_name) then
				Result := tokens.infix_power_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_times_name) then
				Result := tokens.infix_times_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_and_then_name) then
				Result := tokens.infix_and_then_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.infix_or_else_name) then
				Result := tokens.infix_or_else_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.prefix_not_name) then
				Result := tokens.prefix_not_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.prefix_plus_name) then
				Result := tokens.prefix_plus_feature_name
			elseif STRING_.same_case_insensitive (a_feature_name, tokens.prefix_minus_name) then
				Result := tokens.prefix_minus_feature_name
			elseif free_infix_feature_name_regexp.recognizes (a_feature_name) then
				create l_manifest_string.make (free_infix_feature_name_regexp.captured_substring (1))
				create {ET_INFIX_FREE_NAME} Result.make (l_manifest_string)
			elseif free_prefix_feature_name_regexp.recognizes (a_feature_name) then
				create l_manifest_string.make (free_prefix_feature_name_regexp.captured_substring (1))
				create {ET_PREFIX_FREE_NAME} Result.make (l_manifest_string)
			else
				-- Invalid feature name.
			end
		end

feature {NONE} -- Implementation

	identifier_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regular expression matching Eiffel identifiers
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile ("[a-z][a-z0-9_]*")
		ensure
			identifier_regexp_not_void: Result /= Void
			identifier_regexp_compiled: Result.is_compiled
			identifier_regexp_case_insensitive: Result.is_case_insensitive
		end

	free_infix_feature_name_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regular expression matching Eiffel free infix feature name
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile ("infix \%"([@#|&][^%%%" \t\r\n]*)\%"")
		ensure
			free_infix_feature_name_regexp_not_void: Result /= Void
			free_infix_feature_name_regexp_compiled: Result.is_compiled
			free_infix_feature_name_regexp_case_insensitive: Result.is_case_insensitive
			one_subpattern: Result.has_matched implies Result.match_count = 2
		end

	free_prefix_feature_name_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regular expression matching Eiffel free prefix feature name
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile ("prefix \%"([@#|&][^%%%" \t\r\n]*)\%"")
		ensure
			free_prefix_feature_name_regexp_not_void: Result /= Void
			free_prefix_feature_name_regexp_compiled: Result.is_compiled
			free_prefix_feature_name_regexp_case_insensitive: Result.is_case_insensitive
			one_subpattern: Result.has_matched implies Result.match_count = 2
		end

end
