class AA
	
create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			g (b)
		end

	g (b: separate BB)
		local
			i: INTEGER
		do
			i := b.f
			print ("Passed")
		end

end
