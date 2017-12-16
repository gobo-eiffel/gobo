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
			exp: BB
			a: BOOLEAN
		do
			create exp
			a := across exp as c some c /= "gobo" end
		end

end
