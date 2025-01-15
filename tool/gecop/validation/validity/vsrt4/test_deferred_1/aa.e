deferred class AA

inherit

	ANY
		redefine
			default_create
		end

feature
	
	default_create
		do
			print ("Failed")
		end

end
