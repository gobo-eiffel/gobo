class AA
		
create

	make

feature

	make
		local
			a: INTEGER
			b: BB
		do
			create b
			a := b.f
		end

end
