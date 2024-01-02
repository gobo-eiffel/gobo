class AA

inherit

	ISE_SCOOP_RUNTIME

create

	make

feature

	make
		local
			b: separate BB
			i1, i2: NATURAL_16
		do
			create b.make
			i1 := g (b, True)
			i2 := g (b, False)
			if i1 = i2 then
					-- The two calls should be on different SCOOP regions.
				print ("Failed")
			elseif i2 /= region_id (Current) then
					-- The call on `c` should be on the same SCOOP region 
					-- as the current region.
				print ("Failed")
			else
				print ("Passed")
			end
		end

	g (b: separate BB; x: BOOLEAN): NATURAL_16
		local
			c: CC
		do
			create c.make
			Result := (if x then b else c end).f
		end

end
