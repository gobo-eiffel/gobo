indexing

	description:

		"Routines on strings and characters."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_STRING_ROUTINES

inherit

	XM_UNICODE_CHARACTERS_1_1

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

feature -- Status report
	
	is_all_whitespace (chars: STRING): BOOLEAN is
			-- Does `chars' consist only of XML white-space characters?
		local
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

	is_alphanumeric (a_character_code: INTEGER): BOOLEAN is
			-- Does `a_character_code' represent an alphanumeric character?
		require
			positive_character_code: a_character_code > 0
		do
			todo ("is_alphanumeric (does not use Unicode categories)", True)

			-- only ASCII for now

			if a_character_code < 48 then -- zero
				Result := False
			elseif a_character_code <= 57 then -- nine
				Result := True
			elseif a_character_code < 65 then -- upper case A
				Result := False
			elseif a_character_code <= 90 then -- upper case Z
				Result := True
			elseif a_character_code < 97 then -- lower case A
				Result := False
			elseif a_character_code <= 122 then -- lower case Z
				Result := True
			end
		end


end
	
