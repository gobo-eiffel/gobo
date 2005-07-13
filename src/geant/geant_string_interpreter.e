indexing

	description:

		"Interpreters for Strings using variable resolvers"

	library: "Gobo Eiffel Ant"
	copyright:"Copyright (c) 2004, Sven Ehrke and others"
	license:"Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision:"$Revision$"


class GEANT_STRING_INTERPRETER

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create new String Interpreter.
		do
		end

feature -- Access

	source_string: STRING
			-- Source string to be interpreted

	variable_resolver: GEANT_VARIABLE_RESOLVER
			-- Variable resolver used for interpretation of `source_string'

	interpreted_source_string: STRING is
			-- `interpreted_string(source_string)'
		require
			source_string_not_void: source_string /= Void
		do
			Result := interpreted_string (source_string)
		end

	interpreted_string (a_string: STRING): STRING is
			-- String where the variables have been
			-- replaced by their values. The variables
			-- are considered to be either ${[^}]*} or $[a-zA-Z0-9_]+
			-- and the dollar sign is escaped using $$. Non defined
			-- variables are replaced by empty strings.
			-- The result is not defined when `source_string' does not
			-- conform to the conventions above.
			-- Return a new string each time.
			-- Borrowed from GOBO's KL_EXECUTION_ENVIRONMENT
		require
			a_string_not_void: a_string /= Void
		local
			str: STRING
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
							-- Found beginning of a environment variable
							-- It is either ${VAR} or $VAR.
						str := STRING_.new_empty_string (a_string, 5)
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
									str.append_character (c)
								else
									check same_type: ANY_.same_types (str, a_string) end
									STRING_.append_substring_to_string (str, a_string, i, i)
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
									str.append_character (c)
									i := i + 1
								else
									stop := True
								end
							end
						end
						str := variable_value (str)
						Result := STRING_.appended_string (Result, str)
					end
				end
			end
		ensure
			interpreted_string_not_void: Result /= Void
		end

feature -- Setting

	set_source_string (a_source_string: STRING) is
			-- Set `source_string' to `a_source_string'.
		require
			a_source_string_not_void: a_source_string /= Void
			a_source_string_not_empty: a_source_string.count > 0
		do
			source_string := a_source_string
		ensure
			source_string_set: source_string = a_source_string
		end

	set_variable_resolver (a_variable_resolver: like variable_resolver) is
			-- Set `variable_resolver' to `a_variable_resolver'.
		require
			a_variable_resolver_not_void: a_variable_resolver /= Void
		do
			variable_resolver := a_variable_resolver
		ensure
			variable_resolver_set: variable_resolver = a_variable_resolver
		end

feature {NONE} -- Implementation

	variable_value (a_name: STRING): STRING is
			-- Value of variable `a_name';
			-- `${a_name}' if `a_name' has not been set.
		require
			a_name_not_void: a_name /= Void
		do
			if a_name.is_empty then
				Result := default_variable_value (a_name)
			end
			if Result = Void then
				if variable_resolver.has (a_name) then
					Result := variable_resolver.value (a_name)
					if Result /= Void then
						Result := expanded_variable_value (Result)
					end
				end
			end
			if Result = Void then
				Result := default_variable_value (a_name)
			end
		ensure
			variable_value_not_void: Result /= Void
		end

	expanded_variable_value (a_value : STRING) : STRING is
			-- Expanded variable value of `a_value'
		require
			a_value_not_void: a_value /= Void
		local
			source: STRING
		do
				-- Note: calling `interpreted_string' here is problematic since this ends up with
				-- circular calls which will cause infinite looping if the variable refer each other
				-- circularly. However the risk should be relatively small that this happens
				-- TODO: think about how to detect circular variable references to be able to report
				-- this problem and exit
			from
				source := a_value
				Result := interpreted_string (source)
			until
				STRING_.same_string (Result, source)
			loop
				source := Result
				Result := interpreted_string (source)
			end
		ensure
			expanded_variable_value_not_void : Result /= Void
		end

	default_variable_value (a_name: STRING): STRING is
			-- `${`a_name'}'
		require
			a_name_not_void: a_name /= Void
		do
				Result := STRING_.new_empty_string (a_name, a_name.count + 3)
				Result.append_string ("${")
				Result.append_string (a_name)
				Result.append_string ("}")
		end

end
