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
				-- 0c200 (i.e. 128) is not representable as an INTEGER_8.
			a := {INTEGER_8} 0c200
		end

end
