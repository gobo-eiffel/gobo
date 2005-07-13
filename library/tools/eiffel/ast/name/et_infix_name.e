indexing

	description:

		"Names of Eiffel infix features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_NAME

inherit

	ET_OPERATOR

create

	make_and,
	make_implies,
	make_or,
	make_xor,
	make_div,
	make_divide,
	make_ge,
	make_gt,
	make_le,
	make_lt,
	make_minus,
	make_mod,
	make_plus,
	make_power,
	make_times,
	make_and_then,
	make_or_else

feature {NONE} -- Initialization

	make_and (an_operator: like operator_name) is
			-- Create a new 'infix "and"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_and_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_and: is_infix_and
		end

	make_implies (an_operator: like operator_name) is
			-- Create a new 'infix "implies"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_implies_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_implies: is_infix_implies
		end

	make_or (an_operator: like operator_name) is
			-- Create a new 'infix "or"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_or_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_or: is_infix_or
		end

	make_xor (an_operator: like operator_name) is
			-- Create a new 'infix "xor"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_xor_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_xor: is_infix_xor
		end

	make_div (an_operator: like operator_name) is
			-- Create a new 'infix "//"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_div_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_div: is_infix_div
		end

	make_divide (an_operator: like operator_name) is
			-- Create a new 'infix "/"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_divide_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_divide: is_infix_divide
		end

	make_ge (an_operator: like operator_name) is
			-- Create a new 'infix ">="' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_ge_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_ge: is_infix_ge
		end

	make_gt (an_operator: like operator_name) is
			-- Create a new 'infix ">"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_gt_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_gt: is_infix_gt
		end

	make_le (an_operator: like operator_name) is
			-- Create a new 'infix "<="' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_le_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_le: is_infix_le
		end

	make_lt (an_operator: like operator_name) is
			-- Create a new 'infix "<"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_lt_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_lt: is_infix_lt
		end

	make_minus (an_operator: like operator_name) is
			-- Create a new 'infix "-"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_minus_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_minus: is_infix_minus
		end

	make_mod (an_operator: like operator_name) is
			-- Create a new 'infix "\\"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_mod_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_mod: is_infix_mod
		end

	make_plus (an_operator: like operator_name) is
			-- Create a new 'infix "+"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_plus_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_plus: is_infix_plus
		end

	make_power (an_operator: like operator_name) is
			-- Create a new 'infix "^"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_power_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_power: is_infix_power
		end

	make_times (an_operator: like operator_name) is
			-- Create a new 'infix "*"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_times_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_times: is_infix_times
		end

	make_and_then (an_operator: like operator_name) is
			-- Create a new 'infix "and then"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_and_then_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_and_then: is_infix_and_then
		end

	make_or_else (an_operator: like operator_name) is
			-- Create a new 'infix "or else"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_or_else_code
		ensure
			operator_name_set: operator_name = an_operator
			is_infix_or_else: is_infix_or_else
		end

feature -- Access

	infix_keyword: ET_KEYWORD
			-- Infix keyword

	operator_name: ET_MANIFEST_STRING
			-- Name of infix operator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if not infix_keyword.position.is_null then
				Result := infix_keyword.position
			else
				Result := operator_name.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := infix_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := operator_name
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := operator_name.break
		end

feature -- Setting

	set_infix_keyword (an_infix: like infix_keyword) is
			-- Set `infix_keyword' to `an_infix'.
		require
			an_infix_not_void: an_infix /= Void
		do
			infix_keyword := an_infix
		ensure
			infix_keyword_set: infix_keyword = an_infix
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_infix_name (Current)
		end

feature {NONE} -- Implementation

	code: CHARACTER
			-- Operator code

invariant

	is_infix: is_infix
	infix_keyword_not_void: infix_keyword /= Void
	operator_name_not_void: operator_name /= Void

end
