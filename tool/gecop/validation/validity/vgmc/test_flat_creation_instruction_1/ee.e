class EE

inherit

	CC
		redefine
			make
		end
	
	DD
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
