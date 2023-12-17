class AA

create

	make

feature

	make
		local
			t: separate TUPLE [STRING]
		do
			t := ["gobo"]
			f (t)
		end

	f (t: separate TUPLE [name: STRING])
		do
			t.name := "eiffel"
		end

end
