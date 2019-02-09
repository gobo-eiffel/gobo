class AA

create

	make

feature

	make
		local
			b: detachable BB [CC]
		do
			if b /= Void then
				b.f
			end
			print ("Failed")
		end

end
