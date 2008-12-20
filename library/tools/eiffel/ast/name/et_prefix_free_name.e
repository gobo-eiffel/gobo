indexing

	description:

		"Names of Eiffel prefix 'free-operator' features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_FREE_NAME

inherit

	ET_PREFIX_NAME
		undefine
			alias_name, alias_lower_name,
			name, lower_name, hash_code, same_call_name,
			process, same_alias_name,
			is_prefix_freeop,
			is_prefix_minus,
			is_prefix_plus,
			is_prefix_not
		end

	ET_ALIAS_FREE_NAME
		rename
			make_prefix as make,
			make_plus as make_infix_plus,
			make_minus as make_infix_minus,
			alias_keyword as prefix_keyword,
			set_alias_keyword as set_prefix_keyword,
			alias_string as operator_name
		undefine
			set_infix, set_prefix,
			is_infixable, is_prefixable,
			is_infix_freeop,
			default_keyword,
			is_bracket,
			is_infix,
			is_infix_and,
			is_infix_and_then,
			is_infix_div,
			is_infix_divide,
			is_infix_ge,
			is_infix_gt,
			is_infix_implies,
			is_infix_le,
			is_infix_lt,
			is_infix_minus,
			is_infix_mod,
			is_infix_or,
			is_infix_or_else,
			is_infix_plus,
			is_infix_power,
			is_infix_times,
			is_infix_xor,
			is_infix_dotdot,
			is_prefix,
			is_feature_name,
			feature_name
		redefine
			is_prefix_freeop,
			name, process
		end

create

	make

feature -- Status report

	is_prefix_freeop: BOOLEAN is True
			-- Is current feature name of the form 'prefix "free-operator"'?

feature -- Access

	name: STRING is
			-- Name of feature
		do
			create Result.make (free_operator_name.count + 9)
			Result.append_string (prefix_double_quote)
			Result.append_string (free_operator_name)
			Result.append_character ('%"')
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_prefix_free_name (Current)
		end

feature {NONE} -- Constants

	prefix_double_quote: STRING is "prefix %""

invariant

	is_prefix_freeop: is_prefix_freeop

end
