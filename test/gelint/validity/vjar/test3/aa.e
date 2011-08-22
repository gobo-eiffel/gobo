class AA

create

	make

feature

	make
		local
			b: BB [attached ANY]
			a: attached ANY
		do
			create b
			a := b.f
			if a = Void then
				io.output.put_string ("a = Void%N")
			end
		end

end
