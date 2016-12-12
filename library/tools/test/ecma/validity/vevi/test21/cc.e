class CC

inherit

	BB
		redefine
			f
		end

create

	make

feature
	
	f (a: AA)
		local
			aa: AA
		do
			aa := a
			aa.f
		end

end
