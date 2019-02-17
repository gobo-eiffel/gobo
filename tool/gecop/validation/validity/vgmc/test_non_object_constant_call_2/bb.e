class BB [G -> {CC, DD}]

feature

	f
		local
			i: INTEGER
		do
			i := {G}.f
		end

end
