note

	description:

		"Eiffel class names surrounded by braces"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BRACED_CLASS_NAME

inherit

	ET_PRECURSOR_CLASS_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like class_name)
			-- Create a new class name surrounded by braces.
		require
			a_name_not_void: a_name /= Void
		do
			class_name := a_name
			left_brace := tokens.left_brace_symbol
			right_brace := tokens.right_brace_symbol
		ensure
			class_name_set: class_name = a_name
		end

feature -- Access

	class_name: ET_CLASS_NAME
			-- Class name

	left_brace: ET_SYMBOL
			-- '{' symbol

	right_brace: ET_SYMBOL
			-- '}' symbol

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if not left_brace.position.is_null then
				Result := left_brace.position
			else
				Result := class_name.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := left_brace
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := right_brace
		end

feature -- Setting

	set_left_brace (a_brace: like left_brace)
			-- Set `left_brace' to `a_brace'.
		require
			a_brace_not_void: a_brace /= Void
		do
			left_brace := a_brace
		ensure
			left_brace_set: left_brace = a_brace
		end

	set_right_brace (a_brace: like right_brace)
			-- Set `right_brace' to `a_brace'.
		require
			a_brace_not_void: a_brace /= Void
		do
			right_brace := a_brace
		ensure
			right_brace_set: right_brace = a_brace
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_braced_class_name (Current)
		end

invariant

	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void

end
