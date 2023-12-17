class CC [G]

inherit

	ISE_SCOOP_RUNTIME

create

	make

feature

	make
		do
		end

	f (a: G)
		do
			if attached {ANY} a as sa then
				print ("Argument in same region as Current%N")
				print ("Region id of Current: ")
				print (region_id (Current))
				print ("%N")
				print ("Region id of argument: ")
				print (region_id (sa))
				print ("%N")
			end
			print ("Failed")
		end

end
