indexing

	description:

		"Eiffel client lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLIENTS

inherit

	ET_AST_NODE

	ET_CLASS_NAME_LIST
		rename
			make as make_class_name_list,
			make_with_capacity as make_class_name_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (l: like left_brace; r: like right_brace) is
			-- Create a new empty client list.
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			left_brace := l
			right_brace := r
			make_class_name_list
		ensure
			left_brace_set: left_brace = l
			right_brace_set: right_brace = r
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (l: like left_brace; r: like right_brace; nb: INTEGER) is
			-- Create a new empty client list with capacity `nb'.
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			nb_positive: nb >= 0
		do
			left_brace := l
			right_brace := r
			make_class_name_list_with_capacity (nb)
		ensure
			left_brace_set: left_brace = l
			right_brace_set: right_brace = r
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	left_brace: ET_SYMBOL
	right_brace: ET_SYMBOL
			-- '{' and '}' symbols before and after client list

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_brace.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_brace.break
		end

feature -- Setting

	set_left_brace (l: like left_brace) is
			-- Set `left_brace' to `l'.
		require
			l_not_void: l /= Void
		do
			left_brace := l
		ensure
			left_brace_set: left_brace = l
		end

	set_right_brace (r: like right_brace) is
			-- Set `right_brace' to `r'.
		require
			r_not_void: r /= Void
		do
			right_brace := r
		ensure
			right_brace_set: right_brace = r
		end

invariant

	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void

end
