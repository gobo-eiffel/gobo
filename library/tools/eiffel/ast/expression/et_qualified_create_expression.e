indexing

	description:

		"Eiffel qualified create expressions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_QUALIFIED_CREATE_EXPRESSION

inherit

	ET_CREATE_EXPRESSION
		rename
			make as make_unqualified_create
		redefine
			break
		end

creation

	make

feature {NONE} -- Initialization

	make (a_create: like create_keyword; l: like left_brace; a_type: like type;
		r: like right_brace; a_dot: like dot; a_name: like procedure_name;
		args: like arguments) is
			-- Create a new qualified create expression.
		require
			a_create_not_void: a_create /= Void
			l_not_void: l /= Void
			a_type_not_void: a_type /= Void
			r_not_void: r /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			create_keyword := a_create
			left_brace := l
			type := a_type
			right_brace := r
			dot := a_dot
			procedure_name := a_name
			arguments := args
		ensure
			create_keyword_set: create_keyword = a_create
			left_brace_set: left_brace = l
			type_set: type = a_type
			right_brace_set: right_brace = r
			dot_set: dot = a_dot
			procedure_name_set: procedure_name = a_name
			arguments_set: arguments = args
		end

feature -- Access

	procedure_name: ET_FEATURE_NAME
			-- Creation procedure name

	arguments: ET_ACTUAL_ARGUMENTS
			-- Arguments

	dot: ET_SYMBOL
			-- Dot symbol

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

	procedure_name_not_void: procedure_name /= Void
	dot_not_void: dot /= Void

end -- class ET_QUALIFIED_CREATE_EXPRESSION
