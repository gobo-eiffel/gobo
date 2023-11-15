class BB [G -> CC create make end]

create

	make

feature

	make
		local
			c: separate G
		do
			create c.make
			separate c as x do
				x.f
			end
		end

end
