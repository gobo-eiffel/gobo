class BB [G -> CC create make end]

create

	make

feature

	make
		do
		end

	f
		require
			(create {G}.make).g
		do
			print ("Failed")
		end

end
		

