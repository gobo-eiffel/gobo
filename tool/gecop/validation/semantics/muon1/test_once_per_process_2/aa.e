class AA

create

	make

feature

	make
		do
			f
			g
		end

	f
		once ("PROCESS")
			print ("Calling f%N")
		end

	g
		do
			print ("Calling g%N")
		end
		
end
