class BB
	
feature
	
	z: ZZ
		do
			create Result
		end
	
	g
		local
			i: like z.f
		do
			i := create {EE}
		end

end
