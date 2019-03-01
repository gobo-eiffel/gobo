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
			create x
			create e
			create c
			x.g (e, c)
			print ("Failed")
		end

end
