class AA

create

	make

feature

	make
		local
			b: INTEGER
		do
			b := f
			inspect b
			when -1 .. {AA}.f then
			else
			end
			print ("Failed")
		end
	
	f: INTEGER = unique

end
