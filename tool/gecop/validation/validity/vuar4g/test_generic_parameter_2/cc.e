class CC [expanded G -> ANY]

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
			if attached {DD} a as d and then attached {STRING} d.name as l_name then
				print ("Argument's attribute in same region as Current%N")
				print ("Region id of Current: ")
				print (region_id (Current))
				print ("%N")
				print ("Region id of argument's attribute: ")
				print (region_id (l_name))
				print ("%N")
			end
			print ("Failed")
		end

end
