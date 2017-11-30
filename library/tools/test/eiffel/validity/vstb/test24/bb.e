class BB

feature

	f
		note
			option: instance_free
		local
			a: ANY
		do
			a := agent g.out
		end

	g: BB
		do
			Result := Current
		end

end
