class BB [G]

inherit

	ISE_SCOOP_RUNTIME

create

	make

feature

	make
		do
		end

	g (c: separate CC [G])
		local
			d: DD [G]
			s: detachable G
		do
			d := c.f
			s := d.name
			if s /= Void then
				print ("Result's attribute in same region as Current%N")
				print ("Region id of Current: ")
				print (region_id (Current))
				print ("%N")
				print ("Region id of result's attribute: ")
				print (region_id (s))
				print ("%N")
			end
			print ("Failed")
		end

end
