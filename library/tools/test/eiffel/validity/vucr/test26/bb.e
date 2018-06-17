class BB

feature

	f: DD
		local
			b: BOOLEAN
		do
			b := Current /= Void
			create Result
		end

end
