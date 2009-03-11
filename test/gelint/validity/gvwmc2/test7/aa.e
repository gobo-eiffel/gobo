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
				-- 128 is not representable as an INTEGER_8.
			a := {INTEGER_8} 128
		end

end
