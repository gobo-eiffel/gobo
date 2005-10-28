class CHARACTER_REF

inherit

	COMPARABLE
		redefine
			infix ">",
			infix ">=",
			infix "<="
		end

feature

	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		external
			"built_in"
		end

	infix ">" (other: like Current): BOOLEAN is
		external
			"built_in"
		end

	infix "<=" (other: like Current): BOOLEAN is
		external
			"built_in"
		end

	infix ">=" (other: like Current): BOOLEAN is
		external
			"built_in"
		end

end
