class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			if b + 5 = 5 and + b = 4 then
				print ("Passed")
			end
		end

end
