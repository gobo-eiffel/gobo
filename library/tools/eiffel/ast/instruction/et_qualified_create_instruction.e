indexing

	description:

		"Eiffel qualified create instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_CREATE_INSTRUCTION

inherit

	ET_QUALIFIED_CREATION_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_create: like create_keyword; a_target: like target; a_dot: like dot;
		a_name: like procedure_name; args: like arguments) is
			-- Create a new qualified create instruction.
		require
			a_create_not_void: a_create /= Void
			a_target_not_void: a_target /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			create_keyword := a_create
			target := a_target
			dot := a_dot
			procedure_name := a_name
			arguments := args
		ensure
			create_keyword_set: create_keyword = a_create
			target_set: target = a_target
			dot_set: dot = a_dot
			procedure_name_set: procedure_name = a_name
			arguments_set: arguments = args
		end

feature -- Access

	create_keyword: ET_TOKEN
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
			if arguments /= Void then
				Result := arguments.break
			else
				Result := procedure_name.break
			end
		end

invariant

	create_keyword_not_void: create_keyword /= Void

end
