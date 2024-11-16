note

	description:

		"Eiffel manifest tuples"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_MANIFEST_TUPLE

inherit

	ET_EXPRESSION
		undefine
			is_instance_free,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		redefine
			reset,
			is_never_void
		end

	ET_EXPRESSION_LIST
		redefine
			make,
			make_with_capacity,
			reset
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new empty manifest tuple.
		do
			left_symbol := tokens.left_bracket_symbol
			right_symbol := tokens.right_bracket_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty manifest tuple with capacity `nb'.
		do
			left_symbol := tokens.left_bracket_symbol
			right_symbol := tokens.right_bracket_symbol
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset expressions as they were when they were last parsed.
		do
			precursor {ET_EXPRESSION}
			precursor {ET_EXPRESSION_LIST}
		end

feature -- Status report

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_manifest_tuple (Current)
		end

end
