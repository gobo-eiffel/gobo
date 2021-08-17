note

	description:

		"Routines that ought to be in class ANY"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_ANY_ROUTINES

feature -- Status report

	same_types (obj1, obj2: ANY): BOOLEAN
			-- Is type of `obj1' identical to type of `obj2'?
		require
			obj1_not_void: obj1 /= Void
			obj2_not_void: obj2 /= Void
		do
			Result := obj1.same_type (obj2)
		ensure
			instance_free: class
		end

	same_objects (obj1, obj2: detachable separate ANY): BOOLEAN
			-- Are `obj1' and `obj2' the same object?
			-- Useful as a way to workaround VWEQ validity rule
			-- (when running flat Degree 3 for example):
			--    my_hashable := my_string
			--    my_comparable := my_string
			--    ANY_.same_objects (my_hashable, my_comparable)
		do
			Result := obj1 = obj2
		ensure
			instance_free: class
			definition: Result = (obj1 = obj2)
		end

	equal_objects (obj1, obj2: detachable ANY): BOOLEAN
			-- Are `obj1' and `obj2' considered equal?
		do
			if obj1 = obj2 then
				Result := True
			else
				Result := obj1 ~ obj2
			end
		ensure
			instance_free: class
			definition: Result = (obj1 ~ obj2)
		end

feature -- Conversion

	to_any (an_any: detachable ANY): detachable ANY
			-- Return `an_any';
			-- This can be used to workaround VWEQ validy rule:
			--    my_hashable := my_string
			--    my_comparable := my_string
			--    ANY_.to_any (my_hashable) = ANY_.to_any (my_comparable)
		do
			Result := an_any
		ensure
			instance_free: class
			definition: {KL_TYPE [detachable ANY]}.same_objects (Result, an_any)
		end

end
