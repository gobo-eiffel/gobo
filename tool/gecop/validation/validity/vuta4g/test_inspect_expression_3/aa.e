class AA

inherit

	ISE_SCOOP_RUNTIME

create

	make

feature

	make
		local
			b: separate BB
			c: CC
			i1, i2: NATURAL_16
		do
			create b.make
			create c.make
			i1 := g (b, c, 1)
			i2 := g (b, c, 2)
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

	g (b: separate BB; c: CC; x: INTEGER): NATURAL_16
		do
			Result := (inspect x when 1 then b when 2 then c end).f
		end

end
