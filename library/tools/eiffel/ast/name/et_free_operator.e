indexing

	description:

		"Eiffel free operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FREE_OPERATOR

inherit

	ET_INFIX_FREE
		redefine
			name, same_feature_name
		end

	ET_PREFIX_FREE
		undefine
			name, same_feature_name, hash_code
		end

	ET_TOKEN
		rename
			make as make_token,
			text as free_operator_name
		redefine
			process
		end

creation

	make_infix,
	make_prefix

feature {NONE} -- Initialization

	make_infix (a_free_op: like free_operator_name) is
			-- Create a new infix free operator.
		do
			code := tokens.infix_freeop_code
			make_token (a_free_op)
		ensure
			is_infix_freeop: is_infix_freeop
		end

	make_prefix (a_free_op: like free_operator_name) is
			-- Create a new prefix free operator.
		do
			code := tokens.prefix_freeop_code
			make_token (a_free_op)
		ensure
			is_prefix_freeop: is_prefix_freeop
		end

feature -- Access

	name: STRING is
			-- Name of feature
		do
			if is_infix_freeop then
				Result := STRING_.make (free_operator_name.count + 8)
				Result.append_string (infix_double_quote)
			else
				Result := STRING_.make (free_operator_name.count + 9)
				Result.append_string (prefix_double_quote)
			end
			Result.append_string (free_operator_name)
			Result.append_character ('%"')
		end

feature -- Status setting

	set_infix is
			-- Set `is_infix_freeop'.
		do
			code := tokens.infix_freeop_code
		ensure
			is_infix_freeop: is_infix_freeop
		end

	set_prefix is
			-- Set `is_prefix_freeop'.
		do
			code := tokens.prefix_freeop_code
		ensure
			is_prefix_freeop: is_prefix_freeop
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		local
			an_infix_op: ET_INFIX_FREE
			a_prefix_op: ET_PREFIX_FREE
		do
			if other = Current then
				Result := True
			elseif is_infix_freeop then
				if other.is_infix_freeop then
					an_infix_op ?= other
					if an_infix_op /= Void then
						Result := STRING_.same_case_insensitive (free_operator_name, an_infix_op.free_operator_name)
					end
				end
			else
				if other.is_prefix_freeop then
					a_prefix_op ?= other
					if a_prefix_op /= Void then
						Result := STRING_.same_case_insensitive (free_operator_name, a_prefix_op.free_operator_name)
					end
				end
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_free_operator (Current)
		end

feature {NONE} -- Implementation

	code: CHARACTER
			-- Operator code

invariant

	is_freeop: is_infix_freeop or is_prefix_freeop

end
