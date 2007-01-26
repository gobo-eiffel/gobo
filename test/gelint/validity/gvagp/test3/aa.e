indexing

	description:

		"Test root"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "MIT License"
	date:       "$Date$"
	revision:   "$Revision$"

class AA

create

	make

feature

	make is
		local
			b: BB
			i: INTEGER
		do
			create b
			b.put_string ("toto")
			b.put_character ('A')
				-- Should crash here at run-time if the Eiffel
				-- compiler didn't complain beforehand:
			i := b.string_item.count
		end

end -- class AA
