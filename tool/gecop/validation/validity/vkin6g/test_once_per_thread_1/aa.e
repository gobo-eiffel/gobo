class AA

create

	make,
	make_separate

feature

	make
		local
			b: BB
			s: detachable STRING
			a: separate AA
		do
			create b.make
			s := b.attr
			create a.make_separate
		end

	make_separate
		local
			b: BB
			s: detachable STRING
		do
			create b.make
			s := b.attr
			print ("Passed")
		end

end
