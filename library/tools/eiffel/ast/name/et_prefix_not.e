indexing

	description:

		"Eiffel prefix 'not' feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_PREFIX_NOT

inherit

	ET_PREFIX
		redefine
			is_prefix_not
		end

feature -- Access

	name: STRING is "prefix %"not%""
			-- Name of feature

	hash_code: INTEGER is 21
			-- Hash code

feature -- Status report

	is_prefix_not: BOOLEAN is True
			-- Is current feature name of the form 'prefix "not"'?

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		do
			Result := other.is_prefix_not
		end

end
