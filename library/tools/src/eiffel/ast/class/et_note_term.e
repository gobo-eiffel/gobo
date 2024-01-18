note

	description:

		"Eiffel note terms"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_NOTE_TERM

inherit

	ET_NOTE_TERM_ITEM

feature -- Access

	note_term: ET_NOTE_TERM
			-- Note term in comma-separated list
		do
			Result := Current
		end

end
