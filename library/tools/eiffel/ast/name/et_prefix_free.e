indexing

	description:

		"Eiffel prefix 'free-operator' feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_PREFIX_FREE

inherit

	ET_PREFIX
		redefine
			is_prefix_free
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal
		end

feature -- Access

	name: STRING is
			-- Name of feature
		do
			Result := STRING_.make (free_operator_name.count + 9)
			Result.append_string (prefix_double_quote)
			Result.append_string (free_operator_name)
			Result.append_character ('%"')
		end

	free_operator_name: STRING is
			-- Name of free operator
		deferred
		ensure
			free_operator_name_not_void: Result /= Void
			free_operator_name_not_empty: Result.count > 0
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := STRING_.case_insensitive_hash_code (free_operator_name)
		end

feature -- Status report

	is_prefix_free: BOOLEAN is
			-- Is current feature name of the form 'prefix "free-operator"'?
		once
			Result := True
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		local
			op: ET_PREFIX_FREE
		do
			if other = Current then
				Result := True
			elseif other.is_prefix_free then
				op ?= other
				if op /= Void then
					Result := STRING_.same_case_insensitive (free_operator_name, op.free_operator_name)
				end
			end
		end

feature {NONE} -- Constants

	prefix_double_quote: STRING is "prefix %""

end
