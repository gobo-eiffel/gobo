class AA

inherit

	ISE_SCOOP_RUNTIME

create

	make,
	make_separate

feature

	make
		local
			b: BB
			a: separate AA
		do
			b := f
			create a.make_separate
		end

	make_separate
		local
			b: BB
			s: detachable STRING
		do
			b := f
			s := b.name
			if s /= Void and then region_id (Current) /= region_id (s) then
				print ("Region id of Current /= region id of b.name%N")
				print ("Failed")
			else
				print ("Passed")
			end
		end

	f: BB
		once ("PROCESS")
			Result.set_name ("gobo")
		end

end
