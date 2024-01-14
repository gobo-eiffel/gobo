note

	description:

		"String values that are accessible through keys"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2008-2020, Eric Bezault and others"
	license: "MIT License"

deferred class KL_STRING_VALUES

inherit

	KL_VALUES [STRING, STRING]

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_CHARACTER_CODES
		export {NONE} all end

feature -- Conversion

	interpreted_string (a_string: STRING): STRING
			-- String where the variables have been replaced by their values.
			-- The variables are considered to be either ${[^}]*} or
			-- $[a-zA-Z0-9_]+ and the dollar sign is escaped using $$.
			-- Non-defined variables are replaced by empty strings.
			-- The result is not defined when `a_string' does not
			-- conform to the conventions above.
			-- Return a new string each time.
		require
			a_string_not_void: a_string /= Void
		do
			Result := expanded_string (a_string, True)
		ensure
			interpreted_string_not_void: Result /= Void
			new_string: Result /= a_string
		end

	expanded_string (a_string: STRING; a_non_defined_as_empty: BOOLEAN): STRING
			-- String where the variables have been replaced by their values.
			-- The variables are considered to be either ${[^}]*} or
			-- $[a-zA-Z0-9_]+ and the dollar sign is escaped using $$.
			-- If `a_non_defined_as_empty' is True, then non-defined
			-- variables are replaced by empty strings. Otherwise they
			-- are left unexpanded.
			-- The result is not defined when `a_string' does not
			-- conform to the conventions above.
			-- Return a new string each time.
		require
			a_string_not_void: a_string /= Void
		local
			l_name: STRING
			l_value: detachable STRING
			i, nb: INTEGER
			c: NATURAL_32
			has_braces: BOOLEAN
			stop: BOOLEAN
		do
			from
				i := 1
				nb := a_string.count
				Result := STRING_.new_empty_string (a_string, nb)
			until
				i > nb
			loop
				c := a_string.code (i)
				i := i + 1
				if c /= Dollar_code then
					if c /= 0 then
						Result.append_code (c)
					else
						Result := STRING_.appended_substring (Result, a_string, i - 1, i - 1)
					end
				elseif i > nb then
						-- Dollar at the end of `a_string'.
						-- Leave it as it is.
					Result.append_character ('$')
				else
					c := a_string.code (i)
					if c = Dollar_code then
							-- Escaped dollar character.
						Result.append_character ('$')
						i := i + 1
					else
							-- Found beginning of a variable.
							-- It is either ${VAR} or $VAR.
						l_name := STRING_.new_empty_string (a_string, 5)
						if c = Left_brace_code then
							has_braces := True
								-- Looking for a right brace.
							from
								i := i + 1
								stop := False
							until
								i > nb or stop
							loop
								c := a_string.code (i)
								if c = Right_brace_code then
									stop := True
								elseif c /= 0 then
									l_name.append_code (c)
								else
									check same_type: l_name.same_type (a_string) end
									STRING_.append_substring_to_string (l_name, a_string, i, i)
								end
								i := i + 1
							end
						else
							has_braces := False
								-- Looking for a non-alphanumeric character
								-- (i.e. [^a-zA-Z0-9_]).
							from
								stop := False
							until
								i > nb or stop
							loop
								c := a_string.code (i)
								inspect c
								when Lower_a_code .. Lower_z_code, Upper_a_code .. Upper_z_code, Zero_code .. Nine_code, Underscore_code then
									l_name.append_code (c)
									i := i + 1
								else
									stop := True
								end
							end
						end
						l_value := value (l_name)
						if l_value /= Void then
							Result := STRING_.appended_string (Result, l_value)
						elseif not a_non_defined_as_empty then
							Result.append_character ('$')
							if has_braces then
								Result.append_character ('{')
							end
							Result := STRING_.appended_string (Result, l_name)
							if has_braces then
								Result.append_character ('}')
							end
						end
					end
				end
			end
		ensure
			expanded_string_not_void: Result /= Void
			new_string: Result /= a_string
		end

end
