class DD

feature

	g alias "()" (i: INTEGER): ANY
		do
			print ("Failed DD.g")
			Result := "DD.g"
		end

end
