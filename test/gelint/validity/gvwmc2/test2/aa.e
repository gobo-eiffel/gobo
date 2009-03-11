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
				-- {INTEGER_64}.Min_value - 1
			a := -0x8000000000000001
		end

end
