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
			when {AA}.f then
			when {BB}.g .. {BB}.h then
			else
			end
			print ("Failed")
		end
	
	f: INTEGER = unique
	g: INTEGER = unique
	
end
