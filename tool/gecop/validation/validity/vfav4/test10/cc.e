class CC

inherit

	BB
		rename
			f as g alias "+" convert
		end

create
	
	make

convert

	to_d: {DD}

feature

	to_d: DD
		do
			create Result.make (attr * 10)
		end

end