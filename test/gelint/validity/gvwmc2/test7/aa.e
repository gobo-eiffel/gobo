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
				-- 128 is not representable as an INTEGER_8.
			a := {INTEGER_8} 128
		end

end
