class BB

feature

	f
		note
			option: "instance_free"
		local
			p: POINTER
		do
			p := $Current
		end

end
