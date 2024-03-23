class AA

create

	make

feature

	make
		local
			t: separate TUPLE [BB]
			b: BB
		do
			b.set_name ("eiffel")
			t := [b]
			f (t)
		end

	f (t: separate TUPLE [b: BB])
		local
			b: BB
		do
			b := t.b
		end

end
