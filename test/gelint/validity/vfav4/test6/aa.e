class AA

inherit

	BB
		rename
			f as g alias "()"
		end
		
create

	make

feature

	make
		do
			g
		end

end
