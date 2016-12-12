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
			s1: detachable STRING
			bb: BB
			b: BOOLEAN
		do
			s1 := "foo"
			create bb
			b := across bb as s1 some s1 /= Void end
		end

end
