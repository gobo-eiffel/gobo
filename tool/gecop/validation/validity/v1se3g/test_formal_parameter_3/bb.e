class BB [G -> separate CC]

create

	make

feature

	make (a: G)
		do
			c := a
		end

	c: G

	f
		do
			separate c as x do
				x.g
			end
		end

end
