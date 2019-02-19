class XX [G -> {DD, CC}]

inherit

	BB
		redefine
			z, c
		end

create

	make

feature

	make (a: G)
		do
			z := a
		end
		
	z: G
	
	c: detachable CC
	
end
