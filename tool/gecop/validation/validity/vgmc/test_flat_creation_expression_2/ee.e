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

	make (a: detachable EE)
		do
		end

end
