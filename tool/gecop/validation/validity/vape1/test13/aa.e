class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			f (b)
		end

feature {ANY}

	f (b: BB)
		require
			across b as c all True end
		do
			print ("Failed")
		end
		
end
