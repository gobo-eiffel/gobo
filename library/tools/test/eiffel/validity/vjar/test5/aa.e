class AA
		
create

	make

feature

	make
		local
			bb: BB
			cc: CC
		do
			create cc
			bb := cc
		end

end
