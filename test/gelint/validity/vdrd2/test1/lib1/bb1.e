class BB1

create

	make

feature

	make
		do
		end

	d: like Current
			-- attached BB1
		attribute
			create Result.make
		end

	f
		do
			d.g
		end
	
	g
		do
			print ("g")
		end
		
end
