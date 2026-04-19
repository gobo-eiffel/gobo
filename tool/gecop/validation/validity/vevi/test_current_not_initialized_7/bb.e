class BB

feature

	f (a: AA)
		do
			g (a)
		ensure
			class
		end

	g (a: AA)
		local
			b: BOOLEAN
		do
			b := a.b.is_empty
		ensure
			class
		end

end
