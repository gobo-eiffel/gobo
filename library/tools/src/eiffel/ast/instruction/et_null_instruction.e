note

	description:

		"Eiffel null instructions (see ETL2 p.234). %
		%Used as place-holder in the AST for semicolons."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_NULL_INSTRUCTION

inherit

	ET_INSTRUCTION
		redefine
			nested_instruction_count
		end

feature -- Measurement

	nested_instruction_count: INTEGER
			-- Number of instructions contained in current instruction and
			-- (recursively) in its subinstructions?
		do
			Result := 0
		end

end
