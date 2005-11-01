class INTEGER_REF

inherit

	COMPARABLE
		undefine
			is_equal
		redefine
			infix ">",
			infix ">=",
			infix "<="
		end

	HASHABLE

feature

	hash_code: INTEGER is
		do
		end

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
