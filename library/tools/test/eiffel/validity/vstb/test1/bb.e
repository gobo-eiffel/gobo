class BB

feature

	f
		note
			option: instance_free
		local
			i: INTEGER
		do
			i := attr
		end
		
	attr: INTEGER

end
