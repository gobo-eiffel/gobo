class AA

create

	make

feature

	make
		local
			a: ANY
		do
			a :=  f
		end

	f: BB
		do
			Result.f
			print ("Failed")
		end
	
end
