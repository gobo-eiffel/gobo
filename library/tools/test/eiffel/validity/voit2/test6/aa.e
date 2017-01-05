class AA

create

	make

feature

	make
		local
			bb: BB
			b: BOOLEAN
		do
			create bb
			across
				bb
			as
				x
			loop
				b := across bb as x all x /= Void end
			end
		end

end
