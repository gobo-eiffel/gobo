indexing

	description:

		"Eiffel create instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CREATE_INSTRUCTION

inherit

	ET_CREATION_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_create: like create_keyword; a_target: like target) is
			-- Create a new create instruction.
		require
			a_create_not_void: a_create /= Void
			a_target_not_void: a_target /= Void
		do
			create_keyword := a_create
			target := a_target
		ensure
			create_keyword_set: create_keyword = a_create
			target_set: target = a_target
		end

feature -- Access

	create_keyword: ET_KEYWORD
			-- 'create' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := create_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := target.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_create_instruction (Current)
		end

invariant

	create_keyword_not_void: create_keyword /= Void

end
