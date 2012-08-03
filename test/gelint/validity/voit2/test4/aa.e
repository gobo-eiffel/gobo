class AA

create

	make

feature

	make
		do
			f (1)
		end
		
	f (x: INTEGER)
		local
			bb: BB
			a: detachable ANY
		do
			create bb
			across
				bb
			as
				x
			loop
				a := x
			end
		end

end
