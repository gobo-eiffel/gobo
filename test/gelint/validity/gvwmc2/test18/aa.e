class AA

create

	make

feature

	make
		do
			f
		end

	f
		local
			a: ANY
		do
				-- +0b10000000 (i.e. 128) is not representable as an INTEGER_8,
				-- even though ISE compiler considers that 0b10000000 (with no sign)
				-- as representable as an INTEGER_8 (with value -128).
			a := {INTEGER_8} +0b10000000
		end

end
