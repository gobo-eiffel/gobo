indexing

	description:

		"Eiffel feature precursors equipped with dynamic type sets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_PRECURSOR

inherit

	ET_DYNAMIC_FEATURE
		rename
			make as make_feature
		redefine
			is_precursor,
			dynamic_precursor
		end

create

	make

feature {NONE} -- Initialization

	make (a_feature: like static_feature; a_parent_type: like parent_type; a_current_feature: like current_feature; a_system: ET_SYSTEM) is
			-- Create a new feature equipped with dynamic type sets,
			-- associated with compilation-time precursor feature
			-- `a_feature' of `a_current_feature' from parent type
			-- `a_parent_type' in the surrounding system `a_system'.
		require
			a_feature_not_void: a_feature /= Void
			a_parent_type_not_void: a_parent_type /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_system_not_void: a_system /= Void
		do
			parent_type := a_parent_type
			current_feature := a_current_feature
			make_feature (a_feature, a_parent_type, a_system)
		ensure
			static_feature_set: static_feature = a_feature
			parent_type_set: parent_type = a_parent_type
			current_feature_set: current_feature = a_current_feature
		end

feature -- Status report

	is_precursor: BOOLEAN is True
			-- Is current feature a precursor?

feature -- Access

	parent_type: ET_DYNAMIC_TYPE
			-- Parent type of current precursor

	current_feature: ET_DYNAMIC_FEATURE
			-- Feature to which current precursor is a precuror

	dynamic_precursor (a_feature: ET_FEATURE; a_parent_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM): ET_DYNAMIC_PRECURSOR is
			-- Dynamic precursor of current feature
		do
			Result := current_feature.dynamic_precursor (a_feature, a_parent_type, a_system)
		end

invariant

	parent_type_not_void: parent_type /= Void
	current_feature_not_void: current_feature /= Void

end
