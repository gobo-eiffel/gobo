class AA

create

	make

feature

	make
		local
			x: XX [EE]
			e: EE
			c: CC
		do
			create e
			create x.make (e)
			create c
			x.g (c)
			print ("Failed")
		end

end
