indexing

	description:

		"Eiffel static feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_STATIC_FEATURE_CALL

inherit

	ET_FEATURE_CALL
		rename
			make as make_unqualified_call
		redefine
			position
		end

creation

feature {NONE} -- Initialization

	make (a_feature: like feature_keyword; l: like left_brace; a_type: like type;
		r: like right_brace; a_dot: like dot; a_name: like name; args: like arguments) is
			-- Create a new static feature call.
		require
			a_feature_not_void: a_feature /= Void
			l_not_void: l /= Void
			a_type_not_void: a_type /= Void
			r_not_void: r /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			feature_keyword := a_feature
			left_brace := l
			type := a_type
			right_brace := r
			dot := a_dot
			name := a_name
			arguments := args
		ensure
			feature_keyword_set: feature_keyword = a_feature
			left_brace_set: left_brace = l
			type_set: type = a_type
			right_brace_set: right_brace = r
			dot_set: dot = a_dot
			name_set: name = a_name
			arguments_set: arguments = args
		end

feature -- Access

	feature_keyword: ET_TOKEN
			-- 'feature' keyword

	type: ET_TYPE
			-- Static type

	left_brace: ET_SYMBOL
	right_brace: ET_SYMBOL
			-- Braces surrounding type

	dot: ET_SYMBOL
			-- Dot symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := feature_keyword.position
		end

invariant

	type_not_void: type /= Void
	feature_keyword_not_void: feature_keyword /= Void
	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void
	dot_not_void: dot /= Void

end
