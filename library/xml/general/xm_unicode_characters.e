note

	description:

		"XML unicode character classes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_UNICODE_CHARACTERS

feature -- Strings

	is_string (a_string: STRING): BOOLEAN
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

	is_name (a_name: STRING): BOOLEAN
			-- Is `a_name' a valid XML 'Name'?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := a_name.count
				-- First.
			if nb > 0 and then is_name_first (a_name.item_code (1)) then
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
		ensure
			empty_not_name: a_name.is_empty implies not Result
		end

	is_nmtoken (a_name: STRING): BOOLEAN
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

	is_ncname (a_name: STRING): BOOLEAN
			-- Is `a_name' a valid XML Namespace 'NCName'?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := a_name.count
				-- First.
			if nb > 0 and then is_ncname_first (a_name.item_code (1)) then
				Result := True
					-- Tail.
				from i := 2 until i > nb loop
					if not is_ncname_char (a_name.item_code (i)) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		ensure
			empty_not_name: a_name.is_empty implies not Result
		end

	is_qname (a_name: STRING): BOOLEAN
			-- Is `a_name' a valid XML Namespace 'Qname'?
			-- Qname := [NCName ':']? NCName
		require
			a_name_not_void: a_name /= Void
		local
			a_colon: INTEGER
		do
			a_colon  := a_name.index_of (':', 1)
			if a_colon > 0 then
				Result := is_ncname (a_name.substring (1, a_colon - 1))
						and is_ncname (a_name.substring (a_colon + 1, a_name.count))
			else
				Result := is_ncname (a_name)
			end
		ensure
			empty_not_name: a_name.is_empty implies not Result
		end

feature -- Characters

	is_char (a: INTEGER): BOOLEAN
			-- Valid content character?
		deferred
		end

	is_name_char (a: INTEGER): BOOLEAN
			-- Character for name?
		deferred
		end

	is_name_first (a: INTEGER): BOOLEAN
			-- Valid first character of name?
		deferred
		end

	is_space (a: INTEGER): BOOLEAN
			-- Space character?
		deferred
		end

feature -- Namespace characters

	is_ncname_char (a: INTEGER): BOOLEAN
			-- Is this a valid 'NCName' character?
		do
			Result := a /= (':').code and then is_name_char (a)
		ensure
			definition: Result = (a /= (':').code and is_name_char (a))
		end

	is_ncname_first(a: INTEGER): BOOLEAN
			-- Is this a valid first character of a 'NCName'?
		do
			Result := a /= (':').code and then is_name_first (a)
		ensure
			definition: Result = (a /= (':').code and is_name_first (a))
		end

end
