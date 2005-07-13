indexing

	description:

		"Names of Eiffel infix 'free-operator' features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_FREE_NAME

inherit

	ET_INFIX_FREE

	ET_INFIX_NAME
		undefine
			name, lower_name, hash_code, same_feature_name
		redefine
			process
		end

create

	make

feature {NONE} -- Initialization

	make (an_operator: like operator_name) is
			-- Create a new 'infix "<free-operator>"' feature name.
		require
			an_operator_not_void: an_operator /= Void
			an_operator_not_empty: an_operator.value.count > 0
		do
			infix_keyword := tokens.infix_keyword
			operator_name := an_operator
			code := tokens.infix_freeop_code
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
			a_processor.process_infix_free_name (Current)
		end

invariant

	is_infix_freeop: is_infix_freeop
	operator_name_not_empty: operator_name.value.count > 0

end
