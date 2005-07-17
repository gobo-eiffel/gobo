indexing

	description:

		"Eiffel free operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FREE_OPERATOR

inherit

	ET_INFIX_FREE
		undefine
			first_position, last_position
		redefine
			name, same_feature_name
		end

	ET_PREFIX_FREE
		undefine
			first_position, last_position,
			name, lower_name, same_feature_name
		end

	ET_TOKEN
		rename
			make as make_token,
			text as free_operator_name
		end

create

	make_infix,
	make_prefix

feature {NONE} -- Initialization

	make_infix (a_free_op: like free_operator_name) is
			-- Create a new infix free operator.
		do
			code := tokens.infix_freeop_code
			make_token (a_free_op)
			hash_code := STRING_.case_insensitive_hash_code (a_free_op)
		ensure
			is_infix_freeop: is_infix_freeop
		end

	make_prefix (a_free_op: like free_operator_name) is
			-- Create a new prefix free operator.
		do
			code := tokens.prefix_freeop_code
			make_token (a_free_op)
			hash_code := STRING_.case_insensitive_hash_code (a_free_op)
		ensure
			is_prefix_freeop: is_prefix_freeop
		end

feature -- Access

	name: STRING is
			-- Name of feature
		do
			if is_infix_freeop then
				create Result.make (free_operator_name.count + 8)
				Result.append_string (infix_double_quote)
			else
				create Result.make (free_operator_name.count + 9)
				Result.append_string (prefix_double_quote)
			end
			Result.append_string (free_operator_name)
			Result.append_character ('%"')
		end

	hash_code: INTEGER
			-- Hash code value

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
				an_infix_op ?= other
				if an_infix_op /= Void and then an_infix_op.is_infix_freeop then
					if hash_code = an_infix_op.hash_code then
						if an_infix_op.free_operator_name = free_operator_name then
							Result := True
						else
							Result := STRING_.same_case_insensitive (free_operator_name, an_infix_op.free_operator_name)
						end
					end
				end
			else
				a_prefix_op ?= other
				if a_prefix_op /= Void and then a_prefix_op.is_prefix_freeop then
					if hash_code = a_prefix_op.hash_code then
						if a_prefix_op.free_operator_name = free_operator_name then
							Result := True
						else
							Result := STRING_.same_case_insensitive (free_operator_name, a_prefix_op.free_operator_name)
						end
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
