class AA

create

	make

feature

	make
		do
			print (f)
		end

	f: like g
		once ("OBJECT")
			Result := "gobo"
		end

	g: STRING
		do
			Result := "foo"
		end

end
