class BB

feature

	f
		local
			a: ANY
		do
			a := agent g.out
		ensure
			class_feature: class
		end

	g: BB
		do
			Result := Current
		end

end
