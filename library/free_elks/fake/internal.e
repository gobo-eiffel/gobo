class INTERNAL

feature

	dynamic_type (object: ANY): INTEGER is
			-- Dynamic type of `object'
		require
			object_not_void: object /= Void
		do
			print ("TODO: INTERNAL.dynamic_type%N")
		ensure
			dynamic_type_nonnegative: Result >= 0
		end

end
