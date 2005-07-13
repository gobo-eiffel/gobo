class AA

create

	make

feature

	make is
		local
			b: BB
		do
			create b
			b.f
			b.f2
		end

end -- class AA
