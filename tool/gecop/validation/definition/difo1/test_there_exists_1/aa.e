class AA

create

	make

feature

	make
		local
			i: INTEGER
			a: like Current
		do
			a := Current
			i := a ∃ 2
			print ("Failed")
		end

	f alias "∃" (i: INTEGER): INTEGER
		do
			Result := i + 1
		end

end
