indexing

	description:

		"Names of Eiffel prefix 'free-operator' features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_FREE_NAME

inherit

	ET_PREFIX_FREE

	ET_PREFIX_NAME
		undefine
			name, lower_name, hash_code, same_feature_name
		redefine
			process
		end

create

	make

feature {NONE} -- Initialization

	make (an_operator: like operator_name) is
			-- Create a new 'prefix "<free-operator>"' feature name.
		require
			an_operator_not_void: an_operator /= Void
			an_operator_not_empty: an_operator.value.count > 0
		do
			prefix_keyword := tokens.prefix_keyword
			operator_name := an_operator
			code := tokens.prefix_freeop_code
			hash_code := STRING_.case_insensitive_hash_code (free_operator_name)
		ensure
			operator_name_set: operator_name = an_operator
		end

feature -- Access

	free_operator_name: STRING is
			-- Name of free operator
		do
			Result := operator_name.value
		end

	hash_code: INTEGER
			-- Hash code value

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_prefix_free_name (Current)
		end

invariant

	is_prefix_freeop: is_prefix_freeop
	operator_name_not_empty: operator_name.value.count > 0

end
