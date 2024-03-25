class AA

inherit

	ISE_SCOOP_RUNTIME
	
create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			g (b)
		end

	g (b: separate BB)
		local
			a: separate ANY
		do
			a := b.f
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

end
