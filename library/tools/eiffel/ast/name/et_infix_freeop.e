indexing

	description:

		"Eiffel infix 'free-operator' feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INFIX_FREEOP

inherit

	ET_INFIX_NAME
		rename
			make as make_infix_name
		redefine
			same_feature_name
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_position: like position) is
			-- Create a new infix free-operator feature name.
		require
			a_name_not_void: a_name /= Void
			a_position_not_void: a_position /= Void
		do
			operator_name := a_name
			position := a_position
			name := STRING_.make (operator_name.count + 8)
			name.append_string (infix_double_quote)
			name.append_string (operator_name)
			name.append_character (double_quote)
			hash_code := STRING_.case_insensitive_hash_code (a_name)
		ensure
			operator_name_set: operator_name = a_name
			position_set: position = a_position
		end

feature -- Access

	name: STRING
			-- Name of feature

	operator_name: STRING
			-- Name of free-operator

	hash_code: INTEGER
			-- Hash code value

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		local
			op: ET_INFIX_FREEOP
		do
			if other = Current then
				Result := True
			elseif same_type (other) then
				op ?= other
				Result := STRING_.same_case_insensitive (operator_name, op.operator_name)
			end
		end

feature {NONE} -- Constants

	infix_double_quote: STRING is "infix %""
	double_quote: CHARACTER is '%"'

invariant

	operator_name_not_void: operator_name /= Void

end -- class ET_INFIX_FREEOP
