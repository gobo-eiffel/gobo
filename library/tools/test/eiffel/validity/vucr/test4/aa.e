class AA
		
create

	make

feature

	make
		local
			a: INTEGER
			b: detachable BB
		do
			if b /= Void then
				a := b.f
			end
			print ("21")
		end

end
