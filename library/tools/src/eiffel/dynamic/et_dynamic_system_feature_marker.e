note

	description:

		"Eiffel system feature markers using the dynamic type set mechanism"

	remark: "[
		There are different ways to mark the features that a given feature
		recursively depends on (i.e. features that might be executed if
		the given feature is itself executed). Some may give more accurate
		results (i.e. will mark less features as used) but may use more
		memory or take longer to complete. There are currently four feature
		marker algorithms available:

		* ET_SYSTEM_FEATURE_MARKER: traverses the dependent features in the
		  context of the class they have been written in. For each feature
		  call, mark the redeclarations of this feature in the conforming
		  descendant classes of the base class of the target as well.

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
		  feature C.f will be marked even though C is not a descendant of B.
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
		  be used as root creation procedure. This algorithm is the most accurate
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
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_SYSTEM_FEATURE_MARKER

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new system feature marker.
		do
		end

feature -- Processing

	mark_system (a_feature: ET_FEATURE; a_target_type: ET_BASE_TYPE)
			-- Identify the features that `a_feature' from `a_target_type'
			-- recursively depends on (i.e. they might be executed if
			-- `a_feature' is itself executed) and mark them as being
			-- part of the system. Mark `a_feature' as well.
			-- Use the dynamic type set mechanism to determine which
			-- features need to be marked as being part of the system.
			--
			-- Note that marking a feature means that the query 'is_used'
			-- of its 'implementation_feature' (i.e. feature in the class
			-- it has been written) will be set to True.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
			a_target_class_preparsed: a_target_type.base_class.is_preparsed
		local
			l_class: ET_CLASS
			l_system: ET_SYSTEM
			l_dynamic_system: ET_DYNAMIC_SYSTEM
			l_builder: ET_DYNAMIC_PUSH_TYPE_SET_BUILDER
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			l_class := a_target_type.base_class
			l_system := l_class.current_system
			unmark_all (l_system)
			if a_feature.is_deferred then
				a_feature.implementation_feature.set_used (True)
			else
				create l_dynamic_system.make (l_system)
				create l_builder.make (l_dynamic_system)
				l_dynamic_system.set_dynamic_type_set_builder (l_builder)
				l_dynamic_system.compile_feature (a_feature.name, l_class)
				l_dynamic_types := l_dynamic_system.dynamic_types
				nb := l_dynamic_types.count
				from i := 1 until i > nb loop
					l_dynamic_type := l_dynamic_types.item (i)
					l_dynamic_type.queries.do_all (agent mark_feature)
					l_dynamic_type.procedures.do_all (agent mark_feature)
					i := i + 1
				end
			end
		ensure
			a_feature_used: a_feature.implementation_feature.is_used
		end

	unmark_all (a_system: ET_SYSTEM)
			-- Unmark all features of `a_system' as if none of them was in the system.
		require
			a_system_not_void: a_system /= Void
		do
			a_system.classes_do_recursive (agent {ET_CLASS}.features_do_declared (agent {ET_FEATURE}.set_used (False)))
		end

feature {NONE} -- Implementation

	mark_feature (a_feature: ET_DYNAMIC_FEATURE)
			-- Mark `a_feature' as being used.
		require
			a_feature_not_void: a_feature /= Void
		local
			i, nb: INTEGER
		do
			a_feature.static_feature.implementation_feature.set_used (True)
			if attached a_feature.first_precursor as l_first_precursor then
				mark_feature (l_first_precursor)
				if attached a_feature.other_precursors as l_precursors then
					nb := l_precursors.count
					from i := 1 until i > nb loop
						mark_feature (l_precursors.item (i))
						i := i + 1
					end
				end
			end
		end

end
