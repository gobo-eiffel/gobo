class CC

feature

	f alias "()" (i: INTEGER): ANY
		do
			print ("Failed CC.f")
			Result := "CC.f"
		end

end
