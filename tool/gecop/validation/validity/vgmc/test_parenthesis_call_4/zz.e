class ZZ [G -> {CC, DD}]

create

	make
	
feature

	make (a: G)
		do
			item := a
		end
		
	f: G
		do
			Result := item
		end

	item: G

end
