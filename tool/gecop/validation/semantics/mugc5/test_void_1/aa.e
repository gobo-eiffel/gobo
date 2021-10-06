class AA

create

	make

feature

	make
		do
			f (Void)
		end

	f (a: detachable ANY)
		do
			if a = Void then
				print ("Passed")
			else
				print ("Failed")
			end
		end

end
