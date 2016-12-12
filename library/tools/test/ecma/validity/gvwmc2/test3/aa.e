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
				-- 0x1000 is not representable as an INTEGER_8.
			a := {INTEGER_8} 0x1000
		end

end
