indexing

	description:

		"Eiffel infix 'free-operator' feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_INFIX_FREE

inherit

	ET_INFIX
		redefine
			is_infix_free
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal
		end

feature -- Access

	name: STRING is
			-- Name of feature
		do
			Result := STRING_.make (free_operator_name.count + 8)
			Result.append_string (infix_double_quote)
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

	is_infix_free: BOOLEAN is
			-- Is current feature name of the form 'infix "free-operator"'?
		once
			Result := True
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		local
			op: ET_INFIX_FREE
		do
			if other = Current then
				Result := True
			elseif other.is_infix_free then
				op ?= other
				if op /= Void then
					Result := STRING_.same_case_insensitive (free_operator_name, op.free_operator_name)
				end
			end
		end

feature {NONE} -- Constants

	infix_double_quote: STRING is "infix %""

end -- class ET_INFIX_FREE
