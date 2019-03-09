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
			create x.make (e)
			x.g
			print ("Failed")
		end

end
