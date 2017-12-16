class BB

feature

	f
		note
			option: "instance_free"
		local
			b: BB
		do
			b := Current
		end

end
