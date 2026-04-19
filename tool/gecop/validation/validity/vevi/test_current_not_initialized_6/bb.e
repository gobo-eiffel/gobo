class BB

feature

	f (a: AA)
		local
			b: BOOLEAN
		do
			b := a.b.is_empty
		ensure
			class
		end

end
