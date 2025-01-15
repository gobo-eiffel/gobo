class AA

create

	make

feature
	
	make
		local
			b: detachable BB
			a: detachable ANY
		do
			a := b
			print ("Failed")
		end

end
