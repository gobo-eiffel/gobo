class AA

inherit

	BB
		rename
			f as g alias "[]"
		end
		
create

	make

feature

	make
		local
			b: BOOLEAN
		do
			b := g
		end

end
