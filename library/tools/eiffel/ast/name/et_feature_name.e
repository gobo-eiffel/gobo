indexing

	description:

		"Eiffel feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_NAME

inherit

	ET_FEATURE_NAME_ITEM
	HASHABLE

feature -- Access

	name: STRING is
			-- Name of feature
		deferred
		ensure
			name_not_void: Result /= Void
			name_not_empty: Result.count > 0
		end

	feature_name_item: ET_FEATURE_NAME is
			-- Feature name in comma-separated list
		do
			Result := Current
		end

feature -- Status report

	is_identifier: BOOLEAN is
			-- Is current feature name an identifier?
		do
			-- Result := False
		end

	is_infix: BOOLEAN is
			-- Is current feature name of the form 'infix ...'?
		do
			-- Result := False
		end

	is_infix_and: BOOLEAN is
			-- Is current feature name of the form 'infix "and"'?
		do
			-- Result := False
		end

	is_infix_and_then: BOOLEAN is
			-- Is current feature name of the form 'infix "and then"'?
		do
			-- Result := False
		end

	is_infix_div: BOOLEAN is
			-- Is current feature name of the form 'infix "//"'?
		do
			-- Result := False
		end

	is_infix_divide: BOOLEAN is
			-- Is current feature name of the form 'infix "/"'?
		do
			-- Result := False
		end

	is_infix_free: BOOLEAN is
			-- Is current feature name of the form 'infix "free-operator"'?
		do
			-- Result := False
		end

	is_infix_ge: BOOLEAN is
			-- Is current feature name of the form 'infix ">="'?
		do
			-- Result := False
		end

	is_infix_gt: BOOLEAN is
			-- Is current feature name of the form 'infix ">"'?
		do
			-- Result := False
		end

	is_infix_implies: BOOLEAN is
			-- Is current feature name of the form 'infix "implies"'?
		do
			-- Result := False
		end

	is_infix_le: BOOLEAN is
			-- Is current feature name of the form 'infix "<="'?
		do
			-- Result := False
		end

	is_infix_lt: BOOLEAN is
			-- Is current feature name of the form 'infix "<"'?
		do
			-- Result := False
		end

	is_infix_minus: BOOLEAN is
			-- Is current feature name of the form 'infix "-"'?
		do
			-- Result := False
		end

	is_infix_mod: BOOLEAN is
			-- Is current feature name of the form 'infix "\\"'?
		do
			-- Result := False
		end

	is_infix_or: BOOLEAN is
			-- Is current feature name of the form 'infix "or"'?
		do
			-- Result := False
		end

	is_infix_or_else: BOOLEAN is
			-- Is current feature name of the form 'infix "or else"'?
		do
			-- Result := False
		end

	is_infix_plus: BOOLEAN is
			-- Is current feature name of the form 'infix "+"'?
		do
			-- Result := False
		end

	is_infix_power: BOOLEAN is
			-- Is current feature name of the form 'infix "^"'?
		do
			-- Result := False
		end

	is_infix_times: BOOLEAN is
			-- Is current feature name of the form 'infix "*"'?
		do
			-- Result := False
		end

	is_infix_xor: BOOLEAN is
			-- Is current feature name of the form 'infix "xor"'?
		do
			-- Result := False
		end

	is_prefix: BOOLEAN is
			-- Is current feature name of the form 'prefix ...'?
		do
			-- Result := False
		end

	is_prefix_minus: BOOLEAN is
			-- Is current feature name of the form 'prefix "-"'?
		do
			-- Result := False
		end

	is_prefix_plus: BOOLEAN is
			-- Is current feature name of the form 'prefix "+"'?
		do
			-- Result := False
		end

	is_prefix_free: BOOLEAN is
			-- Is current feature name of the form 'prefix "free-operator"'?
		do
			-- Result := False
		end

	is_prefix_not: BOOLEAN is
			-- Is current feature name of the form 'prefix "not"'?
		do
			-- Result := False
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		require
			other_not_void: other /= Void
		deferred
		end

end
