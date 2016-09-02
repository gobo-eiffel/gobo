note

	description:

		"Eiffel system feature markers"

	remark: "[
		There are different ways to mark the features that a given feature
		recursively depends on (i.e. features that might be executed if
		the given feature is itself executed). Some may give more accurate
		results (i.e. will mark less features as used) but may use more
		memory or take longer to complete. There are currently four feature
		marker algorithms available:

		* ET_SYSTEM_FEATURE_MARKER: traverses the dependent features in the
		  context of the class they have been written in. For each feature
		  call, mark the redeclarations of this feature in the descendant
		  classes of the base class of the target as well.

		  Note that assertions are not traversed, and features used as
		  anchor of anchored types as not marked.

		* ET_SYSTEM_FEATURE_FUZZY_MARKER: it also traverses the dependent
		  features in the context of the class they have been written in.
		  The main difference with ET_SYSTEM_FEATURE_MARKER is that the
		  redeclarations of features are not marked when the feature call
		  is traversed. Instead of that, the traversal only marks the feature
		  corresponding to the static type of its target (dynamic binding is
		  not taken into account). Then only when there are no more features
		  to be traversed, mark all redeclarations of features that have been
		  marked as used during the first pass and traverse them. This avoids
		  having to traverse the descendant classes again and again for each
		  call and search for the version of the feature in these classes
		  (even when the feature was not redeclared). On the other hand it
		  will mark more features because some features may be the redeclaration
		  of a feature but in a class that is not a descendant of the base
		  class of the target. For example
		      b: B
		      b.f
		      class A feature f do ... end end
		      class B inherit A end
		      class C inherit A redefine f end feature f do ... end end
		  feature C.f will marked even though C is not a descendant of B.
		  Also replication might produce false positives because even through
		  there might be redeclaration, this is not necessarily the version
		  that has been selected in the inheritance clause.

		  Note that assertions are not traversed, and features used as
		  anchor of anchored types as not marked.

		* ET_SYSTEM_TARGETED_FEATURE_MARKER: traverses the dependent features
		  in the context of the base class of the target types of the calls.
		  For each feature call, mark the redeclarations of this feature in
		  the descendant classes of the base class of the target as well.
		  This algorithm is more accurate than the one in ET_SYSTEM_FEATURE_MARKER,
		  but uses more memory and is slower because it will need to traverse
		  the body of the features several times for each possible target type.

		  Note that assertions are not traversed, and features used as
		  anchor of anchored types as not marked.

		* ET_DYNAMIC_SYSTEM_FEATURE_MARKER: uses the dynamic type set mechanism
		  implemented in the Gobo Eiffel compiler to determine which features
		  are to be part of the resulting executable should the given feature
		  be used as root creation procedure. This algorithm in the most accurate
		  of the four, but is slower.

		  Note that assertions and debug instructions are not traversed, and
		  features used as anchor of anchored types as not marked.

		Benchmarks when using the root creation procedure of gelint's source code:

		When using gec with no GC:
			With ET_SYSTEM_FEATURE_MARKER.mark_system:
				memory: 10 MB (+ 166 MB before calling this feature)
				time: 0.485 seconds
				marked features: 13,127
				marked non-deferred features: 13,127
			With ET_SYSTEM_FEATURE_FUZZY_MARKER.mark_system:
				memory: 4 MB (+ 166 MB before calling this feature)
				time: 0.188 seconds
				marked features: 14,147
				marked non-deferred features: 13,552
			With ET_SYSTEM_TARGETED_FEATURE_MARKER.mark_system:
				memory: 29 MB (+ 166 MB before calling this feature)
				time: 1.187 seconds
				marked features: 12,903
				marked non-deferred features: 12,903
			With ET_DYNAMIC_SYSTEM_FEATURE_MARKER.mark_system:
				memory: 18 MB (+ 166 MB before calling this feature)
				time: 3.375 seconds
				marked features: 12,021
				marked non-deferred features: 12,021
		When using ISE 6.2 with GC:
			With ET_SYSTEM_FEATURE_MARKER.mark_system:
				memory: 3 MB (+ 179 MB before calling this feature)
				time: 1.235 seconds
				marked features: 13,127
				marked non-deferred features: 13,127
			With ET_SYSTEM_FEATURE_FUZZY_MARKER.mark_system:
				memory: 2 MB (+ 179 MB before calling this feature)
				time: 0.610 seconds
				marked features: 14,147
				marked non-deferred features: 13,552
			With ET_SYSTEM_TARGETED_FEATURE_MARKER.mark_system:
				memory: 10 MB (+ 179 MB before calling this feature)
				time: 4.453 seconds
				marked features: 12,903
				marked non-deferred features: 12,903
			With ET_DYNAMIC_SYSTEM_FEATURE_MARKER.mark_system:
				memory: 19 MB (+ 179 MB before calling this feature)
				time: 5.718 seconds
				marked features: 12,021
				marked non-deferred features: 12,021
		Number of non-deferred routines compiled with ISE 6.2: 12,276
		(This does not take into account attributes, but there are some
		duplicates for routines in generic classes with expanded actual
		generic parameters.)
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/04/20 $"
	revision: "$Revision: #7 $"

