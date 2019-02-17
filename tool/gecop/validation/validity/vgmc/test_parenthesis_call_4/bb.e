class BB [G -> {CC, DD}]

inherit

	ZZ [G]
		redefine
			f
		end

create

	make
	
feature

	f: G
		local
			i: INTEGER
		do
			i := Precursor (5)
			Result := item
		end

end
