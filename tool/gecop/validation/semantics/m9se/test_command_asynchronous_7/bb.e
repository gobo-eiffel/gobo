class BB

create

	make

feature

	make (a: separate AA)
		do
			aa := a
		end

	aa: separate AA

	m
		do
			f (aa)
		end

	f (a: separate AA)
		do
			a.g
			print ("Passed")
		end

end
