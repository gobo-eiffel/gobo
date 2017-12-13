class AA

create

	make

feature

	make
		do
				-- This code is not void-safe on purpose.
			if 2 /= 3 then
				attr := "10"
			end
			print (attr)
		end
	
	attr: detachable STRING

end
