indexing

	description:

		"Eiffel class names followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLASS_NAME_COMMA

inherit

	ET_CLASS_NAME_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_name: like class_name_item; a_comma: like comma) is
			-- Create a new class_name-comma.
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			class_name_item := a_name
			comma := a_comma
		ensure
			class_name_item_set: class_name_item = a_name
			comma_set: comma = a_comma
		end

feature -- Access

	class_name_item: ET_CLASS_NAME
			-- Class name in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := class_name_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

invariant

	comma_not_void: comma /= Void

end
