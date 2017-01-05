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
		end

end -- class AA
