indexing

	description:

		"String values that are accessible through keys"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_STRING_VALUES

inherit

	KL_VALUES [STRING, STRING]

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Conversion

	interpreted_string (a_string: STRING): STRING is
			-- String where the variables have been replaced by their values.
			-- The variables are considered to be either ${[^}]*} or
			-- $[a-zA-Z0-9_]+ and the dollar sign is escaped using $$.
			-- Non-defined variables are replaced by empty strings.
			-- The result is not defined when `a_string' does not
			-- conform to the conventions above.
			-- Return a new string each time.
		require
			a_string_not_void: a_string /= Void
		local
			l_name: STRING
			l_value: ?STRING
			i, nb: INTEGER
			c: CHARACTER
			stop: BOOLEAN
		do
			from
				i := 1
				nb := a_string.count
				Result := STRING_.new_empty_string (a_string, nb)
			until
				i > nb
			loop
				c := a_string.item (i)
				i := i + 1
				if c /= '$' then
					if c /= '%U' then
						Result.append_character (c)
					else
						Result := STRING_.appended_substring (Result, a_string, i - 1, i - 1)
					end
				elseif i > nb then
						-- Dollar at the end of `a_string'.
						-- Leave it as it is.
					Result.append_character ('$')
				else
					c := a_string.item (i)
					if c = '$' then
							-- Escaped dollar character.
						Result.append_character ('$')
						i := i + 1
					else
							-- Found beginning of a variable.
							-- It is either ${VAR} or $VAR.
						l_name := STRING_.new_empty_string (a_string, 5)
						if c = '{' then
								-- Looking for a right brace.
							from
								i := i + 1
								stop := False
							until
								i > nb or stop
							loop
								c := a_string.item (i)
								if c = '}' then
									stop := True
								elseif c /= '%U' then
									l_name.append_character (c)
								else
									check same_type: ANY_.same_types (l_name, a_string) end
									STRING_.append_substring_to_string (l_name, a_string, i, i)
								end
								i := i + 1
							end
						else
								-- Looking for a non-alphanumeric character
								-- (i.e. [^a-zA-Z0-9_]).
							from
								stop := False
							until
								i > nb or stop
							loop
								c := a_string.item (i)
								inspect c
								when 'a'..'z', 'A'..'Z', '0'..'9', '_' then
									l_name.append_character (c)
									i := i + 1
								else
									stop := True
								end
							end
						end
						l_value := value (l_name)
						if l_value /= Void then
							Result := STRING_.appended_string (Result, l_value)
						end
					end
				end
			end
		ensure
			interpreted_string_not_void: Result /= Void
			new_string: Result /= a_string
		end

end
