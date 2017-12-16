note

	description:

		"Eiffel breaks"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BREAK

create

	make

feature {NONE} -- Initialization

	make (a_text: like text)
			-- Create a new break.
		require
			a_text_not_void: a_text /= Void
		do
			text := a_text
		ensure
			text_set: text = a_text
		end

feature -- Access

	text: STRING
			-- Text of break

feature -- Status report

	has_comment: BOOLEAN
			-- Does current break contain a comment?
		do
			Result := text.has ('-')
		end

	has_non_empty_comment: BOOLEAN
			-- Does current break contain a non-empty comment?
			-- (Comments only made up of white characters or minus signs are not taken into account.)
		local
			i, nb: INTEGER
		do
			nb := text.count
			from i := 1 until i > nb loop
				inspect text.item (i)
				when '-', ' ', '%T', '%R', '%N' then
					i := i + 1
				else
					Result := True
					i := nb + 1 -- Jump out of the loop.
				end
			end
		end

invariant

	text_not_void: text /= Void

end
