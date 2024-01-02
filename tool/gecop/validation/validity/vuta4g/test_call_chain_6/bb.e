class BB

create

	make

feature

	make
		do
		end


	c: like Current
		do
			create Result.make
		end

	f
		do
			print ("Passed")
		end

end
