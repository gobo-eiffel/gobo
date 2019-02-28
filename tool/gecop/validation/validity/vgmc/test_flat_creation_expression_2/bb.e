class BB [G -> ZZ create make end]

feature

	f (c: detachable CC)
		local
			a: ANY
		do
			a := create {G}.make (c)
		end

end
