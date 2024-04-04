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
			h (b)
		end

	f (b: separate BB)
		do
			b.g
		end

	h (b: separate BB)
		local
			s: separate STRING
		do
			s := b.out
			print ("Failed")
		end

end
