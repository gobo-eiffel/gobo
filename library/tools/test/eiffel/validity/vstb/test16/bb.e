class BB

feature

	f: like Current
		note
			option: "instance_free"
		do
				-- It's OK to use 'like Current' in instance-free features.
			create Result
		end

	g: INTEGER
		do
			Result := 16
		end

end
