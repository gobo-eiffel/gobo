class AA

create

	make

feature

	make is
		do
			f
		end

	f is
		local
			a: ANY
		do
			a := cc
		end

	cc: INTEGER_8 = 0x1000
			-- 0x1000 is not representable as an INTEGER_8

end
