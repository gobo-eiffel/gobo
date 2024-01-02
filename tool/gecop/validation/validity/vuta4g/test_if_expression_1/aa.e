class AA

create

	make

feature

	make
		local
			b: separate BB
			c: separate CC
			i1, i2: NATURAL_16
		do
			create b.make
			create c.make
			i1 := g (b, c, True)
			i2 := g (b, c, False)
			if i1 = i2 then
					-- The two calls should be on different SCOOP regions.
				print ("Failed")
			else
				print ("Passed")
			end
		end

	g (b: separate BB; c: separate CC; x: BOOLEAN): NATURAL_16
		do
			Result := (if x then b else c end).f
		end

end
