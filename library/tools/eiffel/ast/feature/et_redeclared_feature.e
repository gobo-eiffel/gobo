indexing

	description:

		"Eiffel redeclared features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_REDECLARED_FEATURE

inherit

	ET_ADAPTED_FEATURE
		redefine
			redeclared_feature,
			is_other_seeds_shared, adapted_feature
		end

creation

	make

feature {NONE} -- Initialization

	make (a_feature: like flattened_feature; a_parent_feature: like parent_feature) is
			-- Create a new redeclared feature.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_not_inherited: not a_feature.is_inherited
			a_parent_feature_not_void: a_parent_feature /= Void
			a_parent_feature_inherited: a_parent_feature.is_inherited
			a_parent_feature_not_redeclared: not a_parent_feature.is_redeclared
		do
			flattened_feature := a_feature
			parent_feature := a_parent_feature
			parent := a_parent_feature.parent
			id := a_feature.id
			name_item := a_feature.name_item
			version := a_feature.version
			clients := a_feature.clients
			implementation_class := a_feature.implementation_class
			first_seed := a_parent_feature.first_seed
			other_seeds := a_parent_feature.other_seeds
			frozen_keyword := a_feature.frozen_keyword
		ensure
			flattened_feature_set: flattened_feature = a_feature
			parent_feature_set: parent_feature = a_parent_feature
			registered: id = a_feature.id
		end

feature -- Access

	redeclared_feature: ET_REDECLARED_FEATURE is
			-- Current feature viewed as a redeclared feature
		do
			Result := Current
		end

	precursor_feature: ET_FLATTENED_FEATURE is
			-- Feature inherited from `parent'
		do
			Result := parent_feature.precursor_feature
		end

	parent_feature: ET_FEATURE
			-- Feature in `parent'

	adapted_feature: ET_REDECLARED_FEATURE is
			-- Version of current feature where none of its
			-- inherited components are flattened
		do
			Result := Current
			parent_feature := parent_feature.adapted_feature
		end

feature -- Status report

	is_redeclared: BOOLEAN is True
			-- Is current feature being redeclared?

	is_other_seeds_shared: BOOLEAN is
			-- Is `other_seeds' object shared with one of
			-- the precursors? (If shared, then we need to
			-- clone it before modifying it.)
		do
			Result := parent_feature.is_other_seeds_shared
		end

feature -- Duplication

	new_synonym (a_name: like name_item): like Current is
			-- Synonym feature
		do
			create Result.make (flattened_feature.new_synonym (a_name), parent_feature)
		end

feature -- Conversion

	renamed_feature (a_name: like name): like Current is
			-- Renamed version of current feature
		do
			create Result.make (flattened_feature.renamed_feature (a_name), parent_feature)
		end

feature -- Element change

	put_inherited_feature (a_feature: ET_FEATURE) is
			-- Add `a_feature' to the inherited features.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_inherited: a_feature.is_inherited
			a_feature_not_redeclared: not a_feature.is_redeclared
			a_feature_not_merged: a_feature.merged_feature = Void
			same_name: a_feature.name.same_feature_name (name)
		local
			an_inherited_feature: ET_INHERITED_FEATURE
		do
			if parent_feature.is_flattened then
				an_inherited_feature := a_feature.inherited_feature
				an_inherited_feature.put_inherited_feature (parent_feature)
			else
				an_inherited_feature := parent_feature.inherited_feature
				an_inherited_feature.put_inherited_feature (a_feature)
			end
			parent_feature := an_inherited_feature
			first_seed := parent_feature.first_seed
			other_seeds := parent_feature.other_seeds
		end

invariant

	is_redeclared: is_redeclared

end
