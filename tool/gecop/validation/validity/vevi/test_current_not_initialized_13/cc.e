class CC

feature

	f (a: AA)
		local
			b: BOOLEAN
		do
			b := a.b.is_valid
		ensure
			class
		end

end
