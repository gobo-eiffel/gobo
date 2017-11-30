class BB

feature

	f
		local
			p: POINTER
		do
				-- It's OK to get the address of a non-instance-free
				-- feature from an instance-free feature.
			p := $g
		ensure
			class_feature: class
		end

	g: BOOLEAN
		do
			Result := Current /= Void
		end

end
