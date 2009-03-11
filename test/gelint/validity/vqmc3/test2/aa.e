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

	cc: INTEGER_8 = 128
			-- 128 is not representable as an INTEGER_8

end
