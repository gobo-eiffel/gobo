class BB

feature

	f
		note
			option: instance_free
		do
			g
		end
		
	g
		local
			a: BOOLEAN
		do
			a := Current /= Void
		end

end
