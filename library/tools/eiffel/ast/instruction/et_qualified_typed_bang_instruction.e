indexing

	description:

		"Eiffel qualified typed bang creation instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_TYPED_BANG_INSTRUCTION

inherit

	ET_QUALIFIED_TYPED_CREATION_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (l: like left_bang; a_type: like type; r: like right_bang;
		a_target: like target; a_dot: like dot; a_name: like procedure_name;
		args: like arguments) is
			-- Create a new qualified typed bang creation instruction.
		require
			l_not_void: l /= Void
			a_type_not_void: a_type /= Void
			r_not_void: r /= Void
			a_target_not_void: a_target /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			left_bang := l
			type := a_type
			right_bang := r
			target := a_target
			dot := a_dot
			procedure_name := a_name
			arguments := args
		ensure
			left_bang_set: left_bang = l
			type_set: type = a_type
			right_bang_set: right_bang = r
			target_set: target = a_target
			dot_set: dot = a_dot
			procedure_name_set: procedure_name = a_name
			arguments_set: arguments = args
		end

feature -- Access

	left_bang: ET_SYMBOL
	right_bang: ET_SYMBOL
			-- '!' symbols surrounding type

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_bang.position
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

	left_bang_not_void: left_bang /= Void
	right_bang_not_void: right_bang /= Void

end -- class ET_QUALIFIED_TYPED_BANG_INSTRUCTION
