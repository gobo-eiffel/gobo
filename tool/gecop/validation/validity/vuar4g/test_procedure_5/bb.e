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
		do
			if not attached {ANY} a as aa then
				print ("Argument not in same region as Current%N")
				print ("Failed")
			elseif region_id (Current) /= region_id (aa) then
				print ("Region id of Current /= region id of argument%N")
				print ("Failed")
			else
				print ("Passed")
			end
		end

end
