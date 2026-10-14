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
			when {AA}.g .. {AA}.f then
			else
			end
			print ("Failed")
		end
	
	f: INTEGER = unique
	g: INTEGER = unique

end
