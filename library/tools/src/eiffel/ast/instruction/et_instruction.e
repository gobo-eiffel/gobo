note

	description:

		"Eiffel instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_INSTRUCTION

inherit

	ET_AST_NODE

feature -- Initialization

	reset
			-- Reset instruction as it was just after it was last parsed.
		do
		end

feature -- Status report

	is_semicolon: BOOLEAN
			-- Is current node a semicolon?
		do
			-- Result := False
		end

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			-- Result := False
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			-- Result := False
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			-- Result := False
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			-- Result := False
		end

	has_inline_separate_instruction: BOOLEAN
			-- Does an inline separate instruction appear in current instruction or
			-- (recursively) in one of its subinstructions?
		do
			-- Result := False
		end

feature -- Measurement

	nested_instruction_count: INTEGER
			-- Number of instructions contained in current instruction and
			-- (recursively) in its subinstructions?
		do
			Result := 1
		end

end
