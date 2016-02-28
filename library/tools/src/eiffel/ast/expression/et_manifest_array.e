note

	description:

		"Eiffel manifest arrays"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_MANIFEST_ARRAY

inherit

	ET_EXPRESSION
		undefine
			reset
		redefine
			is_never_void
		end

	ET_EXPRESSION_LIST
		redefine
			make,
			make_with_capacity,
			reset
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new empty manifest array.
		do
			left_symbol := tokens.left_array_symbol
			right_symbol := tokens.right_array_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty manifest array with capacity `nb'.
		do
			left_symbol := tokens.left_array_symbol
			right_symbol := tokens.right_array_symbol
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset manifest array as they were when they were last parsed.
		local
			l_item: ET_EXPRESSION_ITEM
			l_expression: ET_EXPRESSION
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				l_item := storage.item (i)
				l_expression := l_item.expression
				if attached {ET_CONVERT_EXPRESSION} l_expression as l_convert then
					l_expression := l_convert.expression
					if attached {ET_EXPRESSION_COMMA} l_item as l_expression_comma then
						l_expression_comma.set_expression (l_expression)
					else
						storage.put (l_expression, i)
					end
				end
				l_expression.reset
				i := i + 1
			end
		end

feature -- Status report

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_manifest_array (Current)
		end

end
