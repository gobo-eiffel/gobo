class BB

create

	make

feature

	make
		do
		end

	f: CC
		local
			d: DD
		do
			d.set_name ("eiffel")
			Result.set_d (d)
			print ("Failed")
		end

end
