indexing

	description:

		"Errors, warnings and other kind of messages"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class UT_ERROR

inherit

	KL_SHARED_ARGUMENTS

	KL_IMPORTED_STRING_ROUTINES

	KL_IMPORTED_ARRAY_ROUTINES

feature -- Access

	message (a_template: STRING): STRING is
			-- Error message built using `a_template';
			-- Occurrences of "$N" or "${N}" (where N stands
			-- for [0-9]+) in the template are substituted by
			-- the entry `N' in `parameters' or left as "$N"
			-- or "${N}" if `N' is out of bounds, unless it is
			-- equal to 0 in which case it is substituted by
			-- the program name. The character '$' is escaped
			-- using "$$". Return a new string each time.
		require
			a_template_not_void: a_template /= Void
		local
			str: STRING
			i, j, nb: INTEGER
			c: CHARACTER
			stop, lb, rb: BOOLEAN
		do
			from
				i := 1
				nb := a_template.count
				Result := STRING_.make (nb)
			until
				i > nb
			loop
				c := a_template.item (i)
				i := i + 1
				if c /= '$' then
					Result.append_character (c)
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
						str := STRING_.make (5)
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
								else
									str.append_character (c)
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
							if parameters.valid_index (j) then
								Result.append_string (parameters.item (j))
							elseif j = 0 then
								Result.append_string (Arguments.program_name)
							else
									-- Leave $N or ${N} unchanged.
								Result.append_character ('$')
								if lb then Result.append_character ('{') end
								Result.append_string (str)
								if rb then Result.append_character ('}') end
							end
						else
								-- Leave $N or ${N} unchanged.
							Result.append_character ('$')
							if lb then Result.append_character ('{') end
							Result.append_string (str)
							if rb then Result.append_character ('}') end
						end
					end
				end
			end
		ensure
			message_not_void: Result /= Void
		end

	parameters: ARRAY [STRING]
			-- Parameters used for building the error message
			-- (See header comment of `message' for details.)

	default_message: STRING is
			-- Default error message built using `default_template'
		do
			Result := message (default_template)
		ensure
			default_message_not_void: Result /= Void
		end

	default_template: STRING is
			-- Default template used to built the error message
		deferred
		ensure
			default_template_not_void: Result /= Void
		end

	code: STRING is
			-- Error code
			-- (Might be useful to identify user-defined templates.)
		deferred
		ensure
			code_not_void: Result /= Void
		end

invariant

	parameters_not_void: parameters /= Void
	no_void_parameter: not STRING_ARRAY_.has (parameters, Void)

end -- class UT_ERROR
