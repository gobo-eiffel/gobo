class AA

create

	make

feature

	make
		local
			bb: BB
			s: detachable STRING
			b: BOOLEAN
		do
			create bb
			b := bb and then attached s as l and then l.is_empty
		end

end
