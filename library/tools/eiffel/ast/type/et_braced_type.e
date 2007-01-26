indexing

	description:

		"Eiffel types surrounded by braces"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BRACED_TYPE

inherit

	ET_TARGET_TYPE

create

	make

feature {NONE} -- Initialization

	make (a_type: like type) is
			-- Create a new type surrounded by braces.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
			left_brace := tokens.left_brace_symbol
			right_brace := tokens.right_brace_symbol
		ensure
			type_set: type = a_type
		end

feature -- Initialization

	reset is
			-- Reset braced type as it was when it was first parsed.
		do
			type.reset
		end

feature -- Access

	type: ET_TYPE
			-- Type

	left_brace: ET_SYMBOL
			-- '{' symbol

	right_brace: ET_SYMBOL
			-- '}' symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_brace.position
			if Result.is_null then
				Result := type.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := left_brace
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := right_brace
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_brace.break
		end

feature -- Setting

	set_left_brace (a_brace: like left_brace) is
			-- Set `left_brace' to `a_brace'.
		require
			a_brace_not_void: a_brace /= Void
		do
			left_brace := a_brace
		ensure
			left_brace_set: left_brace = a_brace
		end

	set_right_brace (a_brace: like right_brace) is
			-- Set `right_brace' to `a_brace'.
		require
			a_brace_not_void: a_brace /= Void
		do
			right_brace := a_brace
		ensure
			right_brace_set: right_brace = a_brace
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_braced_type (Current)
		end

invariant

	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void

end
