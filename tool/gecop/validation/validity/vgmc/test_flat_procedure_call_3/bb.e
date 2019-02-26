class BB
	
feature
	
	z: ZZ
		do
			create Result
		end
	
	g (c: CC)
		do
			z.f (c)
		end

end
