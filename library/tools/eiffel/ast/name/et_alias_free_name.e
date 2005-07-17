indexing

	description:

		"Eiffel alias 'free-operator' feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ALIAS_FREE_NAME

inherit

	ET_ALIAS_NAME
		undefine
			lower_name
		redefine
			name, hash_code, process,
			is_prefixable, is_infixable,
			set_prefix, set_infix,
			same_feature_name, same_alias_name
		end

	ET_INFIX_FREE
		undefine
			name, same_feature_name, is_alias
		end

	ET_PREFIX_FREE
		undefine
			name, lower_name, same_feature_name, is_alias
		end

create

	make_infix, make_prefix

feature {NONE} -- Initialization

	make_infix (a_string: like alias_string) is
			-- Create a new infix 'alias "<free-operator>"' feature name.
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: a_string.value.count > 0
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_freeop_code
			hash_code := STRING_.case_insensitive_hash_code (free_operator_name)
		ensure
			alias_string_set: alias_string = a_string
			is_infix_freeop: is_infix_freeop
		end

	make_prefix (a_string: like alias_string) is
			-- Create a new prefix 'alias "<free-operator>"' feature name.
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: a_string.value.count > 0
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.prefix_freeop_code
			hash_code := STRING_.case_insensitive_hash_code (free_operator_name)
		ensure
			alias_string_set: alias_string = a_string
			is_prefix_freeop: is_prefix_freeop
		end

feature -- Status report

	is_prefixable: BOOLEAN is
			-- Can current alias be used as the name of a prefix feature?
		do
			Result := True
		end

	is_infixable: BOOLEAN is
			-- Can current alias be used as the name of an infix feature?
		do
			Result := True
		end

feature -- Access

	name: STRING is
			-- Name of feature
		do
			create Result.make (free_operator_name.count + 8)
			Result.append_string (alias_double_quote)
			Result.append_string (free_operator_name)
			Result.append_character ('%"')
		end

	free_operator_name: STRING is
			-- Name of free operator
		do
			Result := alias_string.value
		end

	hash_code: INTEGER
			-- Hash code value

feature -- Status setting

	set_infix is
			-- Set `is_infix_freeop'.
		do
			code := tokens.infix_freeop_code
		ensure then
			is_infix_freeop: is_infix_freeop
		end

	set_prefix is
			-- Set `is_prefix_freeop'.
		do
			code := tokens.prefix_freeop_code
		ensure then
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

	same_alias_name (other: ET_ALIAS_NAME): BOOLEAN is
			-- Are `Current' and `other' the same alias name?
			-- Do not take "infix" and "prefix" properties into account.
		local
			l_freeop: ET_ALIAS_FREE_NAME
		do
			if other = Current then
				Result := True
			else
				l_freeop ?= other
				if l_freeop /= Void then
					if hash_code = l_freeop.hash_code then
						if l_freeop.free_operator_name = free_operator_name then
							Result := True
						else
							Result := STRING_.same_case_insensitive (free_operator_name, l_freeop.free_operator_name)
						end
					end
				end
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_alias_free_name (Current)
		end

feature {NONE} -- Constants

	alias_double_quote: STRING is "alias %""

invariant

	alias_string_not_empty: alias_string.value.count > 0
	is_freeop: is_infix_freeop or is_prefix_freeop

end
