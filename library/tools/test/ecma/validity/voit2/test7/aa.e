class AA

create

	make

feature

	make
		local
			bb: BB
			a: detachable ANY
		do
			create bb
			across
				f (across bb as x all x /= Void end)
			as
				x
			from
				if not x.after then
					x.forth
				end
			loop
				a := x
			end
		end

	f (b: BOOLEAN): BB
		do
			create Result
		end

end
