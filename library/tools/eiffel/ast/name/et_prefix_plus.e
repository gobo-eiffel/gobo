indexing

	description:

		"Eiffel prefix '+' feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_PREFIX_PLUS

inherit

	ET_PREFIX
		redefine
			is_prefix_plus
		end

feature -- Access

	name: STRING is
			-- Name of feature
		once
			Result := prefix_name
		end

	hash_code: INTEGER is
			-- Hash code
		once
			Result := 22
		end

feature -- Status report

	is_prefix_plus: BOOLEAN is
			-- Is current feature name of the form 'prefix "+"'?
		once
			Result := True
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		do
			Result := other.is_prefix_plus
		end

feature {NONE} -- Implementation

	prefix_name: STRING is "prefix %"+%""
			-- Prefix name

end
