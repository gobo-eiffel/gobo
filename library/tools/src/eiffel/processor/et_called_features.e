note

	description:

		"Lists of features called by another feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010-2016, Eric Bezault and others"
	license: "MIT License"

class ET_CALLED_FEATURES

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new empty list of called features.
		do
			create polymorphic_features.make (initial_polymorphic_features_capacity)
			create polymorphic_feature_target_classes.make (initial_polymorphic_features_capacity)
			create monomorphic_features.make (initial_monomorphic_features_capacity)
			create monomorphic_feature_target_classes.make (initial_monomorphic_features_capacity)
		end

feature -- Element change

	add_polymorphic_feature (a_feature: ET_FEATURE; a_target_class: ET_CLASS)
			-- Add called feature `a_feature' knowing that all versions of this
			-- feature in the descendants of `a_target_class' will need to be
			-- taken into account.
		require
			a_feature_not_void: a_feature /= Void
			a_target_class_not_void: a_target_class /= Void
		do
			polymorphic_features.force_last (a_feature)
			polymorphic_feature_target_classes.force_last (a_target_class)
		end

	add_monomorphic_feature (a_feature: ET_FEATURE; a_target_class: ET_CLASS)
			-- Add called feature `a_feature' knowing that the versions of this
			-- feature in the descendants of `a_target_class' should not be
			-- taken into account.
		require
			a_feature_not_void: a_feature /= Void
			a_target_class_not_void: a_target_class /= Void
		do
			monomorphic_features.force_last (a_feature)
			monomorphic_feature_target_classes.force_last (a_target_class)
		end

feature -- Removal

	wipe_out
			-- Wipe out all polymorphic and monomorphic features.
		do
			polymorphic_features.wipe_out
			polymorphic_feature_target_classes.wipe_out
			monomorphic_features.wipe_out
			monomorphic_feature_target_classes.wipe_out
		end

feature -- Iteration

	do_all_polymorphic (a_action: PROCEDURE [ET_FEATURE, ET_CLASS])
			-- Apply `a_action' to every polymorphic feature and its target class
			-- (Semantics not guaranteed if `a_action' changes the structure.)
		require
			a_action_not_void: a_action /= Void
		local
			i, nb: INTEGER
		do
			nb := polymorphic_features.count
			from i := 1 until i > nb loop
				a_action.call ([polymorphic_features.item (i), polymorphic_feature_target_classes.item (i)])
				i := i + 1
			end
		end

	do_all_monomorphic (a_action: PROCEDURE [ET_FEATURE, ET_CLASS])
			-- Apply `a_action' to every monomorphic feature and its target class
			-- (Semantics not guaranteed if `a_action' changes the structure.)
		require
			a_action_not_void: a_action /= Void
		local
			i, nb: INTEGER
		do
			nb := monomorphic_features.count
			from i := 1 until i > nb loop
				a_action.call ([monomorphic_features.item (i), monomorphic_feature_target_classes.item (i)])
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	polymorphic_features: DS_ARRAYED_LIST [ET_FEATURE]
			-- Called features for which we should also take into
			-- account their versions in the descendant classes

	polymorphic_feature_target_classes: DS_ARRAYED_LIST [ET_CLASS]
			-- Static target base class of called features listed in `polymorphic_features'

	monomorphic_features: DS_ARRAYED_LIST [ET_FEATURE]
			-- Called features for which we should not take into
			-- account their versions in the descendant classes
			--
			-- This is for example the case when using the precursor
			-- in a feature redefinition.

	monomorphic_feature_target_classes: DS_ARRAYED_LIST [ET_CLASS]
			-- Static target base class of called features listed in `monomorphic_features'

feature {NONE} -- Constants

	initial_polymorphic_features_capacity: INTEGER = 100
			-- Default initial capacity for `polymorphic_features' and `polymorphic_feature_target_classes'

	initial_monomorphic_features_capacity: INTEGER = 100
			-- Default initial capacity for `monomorphic_features' and `monomorphic_feature_target_classes'

invariant

	polymorphic_features_not_void: polymorphic_features /= Void
	no_void_polymorphic_feature: not polymorphic_features.has_void
	polymorphic_feature_target_classes_not_void: polymorphic_feature_target_classes /= Void
	no_void_polymorphic_feature_target_class: not polymorphic_feature_target_classes.has_void
	polymorphic_count_consistent: polymorphic_features.count = polymorphic_feature_target_classes.count
	monomorphic_features_not_void: monomorphic_features /= Void
	no_void_monomorphic_feature: not monomorphic_features.has_void
	monomorphic_feature_target_classes_not_void: monomorphic_feature_target_classes /= Void
	no_void_monomorphic_feature_target_class: not monomorphic_feature_target_classes.has_void
	monomorphic_count_consistent: monomorphic_features.count = monomorphic_feature_target_classes.count

end
