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
			s: detachable STRING
		do
			a := f
			if not attached {ANY} a as aa then
				print ("Result not in same region as Current%N")
				print ("Failed")
			elseif region_id (Current) /= region_id (aa) then
				print ("Region id of Current /= region id of result%N")
				print ("Failed")
			elseif not attached {BB} aa as b then
				print ("Result not of type CC%N")
				print ("Failed")
			else
				s := b.name
				if s = Void then
					print ("b.name not attached%N")
					print ("Failed")
				elseif region_id (Current) /= region_id (s) then
					print ("Region id of Current /= region id of b.name%N")
					print ("Failed")
				else
					print ("Passed")
				end
			end
		end

	f: separate ANY
		local
			b: BB
			a: ANY
		once ("PROCESS")
			b.set_name ("gobo")
			a := b
			Result := a
		end

end
