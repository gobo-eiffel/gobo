indexing

	description:

		"Eiffel qualified typed create instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_TYPED_CREATE_INSTRUCTION

inherit

	ET_QUALIFIED_TYPED_CREATION_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_create: like create_keyword; l: like left_brace; a_type: like type;
		r: like right_brace; a_target: like target; a_dot: like dot;
		a_name: like procedure_name; args: like arguments) is
			-- Create a new qualified typed create instruction.
		require
			a_create_not_void: a_create /= Void
			l_not_void: l /= Void
			a_type_not_void: a_type /= Void
			r_not_void: r /= Void
			a_target_not_void: a_target /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			create_keyword := a_create
			left_brace := l
			type := a_type
			right_brace := r
			target := a_target
			dot := a_dot
			procedure_name := a_name
			arguments := args
		ensure
			create_keyword_set: create_keyword = a_create
			left_brace_set: left_brace = l
			type_set: type = a_type
			right_brace_set: right_brace = r
			target_set: target = a_target
			dot_set: dot = a_dot
			procedure_name_set: procedure_name = a_name
			arguments_set: arguments = args
		end

feature -- Access

	create_keyword: ET_TOKEN
			-- 'create' keyword

	left_brace: ET_SYMBOL
	right_brace: ET_SYMBOL
			-- Braces surrounding type

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := create_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if arguments /= Void then
				Result := arguments.break
			else
				Result := procedure_name.break
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_qualified_typed_create_instruction (Current)
		end

invariant

	create_keyword_not_void: create_keyword /= Void
	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void

end
