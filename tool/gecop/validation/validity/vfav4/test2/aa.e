class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
		do
			create b.make (2)
			create c.make (4)
			if b + c = 24 then
				print ("Passed")
			end
		end

end
