class BB

inherit

	ISE_SCOOP_RUNTIME

create

	make

feature

	make
		do
		end

	f (a: separate ANY)
		local
			s: detachable STRING
		do
			if not attached {ANY} a as aa then
				print ("Argument not in same region as Current%N")
				print ("Failed")
			elseif region_id (Current) /= region_id (aa) then
				print ("Region id of Current /= region id of argument%N")
				print ("Failed")
			elseif not attached {CC} aa as c then
				print ("Argument not of type CC%N")
				print ("Failed")
			else
				s := c.name
				if s = Void then
					print ("c.name not attached%N")
					print ("Failed")
				elseif region_id (Current) /= region_id (s) then
					print ("Region id of Current /= region id of c.name%N")
					print ("Failed")
				else
					print ("Passed")
				end
			end
		end

end
