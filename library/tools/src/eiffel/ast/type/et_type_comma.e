note

	description:

		"Eiffel types followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"

class ET_TYPE_COMMA

inherit

	ET_TYPE_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_comma: like comma)
			-- Create a new type-comma.
		require
			a_type_not_void: a_type /= Void
			a_comma_not_void: a_comma /= Void
		do
			type := a_type
			comma := a_comma
		ensure
			type_set: type = a_type
			comma_set: comma = a_comma
		end

feature -- Access

	type: ET_TYPE
			-- Type in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := type.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := type.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := comma
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_type_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
