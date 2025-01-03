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
			f
		do
			print ("Passed")
		end

	f: BOOLEAN
		do
		end

end
