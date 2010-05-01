note

	description:

		"Eiffel extended feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXTENDED_FEATURE_NAME

inherit

	ET_AST_NODE

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Initialization

	reset is
			-- Reset feature name as it was when it was last parsed.
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
				if feature_name.same_feature_name (other.feature_name) then
					if ANY_.same_objects (alias_name, feature_name) then
							-- This is a 'prefix "..."' or 'infix "..."'.
						Result := True
					elseif alias_name.same_alias_name (other.alias_name) then
						Result := True
					end
				end
			end
		end

end
