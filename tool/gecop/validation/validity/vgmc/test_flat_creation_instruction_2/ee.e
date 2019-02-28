class EE

inherit

	CC
		rename
			make_c as make
		redefine
			make
		end
	
	DD
		rename
			make_d as make
		redefine
			make
		end

create

	make

feature

	make
		do
			print ("Passed")
		end

end
