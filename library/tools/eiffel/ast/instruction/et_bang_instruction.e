indexing

	description:

		"Eiffel bang creation instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_BANG_INSTRUCTION

inherit

	ET_CREATION_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_bangbang: like bangbang; a_target: like target) is
			-- Create a new bang creation instruction.
		require
			a_bangbang_not_void: a_bangbang /= Void
			a_target_not_void: a_target /= Void
		do
			bangbang := a_bangbang
			target := a_target
		ensure
			bangbang_set: bangbang = a_bangbang
			target_set: target = a_target
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
			Result := target.break
		end

invariant

	bangbang_not_void: bangbang /= Void

end
