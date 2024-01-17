note

	description:

		"Eiffel extended feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2019, Eric Bezault and others"
	license: "MIT License"

deferred class ET_EXTENDED_FEATURE_NAME

inherit

	ET_AST_NODE

feature -- Initialization

	reset
			-- Reset feature name as it was when it was last parsed.
		deferred
		end

feature -- Access

	feature_name: ET_FEATURE_NAME
			-- Feature name
		deferred
		ensure
			feature_name_not_void: Result /= Void
		end

	alias_names: detachable ET_ALIAS_NAME_LIST
			-- Alias names, if any
		deferred
		end

feature -- Comparison

	same_extended_feature_name (other: ET_EXTENDED_FEATURE_NAME): BOOLEAN
			-- Are current feature name and `other' the same extended feature name?
			-- (case insensitive)
		require
			other_not_void: other /= Void
		do
			if not attached alias_names as l_alias_names or else l_alias_names.is_empty then
				if not attached other.alias_names as l_other_alias_names or else l_other_alias_names.is_empty then
					Result := feature_name.same_feature_name (other.feature_name)
				end
			elseif attached other.alias_names as l_other_alias_names and then not l_other_alias_names.is_empty then
				if feature_name.same_feature_name (other.feature_name) then
					Result := l_alias_names.same_alias_names (l_other_alias_names)
				end
			end
		end

	same_call_name (a_call_name: ET_CALL_NAME): BOOLEAN
			-- Is `Current' the name of a feature which could be called with `a_call_name'?
			-- (case insensitive)
		require
			a_call_name_not_void: a_call_name /= Void
		deferred
		end

end
