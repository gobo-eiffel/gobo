note

	description:

		"Eiffel identifiers followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_IDENTIFIER_COMMA

inherit

	ET_LOCAL_NAME
		redefine
			reset,
			is_instance_free
		end

	ET_ARGUMENT_NAME
		redefine
			reset,
			is_instance_free
		end

	ET_OBJECT_TEST_LOCAL_NAME
		redefine
			reset,
			is_instance_free
		end

	ET_LABEL

create

	make

feature {NONE} -- Initialization

	make (a_name: like identifier; a_comma: like comma)
			-- Create a new identifier-comma.
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			identifier := a_name
			comma := a_comma
		ensure
			identifier_set: identifier = a_name
			comma_set: comma = a_comma
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			precursor
			identifier.reset
		end

feature -- Access

	identifier: ET_IDENTIFIER
			-- Identifier

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := identifier.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := identifier
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := comma
		end

feature -- Status report

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := identifier.is_instance_free
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_identifier_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
