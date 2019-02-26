class AA

create

	make

feature

	make
		local
			x: XX [EE]
			e: EE
		do
			create e
			create x
			x.g (e)
			print ("Passed")
		end

end
