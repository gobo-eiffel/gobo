note

	description:

		"Skeletons for parser token declarations"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class YY_PARSER_TOKENS

inherit

	ANY

	KL_SHARED_PLATFORM
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	token_name (a_token: INTEGER): STRING is
			-- Name of token `a_token'
		deferred
		ensure
			token_name_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	yy_character_token_name (a_token: INTEGER): STRING is
			-- Name of character token `a_token'
		local
			c: CHARACTER
			i, j, k: INTEGER
		do
			if a_token >= Platform.Minimum_character_code and a_token <= Platform.Maximum_character_code then
				c := INTEGER_.to_character (a_token)
				inspect c
				when '%B' then
					Result := "%'\b%'"
				when '%F' then
					Result := "%'\f%'"
				when '%N' then
					Result := "%'\n%'"
				when '%R' then
					Result := "%'\r%'"
				when '%T' then
					Result := "%'\t%'"
				when '%'' then
					Result := "%'\%'%'"
				when '%"' then
					Result := "%'\%"%'"
				when ' ', '!', '#', '$', '&', '(' .. '~' then
					create Result.make (3)
					Result.append_character ('%'')
					Result.append_character (c)
					Result.append_character ('%'')
				else
					create Result.make (6)
					Result.append_character ('%'')
					Result.append_character ('\')
					if a_token = 0 then
						Result.append_character ('0')
					else
						if a_token < 0 then
							Result.append_character ('-')
							k := -a_token
							i := 4
						else
							k := a_token
							i := 3
						end
						from
						until
							k = 0
						loop
							inspect k \\ 8
							when 0 then
								Result.append_character ('0')
							when 1 then
								Result.append_character ('1')
							when 2 then
								Result.append_character ('2')
							when 3 then
								Result.append_character ('3')
							when 4 then
								Result.append_character ('4')
							when 5 then
								Result.append_character ('5')
							when 6 then
								Result.append_character ('6')
							when 7 then
								Result.append_character ('7')
							end
							k := k // 8
						end
						from
							j := Result.count
						until
							i >= j
						loop
							c := Result.item (i)
							Result.put (Result.item (j), i)
							Result.put (c, j)
							i := i + 1
							j := j - 1
						end
					end
					Result.append_character ('%'')
				end
			else
				Result := "Unknown token"
			end
		ensure
			character_token_name_not_void: Result /= Void
		end

end
