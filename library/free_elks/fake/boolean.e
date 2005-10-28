expanded class BOOLEAN

inherit

	ANY
		redefine
			out
		end

feature

	out: STRING is
			-- Printable representation of boolean
		do
			if Current then
				Result := "True"
			else
				Result := "False"
			end
		end

	infix "and" (other: like Current): like Current is
		external
			"built_in"
		end

	infix "and then" (other: like Current): like Current is
		external
			"built_in"
		end

	infix "or" (other: like Current): like Current is
		external
			"built_in"
		end

	infix "or else" (other: like Current): like Current is
		external
			"built_in"
		end

	infix "xor" (other: like Current): like Current is
		external
			"built_in"
		end

	infix "implies" (other: like Current): like Current is
		external
			"built_in"
		end

	prefix "not": like Current is
		external
			"built_in"
		end

end
