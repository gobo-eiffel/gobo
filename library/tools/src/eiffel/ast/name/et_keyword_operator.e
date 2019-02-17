note

	description:

		"Eiffel keyword operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_KEYWORD_OPERATOR

inherit

	ET_KEYWORD
		rename
			is_infix as is_infix_keyword,
			is_prefix as is_prefix_keyword,
			is_alias as is_alias_keyword,
			is_local as is_local_keyword
		undefine
			is_precursor
		redefine
			process
		end

	ET_OPERATOR
		undefine
			first_position,
			last_position,
			break
		redefine
			is_infix,
			is_prefix,
			is_infix_and,
			is_infix_implies,
			is_infix_or,
			is_infix_xor,
			is_prefix_not
		end

create

	make_and,
	make_implies,
	make_or,
	make_xor,
	make_not

feature -- Status report

	is_infix: BOOLEAN
			-- Is current feature name of the form 'infix ...'?
		do
			Result := (code >= tokens.min_infix_code and code <= tokens.max_infix_code)
		end

	is_infix_and: BOOLEAN
			-- Is current feature name of the form 'infix "and"'?
		do
			Result := (code = tokens.infix_and_code)
		end

	is_infix_implies: BOOLEAN
			-- Is current feature name of the form 'infix "implies"'?
		do
			Result := (code = tokens.infix_implies_code)
		end

	is_infix_or: BOOLEAN
			-- Is current feature name of the form 'infix "or"'?
		do
			Result := (code = tokens.infix_or_code)
		end

	is_infix_xor: BOOLEAN
			-- Is current feature name of the form 'infix "xor"'?
		do
			Result := (code = tokens.infix_xor_code)
		end

	is_prefix: BOOLEAN
			-- Is current feature name of the form 'prefix ...'?
		do
			Result := (code >= tokens.min_prefix_code and code <= tokens.max_prefix_code)
		end

	is_prefix_not: BOOLEAN
			-- Is current feature name of the form 'prefix "not"'?
		do
			Result := (code = tokens.prefix_not_code)
		end

feature -- Access

	name: STRING
			-- Name of feature call
		do
			inspect code
			when infix_and_code then
				Result := tokens.alias_and_name
			when infix_implies_code then
				Result := tokens.alias_implies_name
			when infix_or_code then
				Result := tokens.alias_or_name
			when infix_xor_code then
				Result := tokens.alias_xor_name
			when prefix_not_code then
				Result := tokens.alias_not_name
			else
					-- Should never happen.
				Result := tokens.unknown_name
			end
		end

	hash_code: INTEGER
			-- Hash code
		do
			Result := code.code
		end

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN
			-- Are `Current' and `other' the same feature call name?
			-- (case insensitive)
		do
			if Current = other then
				Result := True
			else
				inspect code
				when infix_and_code then
					Result := other.is_infix_and
				when infix_implies_code then
					Result := other.is_infix_implies
				when infix_or_code then
					Result := other.is_infix_or
				when infix_xor_code then
					Result := other.is_infix_xor
				when prefix_not_code then
					Result := other.is_prefix_not
				else
					-- Result := False
				end
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_keyword_operator (Current)
		end

end
