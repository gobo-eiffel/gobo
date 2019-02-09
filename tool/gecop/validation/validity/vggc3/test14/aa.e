class AA

create

	make

feature

	make
		local
			b: BB [CC [ANY]]
		do
			create b
			b.f
		end

end
