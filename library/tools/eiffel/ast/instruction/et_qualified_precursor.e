indexing

	description:

		"Eiffel qualified precursor calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_QUALIFIED_PRECURSOR

inherit

	ET_PRECURSOR
		rename
			make as make_unqualfied_precursor
		redefine
			parent, position, break
		end

feature {NONE} -- Initialization

	make (l: like left_brace; a_parent: like parent; r: like right_brace;
		a_precursor: like precursor_keyword; args: like arguments) is
			-- Create a new qualified precursor call.
		require
			l_not_void: l /= Void
			a_parent_not_void: a_parent /= Void
			r_not_void: r /= Void
			a_precursor_not_void: a_precursor /= Void
		do
			left_brace := l
			parent := a_parent
			right_brace := r
			precursor_keyword := a_precursor
			arguments := args
		ensure
			left_brace_set: left_brace = l
			parent_set: parent = a_parent
			right_brace_set: right_brace = r
			precursor_keyword_set: precursor_keyword = a_precursor
			arguments_set: arguments = args
		end

feature -- Access

	parent: ET_CLASS_NAME
			-- Parent

	left_brace: ET_SYMBOL
	right_brace: ET_SYMBOL
			-- Braces surrounding parent class name

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if is_parent_prefixed then
				Result := precursor_keyword.position
			else
				Result := left_brace.position
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if arguments /= Void then
				Result := arguments.break
			elseif is_parent_prefixed then
				Result := precursor_keyword.break
			else
				Result := right_brace.break
			end
		end

feature -- Status report

	is_parent_prefixed: BOOLEAN
			-- Does parent clause appear before 'precursor' keyword?

feature -- Status setting

	set_parent_prefixed (b: BOOLEAN) is
			-- Set `is_parent_prefixed' to `b'.
		do
			is_parent_prefixed := b
		ensure
			is_parent_prefixed_set: is_parent_prefixed = b
		end

invariant

	parent_not_void: parent /= Void
	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void

end
