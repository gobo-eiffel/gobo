class BB
	
create

	make

feature

	make (a: AA)
		local
			aa: AA
		do
			aa := a
			across aa as l_all loop end
		end
		
end
