note

	description:

		"Feature name routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_NAME_ROUTINES

feature -- Access

	feature_name (a_feature_name: STRING): detachable ET_FEATURE_NAME
			-- Feature name corresponding to `a_feature_name';
			-- Void if not a valid feature name
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_feature_name_not_empty: not a_feature_name.is_empty
		do
			if identifier_regexp.recognizes (a_feature_name) then
				create {ET_IDENTIFIER} Result.make (a_feature_name)
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

end
