class AA

create

	make

feature

	make
		local
			c: CC
			d: DD
		do
			create c.make (2)
			create d.make (4)
			if c + d = 24 then
				print ("Passed")
			end
		end

end
