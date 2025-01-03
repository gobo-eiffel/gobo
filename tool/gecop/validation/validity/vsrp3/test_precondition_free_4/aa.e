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
		require else
			True
		do
			print ("Passed")
		end

end
