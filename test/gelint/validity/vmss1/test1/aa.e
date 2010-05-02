class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			b.f
			b.f2
		end

end -- class AA
