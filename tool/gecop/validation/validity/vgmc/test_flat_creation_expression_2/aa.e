class AA

create

	make

feature

	make
		local
			x: XX [EE]
		do
			create x
			x.f (Void)
			print ("Failed")
		end

end
