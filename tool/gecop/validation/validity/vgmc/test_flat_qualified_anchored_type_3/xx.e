class XX [G -> {DD, CC}]

inherit

	BB
		redefine
			z
		end

create

	make

feature

	make (a: G)
		do
			z := a
		end
		
	z: G
	
end
