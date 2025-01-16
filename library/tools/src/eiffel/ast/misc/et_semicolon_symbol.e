note

	description:

		"Eiffel ';' symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_SEMICOLON_SYMBOL

inherit

	ET_SYMBOL
		rename
			make_semicolon as make
		redefine
			last_leaf,
			process
		end

	ET_NULL_EXPORT
		undefine
			first_position,
			last_position,
			reset,
			is_semicolon,
			break
		end

	ET_NULL_INSTRUCTION
		undefine
			first_position,
			last_position,
			is_semicolon,
			break
		end

create

	make

feature -- Access

	other: detachable ET_SEMICOLON_SYMBOL
			-- Other semicolon in case of multiple semicolons

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached other as l_other then
				Result := l_other.last_leaf
			else
				Result := Current
			end
		end

feature -- Setting

	set_other (a_other: like other)
			-- Set `other' to `a_other'.
		do
			other := a_other
		ensure
			other_set: other = a_other
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_semicolon_symbol (Current)
		end

invariant

	is_semicolon: is_semicolon

end
