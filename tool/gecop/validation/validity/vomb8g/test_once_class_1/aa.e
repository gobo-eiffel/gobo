class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.f
			inspect b
			when {BB}.f then
			else
			end
			print ("Failed")
		end
	
end