class ET_SYSTEM_FEATURE_MARKER

inherit

	ET_FEATURE_CALL_HANDLER
		rename
			make as make_feature_call_handler
		redefine
			report_polymorphic_feature_call,
			report_monomorphic_feature_call
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new system feature marker.
		do
			create used_features.make (500000)
			create descendant_classes.make
			descendant_classes.set_deferred_excluded (True)
			descendant_classes.set_none_excluded (True)
			create precursor_features.make
			precursor_features.set_use_implementation_feature (True)
			create marked_polymorphic_calls.make_map (50000)
			make_feature_call_handler
		end

feature -- Processing

	mark_system (a_feature: ET_FEATURE)
			-- Identify the features that `a_feature' (when viewed from
			-- the class it has been written in -- its 'implementation_class')
			-- recursively depends on (i.e. they might be executed if
			-- `a_feature' is itself executed) and mark them as being part
			-- of the system. Mark `a_feature' as well.
			--
			-- Note that marking a feature means that the query 'is_used'
			-- of its 'implementation_feature' (i.e. feature in the class
			-- it has been written) will be set to True.
			--
			-- It is assumed that the classes that the 'implementation_class'
			-- of `a_feature' recursively depends on have already been
			-- marked as being part of the system. Use feature 'mark_system'
			-- from class ET_SYSTEM_MARKER for that.
			-- It is also assumed that the implementation checker (equivalent
			-- of ISE's Degree 3 -- see ET_SYSTEM.implementation_checker
			-- and ET_CLASS.implementation_checked) has been successfully
			-- run on all these classes that have been marked as being part
			-- of the system. Otherwise internal errors may be reported
			-- (using ET_ERROR_HANDLER.report_giaaa_error) if the class has
			-- not been checked or if `internal_error_enabled' has been set.
		require
			a_feature_not_void: a_feature /= Void
			implementation_class_preparsed: a_feature.implementation_class.is_preparsed
		do
			mark_system_until (a_feature, Void)
		ensure
			a_feature_used: a_feature.implementation_feature.is_used
		end

	mark_system_until (a_feature: ET_FEATURE; a_stop_request: detachable FUNCTION [BOOLEAN])
			-- Identify the features that `a_feature' (when viewed from
			-- the class it has been written in -- its 'implementation_class')
			-- recursively depends on (i.e. they might be executed if
			-- `a_feature' is itself executed) and mark them as being part
			-- of the system. Mark `a_feature' as well.
			--
			-- Note that marking a feature means that the query 'is_used'
			-- of its 'implementation_feature' (i.e. feature in the class
			-- it has been written) will be set to True.
			--
			-- The processing will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
			--
			-- It is assumed that the classes that the 'implementation_class'
			-- of `a_feature' recursively depends on have already been
			-- marked as being part of the system. Use feature 'mark_system'
			-- from class ET_SYSTEM_MARKER for that.
			-- It is also assumed that the implementation checker (equivalent
			-- of ISE's Degree 3 -- see ET_SYSTEM.implementation_checker
			-- and ET_CLASS.implementation_checked) has been successfully
			-- run on all these classes that have been marked as being part
			-- of the system. Otherwise internal errors may be reported
			-- (using ET_ERROR_HANDLER.report_giaaa_error) if the class has
			-- not been checked or if `internal_error_enabled' has been set.
		require
			a_feature_not_void: a_feature /= Void
			implementation_class_preparsed: a_feature.implementation_class.is_preparsed
		local
			l_feature: ET_FEATURE
			l_class: ET_CLASS
			l_system: ET_SYSTEM
		do
			l_class := a_feature.implementation_class
			l_system := l_class.current_system
			unmark_all (l_system)
			descendant_classes.build_all_descendants (l_system)
			precursor_features.mark_precursors (l_system)
			marked_polymorphic_calls.wipe_out
			used_features.wipe_out
			l_feature := a_feature.implementation_feature
			l_feature.set_used (True)
			used_features.force (l_feature)
			from
			until
				used_features.is_empty or else
				(a_stop_request /= Void and then a_stop_request.item ([]))
			loop
				l_feature := used_features.item
				used_features.remove
				l_feature := l_feature.implementation_feature
				l_class := l_feature.implementation_class
				if l_class.is_preparsed then
					process_feature (l_feature, l_class)
				end
			end
			used_features.wipe_out
			marked_polymorphic_calls.wipe_out
			precursor_features.unmark_all
			descendant_classes.reset
		ensure
			a_feature_used: a_feature.implementation_feature.is_used
		end

	mark_shallow (a_feature: ET_FEATURE)
			-- Identify the features that `a_feature' (when viewed from
			-- the class it has been written in -- its 'implementation_class')
			-- depends on (i.e. they might be called directly from `a_feature')
			-- and  mark them as being part of the system. Do not mark
			-- `a_feature' if it does not directly depend on itself.
			--
			-- Note that marking a feature means that the query 'is_used'
			-- of its 'implementation_feature' (i.e. feature in the class
			-- it has been written) will be set to True.
			--
			-- It is assumed that the classes that the 'implementation_class'
			-- of `a_feature' recursively depends on have already been
			-- marked as being part of the system. Use feature 'mark_system'
			-- from class ET_SYSTEM_MARKER for that.
			-- It is also assumed that the implementation checker (equivalent
			-- of ISE's Degree 3 -- see ET_SYSTEM.implementation_checker
			-- and ET_CLASS.implementation_checked) has been successfully
			-- run on all these classes that have been marked as being part
			-- of the system. Otherwise internal errors may be reported
			-- (using ET_ERROR_HANDLER.report_giaaa_error) if the class has
			-- not been checked or if `internal_error_enabled' has been set.
		require
			a_feature_not_void: a_feature /= Void
			implementation_class_preparsed: a_feature.implementation_class.is_preparsed
		local
			l_class: ET_CLASS
		do
			l_class := a_feature.implementation_class
			unmark_all (l_class.current_system)
			mark_shallow_no_unmark (a_feature)
		end

	mark_shallow_no_unmark (a_feature: ET_FEATURE)
			-- Identify the features that `a_feature' (when viewed from
			-- the class it has been written in -- its 'implementation_class')
			-- depends on (i.e. they might be called directly from `a_feature')
			-- and  mark them as being part of the system. Do not mark
			-- `a_feature' if it does not directly depend on itself.
			-- (Do not call `unmark_all' before marking the features.)
			--
			-- Note that marking a feature means that the query 'is_used'
			-- of its 'implementation_feature' (i.e. feature in the class
			-- it has been written) will be set to True.
			--
			-- It is assumed that the classes that the 'implementation_class'
			-- of `a_feature' recursively depends on have already been
			-- marked as being part of the system. Use feature 'mark_system'
			-- from class ET_SYSTEM_MARKER for that.
			-- It is also assumed that the implementation checker (equivalent
			-- of ISE's Degree 3 -- see ET_SYSTEM.implementation_checker
			-- and ET_CLASS.implementation_checked) has been successfully
			-- run on all these classes that have been marked as being part
			-- of the system. Otherwise internal errors may be reported
			-- (using ET_ERROR_HANDLER.report_giaaa_error) if the class has
			-- not been checked or if `internal_error_enabled' has been set.
		require
			a_feature_not_void: a_feature /= Void
			implementation_class_preparsed: a_feature.implementation_class.is_preparsed
		local
			l_feature: ET_FEATURE
			l_class: ET_CLASS
		do
			used_features.wipe_out
			l_feature := a_feature.implementation_feature
			l_class := l_feature.implementation_class
			descendant_classes.build_all_descendants (l_class.current_system)
			precursor_features.mark_precursors (l_class.current_system)
			marked_polymorphic_calls.wipe_out
			process_feature (l_feature, l_class)
			used_features.wipe_out
			marked_polymorphic_calls.wipe_out
			precursor_features.unmark_all
			descendant_classes.reset
		end

	unmark_all (a_system: ET_SYSTEM)
			-- Unmark all features of `a_system' as if none of them was used.
		require
			a_system_not_void: a_system /= Void
		do
			a_system.classes_do_recursive (agent {ET_CLASS}.features_do_declared (agent {ET_FEATURE}.set_used (False)))
		end

	is_dependent_recursive (a_caller_feature, a_callee_feature: ET_FEATURE): BOOLEAN
			-- Does `a_caller_feature' (when viewed from the class it has been
			-- written in -- its 'implementation_class') recursively depend on
			-- `a_callee_feature' (either viewed from the class it has been
			-- written in or one of its descendants that does not redefine it)?
			--
			-- A feature recursively depends on another feature if the latter might
			-- be executed if the former is itself executed.
			--
			-- Side-effect: Features traversed during this process will be marked
			-- as used. Note that marking a feature means that the query 'is_used'
			-- of its 'implementation_feature' (i.e. feature in the class
			-- it has been written) will be set to True.
			--
			-- It is assumed that the classes that the 'implementation_class'
			-- of `a_feature' recursively depends on have already been
			-- marked as being part of the system. Use feature 'mark_system'
			-- from class ET_SYSTEM_MARKER for that.
			-- It is also assumed that the implementation checker (equivalent
			-- of ISE's Degree 3 -- see ET_SYSTEM.implementation_checker
			-- and ET_CLASS.implementation_checked) has been successfully
			-- run on all these classes that have been marked as being part
			-- of the system. Otherwise internal errors may be reported
			-- (using ET_ERROR_HANDLER.report_giaaa_error) if the class has
			-- not been checked or if `internal_error_enabled' has been set.
		require
			a_caller_feature_not_void: a_caller_feature /= Void
			caller_implementation_class_preparsed: a_caller_feature.implementation_class.is_preparsed
			a_callee_feature_not_void: a_callee_feature /= Void
		local
			l_feature: ET_FEATURE
			l_class: ET_CLASS
			l_system: ET_SYSTEM
			l_callee_feature_impl: ET_FEATURE
		do
			if not a_callee_feature.implementation_class.is_marked then
				Result := False
			else
				l_callee_feature_impl := a_callee_feature.implementation_feature
				l_class := a_caller_feature.implementation_class
				l_system := l_class.current_system
				unmark_all (l_system)
				descendant_classes.build_all_descendants (l_class.current_system)
				precursor_features.mark_precursors (l_system)
				marked_polymorphic_calls.wipe_out
				used_features.wipe_out
				l_feature := a_caller_feature.implementation_feature
				l_feature.set_used (True)
				used_features.force (l_feature)
				from until used_features.is_empty or Result loop
					l_feature := used_features.item
					used_features.remove
					l_feature := l_feature.implementation_feature
					l_class := l_feature.implementation_class
					if l_class.is_preparsed then
						process_feature (l_feature, l_class)
						Result := l_callee_feature_impl.is_used
					end
				end
				used_features.wipe_out
				marked_polymorphic_calls.wipe_out
				precursor_features.unmark_all
				descendant_classes.reset
			end
		end

feature {NONE} -- Event handling

	report_polymorphic_feature_call (a_feature: ET_FEATURE; a_target_class: ET_CLASS)
			-- Report a call to `a_feature' where its versions in descendants of
			-- `a_target_class' should be taken into account.
		local
			l_features: DS_HASH_SET [ET_FEATURE]
			l_feature_impl: ET_FEATURE
		do
			report_monomorphic_feature_call (a_feature, a_target_class)
			l_feature_impl := a_feature.implementation_feature
			if not precursor_features.is_marked (l_feature_impl) then
				if a_target_class.is_deferred and then not l_feature_impl.is_deferred then
					mark_called_feature (l_feature_impl)
				end
			else
				marked_polymorphic_calls.search (a_target_class)
				if marked_polymorphic_calls.found then
					l_features := marked_polymorphic_calls.found_item
					if not l_features.has (a_feature) then
						l_features.force_last (a_feature)
						descendant_classes.descendants (a_target_class).do_all (agent report_descendant_feature_call (a_feature, a_target_class, ?))
					end
				else
					create l_features.make (50)
					l_features.force_last (a_feature)
					marked_polymorphic_calls.force_last_new (l_features, a_target_class)
					descendant_classes.descendants (a_target_class).do_all (agent report_descendant_feature_call (a_feature, a_target_class, ?))
				end
			end
		end

	report_monomorphic_feature_call (a_feature: ET_FEATURE; a_target_class: ET_CLASS)
			-- Report a call to `a_feature' where its versions in descendants of
			-- `a_target_class' should not be taken into account.
		do
			if not a_target_class.is_deferred then
				mark_called_feature (a_feature.implementation_feature)
			end
		end

	report_descendant_feature_call (a_feature: ET_FEATURE; a_target_class, a_descendant: ET_CLASS)
			-- Mark as used the version of this feature in `a_descendant'
			-- which is supposed to be a descendant class of `a_target_class'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_class_not_void: a_target_class /= Void
			a_descendant_not_void: a_descendant /= Void
		local
			l_other_feature: detachable ET_FEATURE
			l_features: DS_HASH_SET [ET_FEATURE]
		do
			if a_feature.is_query then
				l_other_feature := a_descendant.seeded_query (a_feature.first_seed)
			else
				l_other_feature := a_descendant.seeded_procedure (a_feature.first_seed)
			end
			if l_other_feature = Void then
				if a_descendant.features_flattened_successfully then
						-- Internal error: `a_descendant' is a descendant of
						-- `a_target_class', so it should have a version of `a_feature'.
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				end
			else
				marked_polymorphic_calls.search (a_descendant)
				if marked_polymorphic_calls.found then
					l_features := marked_polymorphic_calls.found_item
				else
					create l_features.make (50)
					marked_polymorphic_calls.force_last_new (l_features, a_descendant)
				end
				l_features.force_last (l_other_feature)
				report_monomorphic_feature_call (l_other_feature, a_descendant)
			end
		end

	mark_called_feature (a_feature: ET_FEATURE)
			-- Indicate that `a_feature' is being called by `current_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if not a_feature.is_used then
				a_feature.set_used (True)
				used_features.force (a_feature)
			end
		ensure
			a_feature_used: a_feature.is_used
		end

feature {NONE} -- Access

	used_features: DS_ARRAYED_STACK [ET_FEATURE]
			-- Features which have already been marked as used but
			-- have not been traversed yet

	descendant_classes: ET_DESCENDANT_CLASSES
			-- Descendants of classes, indexed by the given class

	precursor_features: ET_PRECURSOR_FEATURE_MARKER
			-- Features marked as being the precursor of at least one other feature

	marked_polymorphic_calls: DS_HASH_TABLE [DS_HASH_SET [ET_FEATURE], ET_CLASS]
			-- Polymorphic calls which have already been marked as used

invariant

	used_features_not_void: used_features /= Void
	no_void_used_feature: not used_features.has_void
	descendant_classes_not_void: descendant_classes /= Void
	precursor_features_not_void: precursor_features /= Void
	marked_polymorphic_calls_not_void: marked_polymorphic_calls /= Void
	no_void_marked_polymorphic_call: not marked_polymorphic_calls.has_void

end
