indexing

	description:

		"Eiffel inherited features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INHERITED_FEATURE

inherit

	ET_ADAPTED_FEATURE
		redefine
			is_inherited,
			inherited_feature
		end

create

	make

feature {NONE} -- Initialization

	make (a_parent_feature: like parent_feature) is
			-- Create a new inherited feature.
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		do
			parent_feature := a_parent_feature
			flattened_feature := a_parent_feature.precursor_feature
			flattened_parent := a_parent_feature
			first_seed := a_parent_feature.first_seed
			other_seeds := a_parent_feature.other_seeds
		ensure
			parent_feature_set: parent_feature = a_parent_feature
		end

feature -- Initialization

	reset (a_parent_feature: like parent_feature) is
			-- Reset inherited feature.
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		do
			parent_feature := a_parent_feature
			flattened_feature := a_parent_feature.precursor_feature
			flattened_parent := a_parent_feature
			first_seed := a_parent_feature.first_seed
			other_seeds := a_parent_feature.other_seeds
			is_selected := False
			replicated_features := Void
			replicated_seeds := Void
		ensure
			parent_feature_set: parent_feature = a_parent_feature
		end

feature -- Status report

	is_inherited: BOOLEAN is True
			-- Is current feature being inherited?

feature -- Access

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			Result := parent_feature.name
		ensure then
			definition: Result = parent_feature.name
		end

	inherited_feature: ET_INHERITED_FEATURE is
			-- Current feature viewed as an inherited feature
		do
			Result := Current
		end

	flattened_parent: ET_PARENT_FEATURE
			-- Parent feature from which `flattened_feature' is resulting

feature -- Setting

	set_flattened_feature (a_feature: like flattened_feature) is
			-- Set `flattened_feature' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			flattened_feature := a_feature
		ensure
			flattened_feature_set: flattened_feature = a_feature
		end

	set_flattened_parent (a_parent: like flattened_parent) is
			-- Set `flattened_parent' to `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		do
			flattened_parent := a_parent
		ensure
			flattened_parent_set: flattened_parent = a_parent
		end

invariant

	is_inherited: is_inherited
	not_redeclared: not is_redeclared
	flattened_parent_not_void: flattened_parent /= Void

end
