class AA

create

	make

feature

	make
		local
			i: INTEGER
		do
			i := + Current
			print ("Failed")
		end

	f alias "+" alias "+": INTEGER
		do
			Result := 15
		end

end
