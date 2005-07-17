indexing

	description:

		"Eiffel extended feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXTENDED_FEATURE_NAME

inherit

	ET_AST_NODE

feature -- Initialization

	reset is
			-- Reset feature name as it was when it was first parsed.
		deferred
		end

feature -- Access

	feature_name: ET_FEATURE_NAME is
			-- Feature name
		deferred
		ensure
			feature_name_not_void: Result /= Void
		end

	alias_name: ET_ALIAS_NAME is
			-- Alias name, if any
		deferred
		end

feature -- Comparison

	same_extended_feature_name (other: ET_EXTENDED_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same extended feature name?
			-- (case insensitive)
		require
			other_not_void: other /= Void
		do
			if alias_name = Void then
				if other.alias_name = Void then
					Result := feature_name.same_feature_name (other.feature_name)
				end
			elseif other.alias_name /= Void then
				if alias_name.same_alias_name (other.alias_name) then
					Result := feature_name.same_feature_name (other.feature_name)
				end
			end
		end

end
