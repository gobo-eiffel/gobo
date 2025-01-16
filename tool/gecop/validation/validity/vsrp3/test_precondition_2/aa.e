class AA

inherit

	BB
		redefine
			make
		end

create

	make

feature
	
	make
		do
			print ("Failed")
		end

end
