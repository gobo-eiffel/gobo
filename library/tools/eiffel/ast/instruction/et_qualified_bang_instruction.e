indexing

	description:

		"Eiffel qualified bang creation instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_BANG_INSTRUCTION

inherit

	ET_QUALIFIED_CREATION_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_bangbang: like bangbang; a_target: like target; a_dot: like dot;
		a_name: like procedure_name; args: like arguments) is
			-- Create a new qualified bang creation instruction.
		require
			a_bangbang_not_void: a_bangbang /= Void
			a_target_not_void: a_target /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			bangbang := a_bangbang
			target := a_target
			dot := a_dot
			procedure_name := a_name
			arguments := args
		ensure
			bangbang_set: bangbang = a_bangbang
			target_set: target = a_target
			dot_set: dot = a_dot
			procedure_name_set: procedure_name = a_name
			arguments_set: arguments = args
		end

feature -- Access

	bangbang: ET_SYMBOL
			-- '!!' symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := bangbang.position
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

	bangbang_not_void: bangbang /= Void

end
