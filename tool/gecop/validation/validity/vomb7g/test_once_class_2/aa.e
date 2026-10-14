class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.f
			inspect b
			when {detachable BB}.f then
			else
			end
			print ("Passed")
		end
	
end
