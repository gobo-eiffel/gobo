indexing

	description:
	
		"XML unicode character classes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_UNICODE_CHARACTERS

feature -- Status

	is_string (a_string: STRING): BOOLEAN is
			-- Is `a_string' a string containing no invalid XML characters?
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
		do
			Result := True
			nb := a_string.count
			from i := 1 until i > nb loop
				if not is_char (a_string.item_code (i)) then
					Result := False
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			empty: (a_string.count = 0) implies Result
		end

	is_name (a_name: STRING): BOOLEAN is
			-- Is `a_name' a valid XML 'Name'?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := a_name.count
				-- First.
			if nb = 0 or else is_name_first (a_name.item_code (1)) then
				Result := True
					-- Tail.
				from i := 2 until i > nb loop
					if not is_name_char (a_name.item_code (i)) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	is_nmtoken (a_name: STRING): BOOLEAN is
			-- Is `a_name' a valid XML 'Nmtoken'?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			Result := True
			nb := a_name.count
			from i := 1 until i > nb loop
				if not is_name_char (a_name.item_code (i)) then
					Result := False
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Characters

	is_char (a: INTEGER): BOOLEAN is
			-- Valid content character?
		deferred
		end
		
	is_name_char (a: INTEGER): BOOLEAN is
			-- Character for name?
		deferred
		end

	is_name_first (a: INTEGER): BOOLEAN is
			-- Valid first character of name?
		deferred
		end
		
	is_space (a: INTEGER): BOOLEAN is
			-- Space character?
		deferred
		end

end
