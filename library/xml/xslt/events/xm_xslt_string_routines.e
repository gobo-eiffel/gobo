indexing

	description:

		"Routines on strings."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_STRING_ROUTINES

inherit

	XM_UNICODE_CHARACTERS_1_1

feature -- Status report
	
	is_all_whitespace (chars: STRING): BOOLEAN is
			-- Does `chars' consist only of XML white-space characters?
		local
			a_character: CHARACTER
			counter: INTEGER
		do
			from
				counter := 1
				Result := True
			variant
				chars.count + 1 - counter
			until
				Result = False or else counter > chars.count
			loop
				if not is_space (chars.item_code (counter)) then
					Result := False
				end
				counter := counter + 1
			end
		end

end
	
