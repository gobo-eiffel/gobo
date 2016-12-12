class AA

create

	make

feature

	make
		local
			b: BB [attached ANY]
			a: attached ANY
			c: attached ANY
		do
			create b
			create a
			c := b.f (a)
			if c = Void then
				io.output.put_string ("c = Void%N")
			end
		end

end
