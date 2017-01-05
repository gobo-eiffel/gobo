class AA

create

	make

feature

	make
		do
			f
		end

	f
		local
			b: BOOLEAN
			s1: detachable STRING
		do
			b := across g (attached s1 as x1) as x1 all x1.item /= Void end
		end

	g (b: BOOLEAN): detachable BB
		do
			create Result
		end
		
end
