class AA

create

	make

feature

	make
		local
			b: detachable BB
		do
			inspect b
			when {BB}.f then
			else
			end
			print ("Failed")
		end
	
end
