indexing

	description:

		"Eiffel choices in 'when' parts of inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CHOICE

inherit

	ET_CHOICE_ITEM

feature -- Access

	choice_item: ET_CHOICE is
			-- Choice in comma-separated list
		do
			Result := Current
		end

end
