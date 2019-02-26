class AA

create

	make

feature

	make
		local
			b: BB [detachable NONE]
		do
			create b
			b.f (Void)
			print ("Failed")
		end

end
