note

	description:

		"Eiffel features with their target base type"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TARGETED_FEATURE

inherit

	HASHABLE

	DEBUG_OUTPUT

create

	make

feature {NONE} -- Initialization

	make (a_feature: like current_feature; a_type: like target_type) is
			-- Create a new feature with its target base type.
		require
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
		do
			current_feature := a_feature
			target_type := a_type
		ensure
			current_feature_set: current_feature = a_feature
			target_type_set: target_type = a_type
		end

feature -- Access

	current_feature: ET_FEATURE
			-- Current feature

	target_type: ET_BASE_TYPE
			-- Base type of the target

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := current_feature.hash_code
		end

feature -- Comparison

	same_targeted_feature (other: ET_TARGETED_FEATURE): BOOLEAN is
			-- Do `Current' and `other' represent the same feature
			-- with the same target type?
		require
			other_not_void: other /= Void
		do
			Result := (current_feature = other.current_feature) and (target_type = other.target_type)
		ensure
			definition: Result = ((current_feature = other.current_feature) and (target_type = other.target_type))
		end

feature -- Output

	debug_output: STRING is
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := target_type.to_text + "." + current_feature.lower_name
		end

invariant

	current_feature_not_void: current_feature /= Void
	target_type_not_void: target_type /= Void

end
