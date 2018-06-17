class AA
		
create

	make

feature

	make
		local
			b: detachable BB
		do
			if b /= Void then
				b.f
			end
			print ("22")
		end

end
