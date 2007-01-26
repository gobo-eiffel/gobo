indexing

	description:

		"Expands special tokens in a template with given parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2004, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_TEMPLATE_EXPANDER

inherit

	ANY -- Export features of ANY.

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_ARRAY_ROUTINES
	KL_IMPORTED_ANY_ROUTINES

create

	make

feature {NONE} -- Initialisation

	make is
		do
		end

feature -- Access

	expand_from_array (a_template: STRING; a_parameters: ARRAY [STRING]): STRING is
			-- expands special tokens with parameters in template string
			--
			-- returns a new string based on `a_tmpl'
			-- where all occurences of "$N" or "${N}" (where N
			-- stands for [0-9]+) in `a_tmpl' are substituted by
			-- the entry `N' in `a_params' or left as "$N" or "${N}" if
			-- `N' is out of bounds. The character '$' is escaped
			-- using "$$".
		require
			a_template_not_void: a_template /= Void
			a_parameters_not_void: a_parameters /= Void
		local
			str: STRING
			i, j, nb: INTEGER
			c: CHARACTER
			stop, lb, rb: BOOLEAN
		do
			from
				i := 1
				nb := a_template.count
				Result := STRING_.new_empty_string (a_template, nb)
			until
				i > nb
			loop
				c := a_template.item (i)
				i := i + 1
				if c /= '$' then
					if c /= '%U' then
						Result.append_character (c)
					else
						Result := STRING_.appended_substring (Result, a_template, i - 1, i - 1)
					end
				elseif i > nb then
						-- Dollar at the end of `a_template'.
						-- Leave it as it is.
					Result.append_character ('$')
				else
					c := a_template.item (i)
					if c = '$' then
							-- Escaped dollar character.
						Result.append_character ('$')
						i := i + 1
					else
							-- Found beginning of a placeholder.
							-- It is either ${N} or $N.
						str := STRING_.new_empty_string (a_template, 5)
						if c = '{' then
								-- Looking for a right brace.
							lb := True
							rb := False
							from
								i := i + 1
							until
								i > nb or rb
							loop
								c := a_template.item (i)
								if c = '}' then
									rb := True
								elseif c /= '%U' then
									str.append_character (c)
								else
									check same_type: ANY_.same_types (str, a_template) end
									STRING_.append_substring_to_string (str, a_template, i, i)
								end
								i := i + 1
							end
						else
								-- Looking for a non-numeric character
								-- (i.e. [^0-9]).
							lb := False
							rb := False
							from
								stop := False
							until
								i > nb or stop
							loop
								c := a_template.item (i)
								inspect c
								when '0'..'9' then
									str.append_character (c)
									i := i + 1
								else
									stop := True
								end
							end
						end
						if STRING_.is_integer (str) then
							j := str.to_integer
							if a_parameters.valid_index (j) then
								Result := STRING_.appended_string (Result, a_parameters.item (j))
							else
									-- Leave $N or ${N} unchanged.
								Result.append_character ('$')
								if lb then
									Result.append_character ('{')
								end
								Result := STRING_.appended_string (Result, str)
								if rb then
									Result.append_character ('}')
								end
							end
						else
								-- Leave $N or ${N} unchanged.
							Result.append_character ('$')
							if lb then
								Result.append_character ('{')
							end
							Result := STRING_.appended_string (Result, str)
							if rb then
								Result.append_character ('}')
							end
						end
					end
				end
			end
		ensure
			result_not_void: Result /= Void
		end

	expand_from_values (a_template: STRING; a_variables: KL_VALUES [STRING, STRING]): STRING is
			-- String where the variables have been
			-- replaced by their values. The variables
			-- are considered to be either ${[^}]*} or $[a-zA-Z0-9_]+
			-- and the dollar sign is escaped using $$. Non defined
			-- variables are left as they were.
			-- The result is not defined when `a_string' does not
			-- conform to the conventions above.
			-- the variables and their values are taken from
			-- `a_variables' where the key is the variable name and the
			-- value is the value of the variable.
			-- Return a new string each time.
		require
			a_template_not_void: a_template /= Void
			a_variables_not_void: a_variables /= Void
		local
			str: STRING
			i, nb: INTEGER
			c: CHARACTER
			stop: BOOLEAN
			has_brackets: BOOLEAN
			value: STRING
		do
			from
				i := 1
				nb := a_template.count
				Result := STRING_.new_empty_string (a_template, nb)
			until
				i > nb
			loop
				c := a_template.item (i)
				i := i + 1
				if c /= '$' then
					if c /= '%U' then
						Result.append_character (c)
					else
						Result := STRING_.appended_substring (Result, a_template, i - 1, i - 1)
					end
				elseif i > nb then
						-- Dollar at the end of `a_template'.
						-- Leave it as it is.
					Result.append_character ('$')
				else
					c := a_template.item (i)
					if c = '$' then
							-- Escaped dollar character.
						Result.append_character ('$')
						i := i + 1
					else
							-- Found beginning of a variable
							-- It is either ${VAR} or $VAR.
						str := STRING_.new_empty_string (a_template, 5)
						if c = '{' then
							has_brackets := True
								-- Looking for a right brace.
							from
								i := i + 1
								stop := False
							until
								i > nb or stop
							loop
								c := a_template.item (i)
								if c = '}' then
									stop := True
								elseif c /= '%U' then
									str.append_character (c)
								else
									check same_type: ANY_.same_types (str, a_template) end
									STRING_.append_substring_to_string (str, a_template, i, i)
								end
								i := i + 1
							end
						else
							has_brackets := False
								-- Looking for a non-alphanumeric character
								-- (i.e. [^a-zA-Z0-9_]).
							from
								stop := False
							until
								i > nb or stop
							loop
								c := a_template.item (i)
								inspect c
								when 'a'..'z', 'A'..'Z', '0'..'9', '_' then
									str.append_character (c)
									i := i + 1
								else
									stop := True
								end
							end
						end
						value := a_variables.value (str)
						if value /= Void then
							Result := STRING_.appended_string (Result, value)
						elseif str.count = 0 then
							Result.append_character ('$')
						else
							Result.append_character ('$')
							if has_brackets then
								Result.append_character ('{')
							end
							Result := STRING_.appended_string (Result, str)
							if has_brackets then
								Result.append_character ('}')
							end
						end
					end
				end
			end
		ensure
			result_not_void: Result /= Void
		end

end
