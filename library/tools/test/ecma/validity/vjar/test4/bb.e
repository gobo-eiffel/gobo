class BB [G -> ANY]

create

	make
	
feature

	make (a_foo: G)
		do
			foo := a_foo
		end
		
	foo: G
	
	f
		local
			s: like foo.out
		do
			s := foo.out
		end
	
end
