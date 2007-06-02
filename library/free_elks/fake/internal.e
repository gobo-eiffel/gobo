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

	field_name (i: INTEGER; object: ANY): STRING is
			-- Name of `i'-th field of `object'
		do
			print ("TODO: INTERNAL.field_name%N")
		end

	field_count (object: ANY): INTEGER is
			-- Number of logical fields in `object'
		do
			print ("TODO: INTERNAL.field_count%N")
		end

	field_static_type_of_type (i: INTEGER; type_id: INTEGER): INTEGER is
			-- Static type of declared `i'-th field of dynamic type `type_id'
		do
			print ("TODO: INTERNAL.field_count%N")
		end

end
