indexing

	description:

		"Eiffel AST printers where !! instructions are replaced by create keywords"

	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class CREATE_PRINTER

inherit

	ET_AST_PRINTER
		redefine
			process_bang_instruction
		end

create

	make, make_null

feature -- Processing

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			a_type: ET_TYPE
			a_call: ET_QUALIFIED_CALL
			a_break: ET_BREAK
		do
			file.put_string ("create")
			a_type := an_instruction.type
			if a_type /= Void then
				file.put_string (" {")
				a_break := an_instruction.left_bang.break
				if a_break /= Void then
					process_break (a_break)
				end
				a_type.process (Current)
				file.put_character ('}')
			else
				a_break := an_instruction.left_bang.break
				if a_break /= Void then
					process_break (a_break)
				end
			end
			a_break := an_instruction.right_bang.break
			if a_break /= Void then
				process_break (a_break)
			else
				file.put_character (' ')
			end
			an_instruction.target.process (Current)
			a_call := an_instruction.creation_call
			if a_call /= Void then
				a_call.process (Current)
			end
		end

end
