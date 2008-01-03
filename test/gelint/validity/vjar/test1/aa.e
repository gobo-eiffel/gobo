class AA

create

	make

feature

	make is
		local
			c: CC
		do
			create c
			c.f ("gobo")
			print (c.a.same_items (<<"gobo">>))
		end

end
