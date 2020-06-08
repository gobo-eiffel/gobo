class BB

feature

	f: like g
		attribute
			print ("Self-initialization of f%N")
			Result := "foo"
		end

	g: detachable STRING
		do
			Result := "bar"
		end

end
