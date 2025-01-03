class BB

inherit

	CC
		redefine
			make
		end

feature
	
	make
		require else
			True
		do
		end

end
