indexing

	description:

		"Eiffel create instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CREATE_INSTRUCTION

inherit

	ET_CREATION_INSTRUCTION

create

	make

feature {NONE} -- Initialization

	make (a_type: like creation_type; a_target: like target; a_call: like creation_call) is
			-- Create a new create instruction.
		require
			a_target_not_void: a_target /= Void
		do
			creation_type := a_type
			target := a_target
			creation_call := a_call
			create_keyword := tokens.create_keyword
		ensure
			creation_type_set: creation_type = a_type
			target_set: target = a_target
			creation_call_set: creation_call = a_call
		end

feature -- Access

	create_keyword: ET_KEYWORD
			-- 'create' keyword

	creation_type: ET_TARGET_TYPE
			-- Creation type surrounded by braces

	type: ET_TYPE is
			-- Creation type
		do
			if creation_type /= Void then
				Result := creation_type.type
			end
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if not create_keyword.position.is_null then
				Result := create_keyword.position
			elseif creation_type /= Void then
				Result := creation_type.position
			else
				Result := target.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := create_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if creation_call /= Void then
				Result := creation_call.last_leaf
			else
				Result := target.last_leaf
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if creation_call /= Void then
				Result := creation_call.break
			else
				Result := target.break
			end
		end

feature -- Setting

	set_create_keyword (a_create: like create_keyword) is
			-- Set `create_keyword' to `a_create'.
		require
			a_create_not_void: a_create /= Void
		do
			create_keyword := a_create
		ensure
			create_keyword_set: create_keyword = a_create
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_create_instruction (Current)
		end

invariant

	crete_keyword_not_void: create_keyword /= Void

end
