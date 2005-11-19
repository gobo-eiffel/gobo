expanded class INTEGER

inherit

	INTEGER_REF
		redefine
			to_reference,
			out, hash_code
		end

create
	default_create,
	make_from_reference

convert
	make_from_reference ({INTEGER_REF}),
	to_reference: {INTEGER_REF, NUMERIC, COMPARABLE, PART_COMPARABLE, HASHABLE, ANY}

feature -- Conversion

	to_reference: INTEGER_REF is
			-- Associated reference of Current
		do
			create Result
			Result.set_item (Current)
		end

feature

	out: STRING is
		do
			create Result.make (10)
			Result.append_integer (Current)
		end

	hash_code: INTEGER is
		do
			if Current >= 0 then
				Result := Current
			else
				Result := -(Current + 1)
			end
		end

	infix "+" (other: like Current): like Current is
		external
			"built_in"
		end

	infix "-" (other: like Current): like Current is
		external
			"built_in"
		end

	infix "*" (other: like Current): like Current is
		external
			"built_in"
		end

	infix "/" (other: like Current): DOUBLE is
		external
			"built_in"
		end

	infix "//" (other: like Current): like Current is
		external
			"built_in"
		end

	infix "\\" (other: like Current): like Current is
		external
			"built_in"
		end

	prefix "+": like Current is
		do
			Result := Current
		end

	prefix "-": like Current is
		external
			"built_in"
		end

	to_character: CHARACTER is
		external
			"built_in"
		end

	bit_or (i: like Current): like Current is
		external
			"built_in"
		end

	infix "|" (i: like Current): like Current is
		do
			Result := bit_or (i)
		end

	bit_and (i: like Current): like Current is
		external
			"built_in"
		end

	infix "&" (i: like Current): like Current is
		do
			Result := bit_and (i)
		end

	bit_shift_left (n: INTEGER): like Current is
		external
			"built_in"
		end

end
