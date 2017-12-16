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

	cc: INTEGER_8 = 0x1000
			-- 0x1000 is not representable as an INTEGER_8

end
