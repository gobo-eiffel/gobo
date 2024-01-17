note

	description:

		"Eiffel inline separate instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022-2023, Eric Bezault and others"
	license: "MIT License"

class ET_INLINE_SEPARATE_INSTRUCTION

inherit

	ET_INSTRUCTION
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_arguments: like arguments; a_compound: like compound)
			-- Create a new inline separate instruction.
		do
			arguments := a_arguments
			compound := a_compound
			end_keyword := tokens.end_keyword
		ensure
			arguments_set: arguments = a_arguments
			compound_set: compound = a_compound
		end

feature -- Initialization

	reset
			-- Reset instruction as it was just after it was last parsed.
		do
			arguments.reset
			if attached compound as l_compound then
				l_compound.reset
			end
		end

feature -- Access

	arguments: ET_INLINE_SEPARATE_ARGUMENTS
			-- Separate arguments

	compound: detachable ET_COMPOUND
			-- Instructions

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := arguments.position
			if Result.is_null then
				if attached compound as l_compound then
					Result := l_compound.position
				end
				if Result.is_null then
					Result := end_keyword.position
				end
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := arguments.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

feature -- Setting

	set_end_keyword (an_end: like end_keyword)
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_inline_separate_instruction (Current)
		end

invariant

	end_keyword_not_void: end_keyword /= Void

end
