class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			f (b)
		end

	f (b: separate BB)
		local
			i: INTEGER
			l_retried: BOOLEAN
		do
			if not l_retried then
				b.g
				i := b.x
			else
				b.h
			end
		rescue
			if not l_retried then
				l_retried := True
				retry
			end
		end

end
