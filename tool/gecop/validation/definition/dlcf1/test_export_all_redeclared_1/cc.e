class CC

inherit

	BB
		export
			{YY} all
		redefine
			f
		end

	ANY

feature {ZZ}

	f (s: STRING)
		do
			print (s)
		end

end
