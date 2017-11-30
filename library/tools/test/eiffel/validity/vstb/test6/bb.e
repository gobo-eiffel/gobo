class BB

feature

	f
		do
				-- It's OK to call an instance-free feature
				-- from a non-instance-free feature.
			print (g)
		end

	g: INTEGER
		note
			option: instance_free
		do
			Result := 6
		end
		
end
