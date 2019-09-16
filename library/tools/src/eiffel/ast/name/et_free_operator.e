note

	description:

		"Eiffel free operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FREE_OPERATOR

inherit

	ET_OPERATOR
		undefine
			lower_name,
			is_infix_freeop,
			is_prefix_freeop,
			is_infix, is_prefix,
			first_position,
			last_position,
			break
		end

	ET_FREE_NAME
		undefine
			first_position,
			last_position,
			break
		redefine
			is_infix_freeop,
			is_prefix_freeop,
			is_infix, is_prefix
		end

	ET_TOKEN
		rename
			make as make_token,
			text as operator_name
		end

create

	make_infix,
	make_prefix

feature {NONE} -- Initialization

	make_infix (a_free_op: like operator_name)
			-- Create a new infix free operator.
		require
			a_free_op_not_void: a_free_op /= Void
			a_free_op_not_empty: a_free_op.count > 0
			a_free_op_is_string_8: a_free_op.same_type ({STRING_8} "")
			valid_utf8_free_op: {UC_UTF8_ROUTINES}.valid_utf8 (a_free_op)
		do
			code := tokens.infix_freeop_code
			make_token (a_free_op)
			hash_code := STRING_.case_insensitive_hash_code (a_free_op)
		ensure
			is_infix_freeop: is_infix_freeop
		end

	make_prefix (a_free_op: like operator_name)
			-- Create a new prefix free operator.
		require
			a_free_op_not_void: a_free_op /= Void
			a_free_op_not_empty: a_free_op.count > 0
			a_free_op_is_string_8: a_free_op.same_type ({STRING_8} "")
			valid_utf8_free_op: {UC_UTF8_ROUTINES}.valid_utf8 (a_free_op)
		do
			code := tokens.prefix_freeop_code
			make_token (a_free_op)
			hash_code := STRING_.case_insensitive_hash_code (a_free_op)
		ensure
			is_prefix_freeop: is_prefix_freeop
		end

feature -- Status report

	is_prefix: BOOLEAN
			-- Is current feature name of the form 'prefix ...'?
		do
			Result := (code = tokens.prefix_freeop_code)
		end

	is_infix: BOOLEAN
			-- Is current feature name of the form 'infix ...'?
		do
			Result := (code = tokens.infix_freeop_code)
		end

	is_prefix_freeop: BOOLEAN
			-- Is current feature name of the form 'prefix "free-operator"'?
		do
			Result := (code = tokens.prefix_freeop_code)
		end

	is_infix_freeop: BOOLEAN
			-- Is current feature name of the form 'infix "free-operator"'?
		do
			Result := (code = tokens.infix_freeop_code)
		end

feature -- Access

	name: STRING_8
			-- Name of feature
			-- (using UTF-8 encoding)
		do
			create Result.make (operator_name.count + 8)
			Result.append_string (alias_double_quote)
			Result.append_string (operator_name)
			Result.append_character ('%"')
		end

feature -- Status setting

	set_infix
			-- Set `is_infix_freeop'.
		do
			code := tokens.infix_freeop_code
		ensure
			is_infix_freeop: is_infix_freeop
		end

	set_prefix
			-- Set `is_prefix_freeop'.
		do
			code := tokens.prefix_freeop_code
		ensure
			is_prefix_freeop: is_prefix_freeop
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_free_operator (Current)
		end

feature {NONE} -- Implementation

	code: CHARACTER
			-- Operator code

feature {NONE} -- Constants

	alias_double_quote: STRING = "alias %""

end
