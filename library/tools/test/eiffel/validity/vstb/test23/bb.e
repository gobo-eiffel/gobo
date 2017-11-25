class BB

feature

	f
		note
			option: "instance_free"
		local
			a: ANY
		do
			a := agent g
		end

	g
		note
			option: "instance_free"
		do
		end

end
