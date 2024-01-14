note

	description:

		"Eiffel creation region (for SCOOP)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"

class ET_CREATION_REGION

inherit

	ET_AST_NODE

create

	make

feature {NONE} -- Initialization

	make (a_name: like class_name)
			-- Create a new creation region.
		require
			a_name_not_void: a_name /= Void
		do
			class_name := a_name
			left_symbol := tokens.less_than_symbol
			right_symbol := tokens.greater_than_symbol
		ensure
			class_name_set: class_name = a_name
		end

feature -- Access

	class_name: ET_CLASS_NAME
			-- Class name

	left_symbol: ET_SYMBOL
			-- '<' symbol

	right_symbol: ET_SYMBOL
			-- '>' symbol

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if not left_symbol.position.is_null then
				Result := left_symbol.position
			else
				Result := class_name.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := left_symbol
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := right_symbol
		end

feature -- Setting

	set_left_symbol (a_symbol: like left_symbol)
			-- Set `left_symbol' to `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		do
			left_symbol := a_symbol
		ensure
			left_symbol_set: left_symbol = a_symbol
		end

	set_right_symbol (a_symbol: like right_symbol)
			-- Set `right_symbol' to `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		do
			right_symbol := a_symbol
		ensure
			right_symbol_set: right_symbol = a_symbol
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_creation_region (Current)
		end

invariant

	class_name_not_void: class_name /= Void
	left_symbol_not_void: left_symbol /= Void
	right_symbol_not_void: right_symbol /= Void

end
