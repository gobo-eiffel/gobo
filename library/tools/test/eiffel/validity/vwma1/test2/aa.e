class AA

create

	make

feature

	make
		local
			a: ANY
		do
			a := {like foo} <<"gobo">>
			print (a.generating_type)
		end

	foo: ARRAY [COMPARABLE]
		do
			create Result.make_empty
		end
		
end
