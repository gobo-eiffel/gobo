class BB

feature

	f: INTEGER
		note
			option: instance_free
		do
				-- It's OK to call an instance-free feature
				-- from another instance-free feature.
			Result := g
		end
		
	g: INTEGER
		note
			option: instance_free
		do
			Result := 8
		end

end
