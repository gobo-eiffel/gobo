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
		end

end -- class AA
