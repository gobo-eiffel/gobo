class BB

feature

	f
		note
			option: "instance_free"
		local
			p: POINTER
		do
			p := $attr
		end

	attr: STRING

end
