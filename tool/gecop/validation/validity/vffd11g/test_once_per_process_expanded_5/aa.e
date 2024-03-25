class AA

inherit

	ISE_SCOOP_RUNTIME

create

	make,
	make_separate

feature

	make
		local
			b: separate ANY
			a: separate AA
		do
			b := f
			create a.make_separate
		end

	make_separate
		local
			a: separate ANY
		do
			a := f
			if not attached {ANY} a as aa then
				print ("Result not in same region as Current%N")
				print ("Failed")
			elseif region_id (Current) /= region_id (aa) then
				print ("Region id of Current /= region id of result%N")
				print ("Failed")
			else
				print ("Passed")
			end
		end

	f: separate ANY
		local
			a: ANY
		once ("PROCESS")
			a := 2
			Result := 2
		end

end
