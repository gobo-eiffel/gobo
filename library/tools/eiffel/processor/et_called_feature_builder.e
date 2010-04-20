
indexing

	description:

		"Builders of lists of features called by a given feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: $"

class ET_CALLED_FEATURE_BUILDER

inherit

	ET_FEATURE_CALL_HANDLER
		rename
			make as make_feature_call_handler
		redefine
			report_polymorphic_feature_call,
			report_monomorphic_feature_call
		end

create

	make, make_with_called_features

feature {NONE} -- Initialization

	make is
			-- Create a new called features builder.
		do
			create called_features.make
			make_with_called_features (called_features)
		end

	make_with_called_features (a_called_features: like called_features) is
			-- Create a new called features builder using `a_called_features'.
		require
			a_called_features_not_void: a_called_features /= Void
		do
			called_features := a_called_features
			make_feature_call_handler
		ensure
			called_features_set: called_features = a_called_features
		end

feature -- Access

	called_features: ET_CALLED_FEATURES
			-- Features called by the feature being processed

feature -- Setting

	set_called_features (a_called_features: like called_features) is
			-- Set `called_features' to `a_called_features'.
		require
			a_called_features_not_void: a_called_features /= Void
		do
			called_features := a_called_features
		ensure
			called_features_set: called_features = a_called_features
		end

feature -- Processing

	build_called_features (a_feature: ET_FEATURE) is
			-- Identify the features that `a_feature' (when viewed from
			-- the class it has been written in -- its 'implementation_class')
			-- depends on (i.e. they might be called directly from `a_feature')
			-- and add them to `called_features'.
			--
			-- It is assumed that the implementation checker (equivalent
			-- of ISE's Degree 3 -- see ET_SYSTEM.implementation_checker
			-- and ET_CLASS.implementation_checked) has been successfully
			-- run on `a_feature'. Otherwise internal errors may be reported
			-- (using ET_ERROR_HANDLER.report_giaaa_error) if the class has
			-- not been checked or if `internal_error_enabled' has been set.
		require
			a_feature_not_void: a_feature /= Void
			implementation_class_preparsed: a_feature.implementation_class.is_preparsed
		local
			l_feature: ET_FEATURE
			l_class: ET_CLASS
		do
			l_feature := a_feature.implementation_feature
			l_class := l_feature.implementation_class
			process_feature (l_feature, l_class)
		end

	unmark_all (a_system: ET_SYSTEM) is
			-- Unmark all features of `a_system' as if none of them was used.
		require
			a_system_not_void: a_system /= Void
		do
			a_system.classes_do_recursive (agent {ET_CLASS}.features_do_declared (agent {ET_FEATURE}.set_used (False)))
		end

feature {NONE} -- Event handling

	report_polymorphic_feature_call (a_feature: ET_FEATURE; a_target_class: ET_CLASS) is
			-- Report a call to `a_feature' where its versions in descendants of
			-- `a_target_class' should be taken into account.
		do
			called_features.add_polymorphic_feature (a_feature, a_target_class)
		end

	report_monomorphic_feature_call (a_feature: ET_FEATURE; a_target_class: ET_CLASS) is
			-- Report a call to `a_feature' where its versions in descendants of
			-- `a_target_class' should not be taken into account.
		do
			called_features.add_monomorphic_feature (a_feature, a_target_class)
		end

invariant

	called_features_not_void: called_features /= Void

end
