indexing

	description:

		"Eiffel qualified anchored types of the form 'like {A}.b'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2010, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_LIKE_BRACED_TYPE

inherit

	ET_QUALIFIED_LIKE_IDENTIFIER
		redefine
			resolved_formal_parameters
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_type: like target_type; a_name: like qualified_name) is
			-- Create a new 'like {A}.b' type.
		require
			a_type_not_void: a_type /= Void
			a_name_not_void: a_name /= Void
		do
			type_mark := a_type_mark
			target_type := a_type
			qualified_name := a_name
			like_keyword := tokens.like_keyword
			left_brace := tokens.left_brace_symbol
			right_brace := tokens.right_brace_symbol
		ensure
			type_mark_set: type_mark = a_type_mark
			target_type_set: target_type = a_type
			qualified_name_set: qualified_name = a_name
		end

feature -- Access

	type_mark: ET_TYPE_MARK
			-- 'attached' or 'detachable' keyword,
			-- or '!' or '?' symbol

	like_keyword: ET_KEYWORD
			-- 'like' keyword

	target_type: ET_TYPE
			-- Target anchored type

	left_brace: ET_SYMBOL
			-- '{' symbol

	right_brace: ET_SYMBOL
			-- '}' symbol

feature -- Setting

	set_like_keyword (a_like: like like_keyword) is
			-- Set `like_keyword' to `a_like'.
		require
			a_like_not_void: a_like /= Void
		do
			like_keyword := a_like
		ensure
			like_keyword_set: like_keyword = a_like
		end

	set_left_brace (a_left: like left_brace) is
			-- Set `left_brace' to `a_left'.
		require
			a_left_not_void: a_left /= Void
		do
			left_brace := a_left
		ensure
			left_brace_set: left_brace = a_left
		end

	set_right_brace (a_right: like right_brace) is
			-- Set `right_brace' to `a_right'.
		require
			a_right_not_void: a_right /= Void
		do
			right_brace := a_right
		ensure
			right_brace_set: right_brace = a_right
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_QUALIFIED_LIKE_BRACED_TYPE is
			-- Version of current type where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		local
			l_target_type: like target_type
			l_resolved_target_type: like target_type
		do
			Result := Current
			l_target_type := target_type
			l_resolved_target_type := l_target_type.resolved_formal_parameters (a_parameters)
			if l_target_type /= l_target_type then
				create Result.make (type_mark, l_resolved_target_type, qualified_name)
				Result.set_left_brace (left_brace)
				Result.set_right_brace (right_brace)
			end
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (like_space)
			a_string.append_character ('{')
			target_type.append_to_string (a_string)
			a_string.append_character ('}')
			a_string.append_character ('.')
			a_string.append_string (name.lower_name)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_qualified_like_braced_type (Current)
		end

invariant

	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void

end
