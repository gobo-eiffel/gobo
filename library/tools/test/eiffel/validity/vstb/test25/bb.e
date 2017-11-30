class BB

feature

	f
		note
			option: instance_free
		local
			a: ANY
		do
			a := agent Current.out
		end

end
