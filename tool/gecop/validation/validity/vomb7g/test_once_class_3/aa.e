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
			when 1 then
			else
			end
			print ("Failed")
		end
	
end
