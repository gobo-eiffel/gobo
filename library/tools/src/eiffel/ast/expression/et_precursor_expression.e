note

	description:

		"Eiffel precursor expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

class ET_PRECURSOR_EXPRESSION

inherit

	ET_PRECURSOR_CALL
		redefine
			reset,
			parenthesis_call
		end

	ET_CALL_EXPRESSION_WITH_ACTUAL_ARGUMENT_LIST
		rename
			name as precursor_keyword
		undefine
			reset,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		redefine
			is_instance_free
		end

create

	make

feature -- Initialization

	reset
			-- Reset precursor as it was when it was last parsed.
		do
			precursor {ET_CALL_EXPRESSION_WITH_ACTUAL_ARGUMENT_LIST}
			precursor {ET_PRECURSOR_CALL}
		end

feature -- Access

	parenthesis_call: detachable ET_PARENTHESIS_EXPRESSION
			-- <Precursor>

feature -- Status report

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := False
		end

feature -- Setting

	set_parenthesis_call (a_target: ET_EXPRESSION; a_name: ET_PARENTHESIS_SYMBOL; a_arguments: ET_ACTUAL_ARGUMENT_LIST)
			-- <Precursor>
		do
			create parenthesis_call.make (a_target, a_name, a_arguments)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_precursor_expression (Current)
		end

end
