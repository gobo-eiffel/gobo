class BB

feature

	f
		note
			option: instance_free
		local
			p: POINTER
		do
				-- It's OK to get the address of a non-instance-free
				-- feature from an instance-free feature.
			p := $g
		end

	g: BOOLEAN
		do
			Result := Current /= Void
		end

end
