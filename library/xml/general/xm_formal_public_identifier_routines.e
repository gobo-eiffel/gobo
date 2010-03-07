indexing

	description:

		"Rountines for manipulating formal public identifies"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_FORMAL_PUBLIC_IDENTIFIER_ROUTINES

feature -- Conversion

	normalized_fpi (an_fpi: STRING): STRING is
			-- Normalized version of `an_fpi'.
		require
			public_identifier_is_ascii: an_fpi /= Void -- and then an_fpi.is_ascii
		local
			an_index: INTEGER
			a_character: CHARACTER
			was_last_blank: BOOLEAN
		do
			Result := ""
			from
				an_index := 1
			until
				an_index > an_fpi.count
			loop
				a_character := an_fpi.item (an_index)
				inspect
					a_character
				when '%T', '%R', '%N', ' ' then
					if not was_last_blank then
						Result.append_character (' ')
						was_last_blank := True
					end
				else
					Result.append_character (a_character)
					was_last_blank := False
				end
				an_index := an_index + 1
			end
			Result.left_adjust
			Result.right_adjust
		end

	urn_to_fpi (a_publicid_urn: STRING) : STRING is
			-- Unwrapped urn:publicid: URN
		require
			public_id_urn: a_publicid_urn /= Void and then a_publicid_urn.substring_index ("urn:publicid:", 1) = 1
		local
			an_index: INTEGER
		do
			Result := ""
			from
				an_index := 14
			until
				an_index > a_publicid_urn.count
			loop
				if a_publicid_urn.substring_index ("%%2F", an_index) = an_index then
					Result := Result + "/"
					an_index := an_index + 3
				elseif a_publicid_urn.substring_index (":", an_index) = an_index then
					Result := Result + "//"
					an_index := an_index + 1
				elseif a_publicid_urn.substring_index ("%%3A", an_index) = an_index then
					Result := Result + ":"
					an_index := an_index + 3
				elseif a_publicid_urn.substring_index (";", an_index) = an_index then
					Result := Result + "::"
					an_index := an_index + 1
				elseif a_publicid_urn.substring_index ("+", an_index) = an_index then
					Result := Result + " "
					an_index := an_index + 1
				elseif a_publicid_urn.substring_index ("%%2B", an_index) = an_index then
					Result := Result + "+"
					an_index := an_index + 3
				elseif a_publicid_urn.substring_index ("%%23", an_index) = an_index then
					Result := Result + "#"
					an_index := an_index + 3
				elseif a_publicid_urn.substring_index ("%%3F", an_index) = an_index then
					Result := Result + "?"
					an_index := an_index + 3
				elseif a_publicid_urn.substring_index ("%%27", an_index) = an_index then
					Result := Result + "'"
					an_index := an_index + 3
				elseif a_publicid_urn.substring_index ("%%3B", an_index) = an_index then
					Result := Result + ";"
					an_index := an_index + 3
				elseif a_publicid_urn.substring_index ("%%25", an_index) = an_index then
					Result := Result + "%%"
					an_index := an_index + 3
				else
					Result.append_string (a_publicid_urn.substring (an_index, an_index))
					an_index := an_index + 1
				end
			variant
				a_publicid_urn.count + 1 - an_index
			end
		ensure
			fpi_not_void: result /= Void
		end

end

