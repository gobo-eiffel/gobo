class BB

feature

	f: like attr
		note
			option: "instance_free"
		do
				-- It's OK to use 'like attr' in instance-free features.
			Result := 17
		end

	attr: INTEGER

end
