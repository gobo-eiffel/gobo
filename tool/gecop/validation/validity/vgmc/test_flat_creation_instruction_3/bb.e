class BB [G -> ZZ create make end]

feature

	f (c: detachable CC)
		local
			a: G
		do
			create a.make (c)
		end

end
