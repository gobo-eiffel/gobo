class CC

inherit

	BB
		export
			{YY} f
		redefine
			f
		end

feature {ZZ}

	f (s: STRING)
		do
			print (s)
		end

end
