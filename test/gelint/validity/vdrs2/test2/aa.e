class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			print (b.f)
		end

end -- class AA
