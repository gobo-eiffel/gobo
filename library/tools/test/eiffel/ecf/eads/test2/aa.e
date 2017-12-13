class AA

create

	make

feature

	make
		do
				-- This code is not void-safe on purpose.
			if 2 /= 3 then
				attr := "15"
			end
			print (attr)
		end
	
	attr: detachable STRING

end
