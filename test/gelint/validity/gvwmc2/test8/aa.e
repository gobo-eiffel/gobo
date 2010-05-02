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

	cc: INTEGER_16 = {INTEGER_8} 128
			-- 128 is not representable as an INTEGER_8,
			-- even though it is representable as an INTEGER_16

end
