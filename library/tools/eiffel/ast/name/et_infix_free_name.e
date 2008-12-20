indexing

	description:

		"Names of Eiffel infix 'free-operator' features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_FREE_NAME

inherit

	ET_INFIX_NAME
		undefine
			alias_name, alias_lower_name,
			name, lower_name, hash_code, same_call_name,
			process, same_alias_name,
			is_infix_freeop,
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
			is_infix_dotdot
		end

	ET_ALIAS_FREE_NAME
		rename
			make_infix as make,
			alias_keyword as infix_keyword,
			set_alias_keyword as set_infix_keyword,
			alias_string as operator_name
		undefine
			set_infix, set_prefix,
			is_infixable, is_prefixable,
			is_prefix_freeop,
			default_keyword,
			is_bracket,
			is_infix,
			is_prefix,
			is_prefix_minus,
			is_prefix_plus,
			is_prefix_not,
			is_feature_name,
			feature_name
		redefine
			name, process,
			is_infix_freeop
		end

create

	make

feature -- Status report

	is_infix_freeop: BOOLEAN is True
			-- Is current feature name of the form 'infix "free-operator"'?

feature -- Access

	name: STRING is
			-- Name of feature
		do
			create Result.make (free_operator_name.count + 8)
			Result.append_string (infix_double_quote)
			Result.append_string (free_operator_name)
			Result.append_character ('%"')
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_infix_free_name (Current)
		end

feature {NONE} -- Constants

	infix_double_quote: STRING is "infix %""

invariant

	is_infix_freeop: is_infix_freeop

end
