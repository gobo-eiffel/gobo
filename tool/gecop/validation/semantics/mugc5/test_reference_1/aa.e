class AA

create

	make

feature

	make
		do
			create b
			f (b)
		end

	b: BB

	f (a: BB)
		do
			if a = b then
				print ("Passed")
			else
				print ("Failed")
			end
		end

end
