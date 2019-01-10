class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			print ("Failed")
		end

end
