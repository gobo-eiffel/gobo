indexing

	description:

		"Names of Eiffel prefix features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_NAME

inherit

	ET_OPERATOR

create

	make_minus,
	make_plus,
	make_not

feature {NONE} -- Initialization

	make_minus (an_operator: like operator_name) is
			-- Create a new 'prefix "-"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			prefix_keyword := tokens.prefix_keyword
			operator_name := an_operator
			code := tokens.prefix_minus_code
		ensure
			operator_name_set: operator_name = an_operator
			is_prefix_minus: is_prefix_minus
		end

	make_plus (an_operator: like operator_name) is
			-- Create a new 'prefix "+"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			prefix_keyword := tokens.prefix_keyword
			operator_name := an_operator
			code := tokens.prefix_plus_code
		ensure
			operator_name_set: operator_name = an_operator
			is_prefix_plus: is_prefix_plus
		end

	make_not (an_operator: like operator_name) is
			-- Create a new 'prefix "not"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			prefix_keyword := tokens.prefix_keyword
			operator_name := an_operator
			code := tokens.prefix_not_code
		ensure
			operator_name_set: operator_name = an_operator
			is_prefix_not: is_prefix_not
		end

feature -- Access

	prefix_keyword: ET_KEYWORD
			-- Prefix keyword

	operator_name: ET_MANIFEST_STRING
			-- Name of prefix operator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if not prefix_keyword.position.is_null then
				Result := prefix_keyword.position
			else
				Result := operator_name.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := prefix_keyword
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

	set_prefix_keyword (a_prefix: like prefix_keyword) is
			-- Set `prefix_keyword' to `a_prefix'.
		require
			a_prefix_not_void: a_prefix /= Void
		do
			prefix_keyword := a_prefix
		ensure
			prefix_keyword_set: prefix_keyword = a_prefix
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_prefix_name (Current)
		end

feature {NONE} -- Implementation

	code: CHARACTER
			-- Operator code

invariant

	is_prefix: is_prefix
	prefix_keyword_not_void: prefix_keyword /= Void
	operator_name_not_void: operator_name /= Void

end
