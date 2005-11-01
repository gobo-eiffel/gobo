expanded class CHARACTER

inherit

	CHARACTER_REF
		redefine
			out
		end

feature

	out: STRING is
			-- Printable representation of character
		do
			create Result.make (1)
			Result.append_character (Current)
		end

	upper: CHARACTER is
		do
			if Current >= 'a' and Current <= 'z' then
				Result := (code - ('a').code + ('A').code).to_character
			else
				Result := Current
			end
		end

	lower: CHARACTER is
		do
			if Current >= 'A' and Current <= 'Z' then
				Result := (code - ('A').code + ('a').code).to_character
			else
				Result := Current
			end
		end

end
