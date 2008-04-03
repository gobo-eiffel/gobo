indexing

	description:

		"Eiffel 'BIT N' types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BIT_N

inherit

	ET_BIT_TYPE

create

	make

feature {NONE} -- Initialization

	make (a_constant: like constant; a_base_class: ET_CLASS) is
			-- Create a new 'BIT N' type.
		require
			a_constant_not_void: a_constant /= Void
			a_base_class_not_void: a_base_class /= Void
		do
			bit_keyword := tokens.bit_keyword
			constant := a_constant
			size := No_size
			base_class := a_base_class
		ensure
			constant_set: constant = a_constant
			base_class_set: base_class = a_base_class
		end

feature -- Access

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := bit_keyword.position
			if Result.is_null then
				Result := constant.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := bit_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := constant
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := constant.break
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (bit_space)
			if constant.is_negative then
				a_string.append_character ('-')
			end
			a_string.append_string (constant.literal)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_bit_n (Current)
		end

invariant

	constant_not_void: constant /= Void

end
