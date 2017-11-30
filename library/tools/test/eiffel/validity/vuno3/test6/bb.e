class BB

feature

	f: INTEGER
		do
			Result := 56
		ensure
			foo: agent do ensure class_feature: class end /= Void
		end

end
