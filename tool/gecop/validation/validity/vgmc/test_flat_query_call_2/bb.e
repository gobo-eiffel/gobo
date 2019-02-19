class BB
	
feature
	
	z: ZZ
		do
			create Result
		end
	
	c: detachable ZZ
	
	f
		local
			i: like c
		do
			i := z.f
		end

end
