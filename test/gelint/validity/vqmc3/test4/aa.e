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
			a := cc
		end

	cc: INTEGER_8 = 0b100000000
			-- 0b100000000 (i.e. 256) is not representable as an INTEGER_8

end
