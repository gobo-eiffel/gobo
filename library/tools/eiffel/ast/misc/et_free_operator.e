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

	ET_INFIX_FREE_OPERATOR
		redefine
			make, make_with_position,
			name, is_prefix, is_infix,
			is_prefix_free, is_infix_free,
			same_feature_name, process
		end

	ET_PREFIX_FREE_OPERATOR
		undefine
			make, make_with_position,
			name, is_prefix, is_infix,
			is_prefix_free, is_infix_free,
			same_feature_name, hash_code,
			process
		end

creation

	make, make_with_position

feature {NONE} -- Initialization

	make (a_free_op: like free_operator_name) is
			-- Create a new free operator.
		do
			precursor (a_free_op)
		ensure then
			is_prefix: is_prefix
		end

	make_with_position (a_free_op: like free_operator_name; a_line, a_column: INTEGER) is
			-- Create a new free operator at given position.
		do
			precursor (a_free_op, a_line, a_column)
		ensure then
			is_prefix: is_prefix
		end

feature -- Access

	name: STRING is
			-- Name of feature
		do
			if is_infix then
				Result := STRING_.make (free_operator_name.count + 8)
				Result.append_string (infix_double_quote)
			else
				Result := STRING_.make (free_operator_name.count + 9)
				Result.append_string (prefix_double_quote)
			end
			Result.append_string (free_operator_name)
			Result.append_character ('%"')
		end

feature -- Status report

	is_infix: BOOLEAN
			-- Is current feature name of the form 'infix ...'?

	is_infix_free: BOOLEAN is
			-- Is current feature name of the form 'infix "free-operator"'?
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

	is_prefix_free: BOOLEAN is
			-- Is current feature name of the form 'prefix "free-operator"'?
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
			is_infix_free: is_infix_free
		end

	set_prefix is
			-- Set `is_prefix' to True.
		do
			is_infix := False
		ensure
			is_prefix: is_prefix
			is_prefix_free: is_prefix_free
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		local
			an_infix_op: ET_INFIX_FREE
			a_prefix_op: ET_INFIX_FREE
		do
			if other = Current then
				Result := True
			elseif is_infix then
				if other.is_infix_free then
					an_infix_op ?= other
					if an_infix_op /= Void then
						Result := STRING_.same_case_insensitive (free_operator_name, an_infix_op.free_operator_name)
					end
				end
			else
				if other.is_prefix_free then
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

end
