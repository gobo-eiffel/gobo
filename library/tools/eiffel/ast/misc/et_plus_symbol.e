indexing

	description:

		"Eiffel '+' symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PLUS_SYMBOL

inherit

	ET_INFIX_PLUS_OPERATOR
		redefine
			make, make_with_position,
			name, is_prefix, is_infix,
			is_prefix_plus, is_infix_plus,
			same_feature_name, hash_code
		end

	ET_PREFIX_PLUS_OPERATOR
		undefine
			make, make_with_position,
			name, is_prefix, is_infix,
			is_prefix_plus, is_infix_plus,
			same_feature_name, hash_code
		end

	ET_SIGN_SYMBOL
		undefine
			make, make_with_position
		end

creation

	make, make_with_position

feature {NONE} -- Initialization

	make is
			-- Create a new plus symbol.
		do
			precursor
		ensure then
			is_prefix: is_prefix
		end

	make_with_position (a_line, a_column: INTEGER) is
			-- Create a new plus symbol at given position.
		do
			precursor (a_line, a_column)
		ensure then
			is_prefix: is_prefix
		end

feature -- Access

	name: STRING is
			-- Name of feature
		do
			if is_infix then
				Result := infix_name
			else
				Result := prefix_name
			end
		end

	hash_code: INTEGER is
			-- Hash code
		do
			if is_infix then
				Result := 15
			else
				Result := 22
			end
		end

feature -- Status report

	is_negative: BOOLEAN is False
			-- Is symbol negative?

	is_infix: BOOLEAN
			-- Is current feature name of the form 'infix ...'?

	is_infix_plus: BOOLEAN is
			-- Is current feature name of the form 'infix "+"'?
		do
			Result := is_infix
		ensure then
			definition: Result = is_infix
		end

	is_prefix: BOOLEAN is
			-- Is current feature name of the form 'prefix ...'?
		do
			Result := not is_infix
		ensure then
			definition: Result = not is_infix
		end

	is_prefix_plus: BOOLEAN is
			-- Is current feature name of the form 'prefix "+"'?
		do
			Result := is_prefix
		ensure then
			definition: Result = is_prefix
		end

feature -- Status setting

	set_infix is
			-- Set `is_infix' to True.
		do
			is_infix := True
		ensure
			is_infix: is_infix
			is_infix_plus: is_infix_plus
		end

	set_prefix is
			-- Set `is_prefix' to True.
		do
			is_infix := False
		ensure
			is_prefix: is_prefix
			is_prefix_plus: is_prefix_plus
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		do
			if is_infix then
				Result := other.is_infix_plus
			else
				Result := other.is_prefix_plus
			end
		end

end -- class ET_PLUS_SYMBOL
