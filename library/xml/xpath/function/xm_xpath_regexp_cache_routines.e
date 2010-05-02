note

	description:

		"Rutines for regular expression caches"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REGEXP_CACHE_ROUTINES

inherit

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	are_normalized_flags (a_flags_string: STRING): BOOLEAN
			-- Is `a_flags_string' a set of normalized flags?
		require
			flags_not_void: a_flags_string /= Void
		local
			i_present, m_present, s_present, x_present: BOOLEAN
			an_index: INTEGER
		do
			from
				Result := True
				an_index := 1
			until
				Result = False or else an_index > a_flags_string.count
			loop
				inspect
					a_flags_string.item (an_index)
				when 'i' then
					if i_present or else m_present or else s_present or else x_present then
						Result := False
					else
						i_present := True
					end
				when 'm' then
					if m_present or else s_present or else x_present then
						Result := False
					else
						m_present := True
					end
				when 's' then
					if s_present or else x_present then
						Result := False
					else
						s_present := True
					end
				when 'x' then
					Result := not x_present
				else
					Result := False
				end
				an_index := an_index + 1
			end
		end

	normalized_flags_string (a_flags_string: STRING): STRING
			-- Normalized version of `a_flags_string'
		require
			flags_not_void: a_flags_string /= Void
		local
			i_present, m_present, s_present, x_present, alien_present: BOOLEAN
			an_index: INTEGER
		do

			-- Normalization consists of reducing the string to at most one
			--  instance of each of the four flags, i, m,s and x, and ordering them so.
			-- If any other non-blank characters are present in the string, then
			--  it is invalid (a static error should be signalled), and `Void' is returned.

			from
				an_index := 1
			until
				alien_present or else an_index > a_flags_string.count
			loop
				inspect
					a_flags_string.item (an_index)
				when 'i' then
					i_present := True
				when 's' then
					s_present := True
				when 'm' then
					m_present := True
				when 'x' then
					x_present := True
				else
					alien_present := True
				end
				an_index := an_index + 1
			end
			if not alien_present then
				create Result.make (0)
				if i_present then Result.append_character ('i') end
				if m_present then Result.append_character ('m') end
				if s_present then Result.append_character ('s') end
				if x_present then Result.append_character ('x') end
			end
		ensure
			normalized: Result /= Void implies are_normalized_flags (Result)
		end

	composed_key (a_pattern, a_flags_string: STRING): STRING
			-- Concatenation of `a_pattern' with `a_flags_string', separated by an invalid XML character
		require
			pattern_not_void: a_pattern /= Void
			flags_not_void: a_flags_string /= Void
			normalised_flags: are_normalized_flags (a_flags_string)
		do
			Result := STRING_.concat (a_pattern, "%/1/")
			Result := STRING_.appended_string (Result, a_flags_string)
		ensure
			composed_key_not_void: Result /= Void
			correct_count: Result.count =  a_pattern.count + a_flags_string.count + 1
		end

end

