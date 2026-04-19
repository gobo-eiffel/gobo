class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.default_create
			print ("Failed")
		end

end
