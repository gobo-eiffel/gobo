class AA

create

	make

feature

	make
		local
			s: detachable STRING
		do
			across s as c loop end
			print ("Failed")
		end
	
end
