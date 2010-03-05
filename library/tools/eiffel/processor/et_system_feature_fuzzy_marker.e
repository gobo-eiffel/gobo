indexing

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
	copyright: "Copyright (c) 2008-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2009/06/22 $"
	revision: "$Revision: #4 $"

class ET_SYSTEM_FEATURE_FUZZY_MARKER

inherit

	ET_FEATURE_CALL_HANDLER
		rename
			make as make_feature_call_handler
		redefine
			report_attribute_address,
			report_attribute_assignment_target,
			report_creation_expression,
			report_creation_instruction,
			report_precursor_expression,
			report_precursor_instruction,
			report_procedure_address,
			report_qualified_call_expression,
			report_qualified_call_instruction,
			report_qualified_procedure_call_agent,
			report_qualified_query_call_agent,
			report_function_address,
			report_static_call_expression,
			report_static_call_instruction,
			report_unqualified_call_expression,
			report_unqualified_call_instruction,
			report_unqualified_procedure_call_agent,
			report_unqualified_query_call_agent
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new system feature marker.
		do
			create used_features.make (500000)
			make_feature_call_handler
		end

feature -- Processing

	mark_system (a_feature: ET_FEATURE) is
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
		local
			l_feature: ET_FEATURE
			l_class: ET_CLASS
			l_system: ET_SYSTEM
			i, nb: INTEGER
			l_other_precursors: ET_FEATURE_LIST
			j, nb2: INTEGER
			l_redeclared_features: DS_ARRAYED_LIST [ET_FEATURE]
		do
			l_class := a_feature.implementation_class
			l_system := l_class.current_system
			unmark_all (l_system)
			create l_redeclared_features.make (500000)
			l_system.classes_do_if_recursive (agent add_redeclarations (?, l_redeclared_features), agent {ET_CLASS}.in_system)
			nb := l_redeclared_features.count
			used_features.wipe_out
			l_feature := a_feature.implementation_feature
			l_feature.set_used (True)
			used_features.force (l_feature)
			from until used_features.is_empty loop
					-- Process features that have been marked but have not been traversed yet.
				from until used_features.is_empty loop
					l_feature := used_features.item
					used_features.remove
					l_feature := l_feature.implementation_feature
					l_class := l_feature.implementation_class
					if l_class.is_preparsed then
						process_feature (l_feature, l_class)
					end
				end
					-- Mark as used the features that are redeclarations of features
					-- which have themselves already been marked.
				from i := 1 until i > nb loop
					l_feature := l_redeclared_features.item (i)
					if not l_feature.implementation_feature.is_used then
						if l_feature.first_precursor.implementation_feature.is_used then
							l_feature := l_feature.implementation_feature
							l_feature.set_used (True)
							used_features.force (l_feature)
						else
							l_other_precursors := l_feature.other_precursors
							if l_other_precursors /= Void then
								nb2 := l_other_precursors.count
								from j := 1 until j > nb2 loop
									if l_other_precursors.item (j).implementation_feature.is_used then
										l_feature := l_feature.implementation_feature
										l_feature.set_used (True)
										used_features.force (l_feature)
										j := nb2 + 1
									else
										j := j + 1
									end
								end
							end
						end
					end
					i := i + 1
				end
			end
		ensure
			a_feature_used: a_feature.implementation_feature.is_used
		end

	mark_shallow (a_feature: ET_FEATURE) is
			-- Identify the features that `a_feature' (when viewed from
			-- the class it has been written in -- its 'implementation_class')
			-- depends on (i.e. they might be called directly from `a_feature')
			-- and  mark them as being part of the system. Do not mark
			-- `a_feature' if it does not directly depend on itself.
			--
			-- Note that only static calls will be marked. The redeclations
			-- in descendant classes of features called in `a_feature' will
			-- not be marked. Use ET_SYSTEM_FEATURE_MARKER.mark_shallow for that.
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

	mark_shallow_no_unmark (a_feature: ET_FEATURE) is
			-- Identify the features that `a_feature' (when viewed from
			-- the class it has been written in -- its 'implementation_class')
			-- depends on (i.e. they might be called directly from `a_feature')
			-- and  mark them as being part of the system. Do not mark
			-- `a_feature' if it does not directly depend on itself.
			-- (Do not call `unmark_all' before marking the features.)
			--
			-- Note that only static calls will be marked. The redeclations
			-- in descendant classes of features called in `a_feature' will
			-- not be marked. Use ET_SYSTEM_FEATURE_MARKER.mark_shallow_no_unmark
			-- for that.
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
			process_feature (l_feature, l_class)
			used_features.wipe_out
		end

	unmark_all (a_system: ET_SYSTEM) is
			-- Unmark all features of `a_system' as if none of them was used.
		require
			a_system_not_void: a_system /= Void
		do
			a_system.classes_do_recursive (agent {ET_CLASS}.features_do_declared (agent {ET_FEATURE}.set_used (False)))
		end

	is_dependent_recursive (a_caller_feature, a_callee_feature: ET_FEATURE): BOOLEAN is
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
			l_callee_feature_impl: ET_FEATURE
			l_class: ET_CLASS
			l_system: ET_SYSTEM
			i, nb: INTEGER
			l_other_precursors: ET_FEATURE_LIST
			j, nb2: INTEGER
			l_redeclared_features: DS_ARRAYED_LIST [ET_FEATURE]
		do
			if not a_callee_feature.implementation_class.in_system then
				Result := False
			else
				l_callee_feature_impl := a_callee_feature.implementation_feature
				l_class := a_caller_feature.implementation_class
				l_system := l_class.current_system
				unmark_all (l_system)
				used_features.wipe_out
				l_feature := a_caller_feature.implementation_feature
				l_feature.set_used (True)
				used_features.force (l_feature)
				from until used_features.is_empty or Result loop
						-- Process features that have been marked but have not been traversed yet.
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
					if not Result then
							-- Mark as used the features that are redeclarations of features
							-- which have themselves already been marked.
						if l_redeclared_features = Void then
							create l_redeclared_features.make (500000)
							l_system.classes_do_if_recursive (agent add_redeclarations (?, l_redeclared_features), agent {ET_CLASS}.in_system)
							nb := l_redeclared_features.count
						end
						from i := 1 until i > nb or Result loop
							l_feature := l_redeclared_features.item (i)
							if not l_feature.implementation_feature.is_used then
								if l_feature.first_precursor.implementation_feature.is_used then
									l_feature := l_feature.implementation_feature
									l_feature.set_used (True)
									used_features.force (l_feature)
									Result := (l_feature = l_callee_feature_impl)
								else
									l_other_precursors := l_feature.other_precursors
									if l_other_precursors /= Void then
										nb2 := l_other_precursors.count
										from j := 1 until j > nb2 or Result loop
											if l_other_precursors.item (j).implementation_feature.is_used then
												l_feature := l_feature.implementation_feature
												l_feature.set_used (True)
												used_features.force (l_feature)
												Result := (l_feature = l_callee_feature_impl)
												j := nb2 + 1
											else
												j := j + 1
											end
										end
									end
								end
							end
							i := i + 1
						end
					end
				end
				used_features.wipe_out
			end
		end

feature {NONE} -- Event handling

	report_feature_called (a_feature: ET_FEATURE) is
			-- Report that `a_feature' is called.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_feature_impl: ET_FEATURE
		do
			l_feature_impl := a_feature.implementation_feature
			if not l_feature_impl.is_used then
				l_feature_impl.set_used (True)
				used_features.force (l_feature_impl)
			end
		ensure
			a_feature_used: a_feature.implementation_feature.is_used
		end

	report_attribute_address (an_expression: ET_FEATURE_ADDRESS; an_attribute: ET_QUERY) is
			-- Report that attribute `an_attribute' has been processed
			-- as target of feature address `an_expression'.
		do
			report_feature_called (an_attribute)
		end

	report_attribute_assignment_target (a_writable: ET_WRITABLE; an_attribute: ET_QUERY) is
			-- Report that attribute `an_attribute' has been processed
			-- as target `a_writable' of an assignment (attempt).
		do
			report_feature_called (an_attribute)
		end

	report_creation_expression (an_expression: ET_EXPRESSION; a_creation_type: ET_TYPE_CONTEXT;
		a_procedure: ET_PROCEDURE; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Report that a creation expression `an_expression' has been processed,
			-- where `a_creation_type' is the creation type and `a_procedure' is the creation procedure.
		do
			report_feature_called (a_procedure)
		end

	report_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION; a_creation_type: ET_TYPE_CONTEXT; a_procedure: ET_PROCEDURE) is
			-- Report that a creation instruction `an_instruction' has been processed,
			-- where `a_creation_type' is the creation type and `a_procedure' is the creation procedure.
		do
			report_feature_called (a_procedure)
		end

	report_function_address (an_expression: ET_FEATURE_ADDRESS; a_query: ET_QUERY) is
			-- Report that function `a_query' has been processed
			-- as target of feature address `an_expression'.
		do
			report_feature_called (a_query)
		end

	report_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION; a_parent_type: ET_BASE_TYPE; a_query: ET_QUERY) is
			-- Report that a precursor expression has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_query' is the precursor feature.
		do
			report_feature_called (a_query)
		end

	report_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION; a_parent_type: ET_BASE_TYPE; a_procedure: ET_PROCEDURE) is
			-- Report that a precursor instruction has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_procedure' is the precursor feature.
		do
			report_feature_called (a_procedure)
		end

	report_procedure_address (an_expression: ET_FEATURE_ADDRESS; a_procedure: ET_PROCEDURE) is
			-- Report that procedure `a_procedure' has been processed
			-- as target of feature address `an_expression'.
		do
			report_feature_called (a_procedure)
		end

	report_qualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_target_type: ET_TYPE_CONTEXT; a_query: ET_QUERY) is
			-- Report that a qualified call expression `an_expression' has been processed,
			-- where `a_target_type' is the type of the target and `a_query' is the
			-- query being called.
		do
			report_feature_called (a_query)
		end

	report_qualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_target_type: ET_TYPE_CONTEXT; a_procedure: ET_PROCEDURE) is
			-- Report that a qualified call instruction `an_instruction' has been processed,
			-- where `a_target_type' is the type of the target and `a_procedure' is the
			-- procedure being called.
		do
			report_feature_called (a_procedure)
		end

	report_qualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_target_type: ET_TYPE_CONTEXT; a_procedure: ET_PROCEDURE) is
			-- Report that a qualified procedure call agent `an_agent' has been processed,
			-- where `a_procedure' is the procedure being called by the agent and
			-- `a_target_type' is the type of the target of that call.
		do
			report_feature_called (a_procedure)
		end

	report_qualified_query_call_agent (an_expression: ET_CALL_AGENT; a_target_type: ET_TYPE_CONTEXT; a_query: ET_QUERY) is
			-- Report that a qualified query call agent `an_expression' has been processed.
			-- where `a_query' is the query being called by the agent and
			-- `a_target_type' is the type of the target of that call.
		do
			report_feature_called (a_query)
		end

	report_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION; a_type: ET_TYPE; a_query: ET_QUERY) is
			-- Report that a static call expression `an_expression' has been processed,
			-- where `a_query' is the query being called anf `a_type' is the type
			-- as declared in the class where `an_expression' was written.
		do
			report_feature_called (a_query)
		end

	report_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION; a_type: ET_TYPE; a_procedure: ET_PROCEDURE) is
			-- Report that a static call instruction `an_instruction' has been processed,
			-- where `a_procedure' is the procedure being called anf `a_type' is the type
			-- as declared in the class where `an_expression' was written.
		do
			report_feature_called (a_procedure)
		end

	report_unqualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_query: ET_QUERY) is
			-- Report that an unqualified call expression `an_expression' has been processed,
			-- where `a_query' is the query being called.
		do
			report_feature_called (a_query)
		end

	report_unqualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_procedure: ET_PROCEDURE) is
			-- Report that an unqualified call instruction `an_instruction' has been processed,
			-- where `a_procedure' is the procedure being called.
		do
			report_feature_called (a_procedure)
		end

	report_unqualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE) is
			-- Report that an unqualified procedure call agent `an_expression' has been processed,
			-- where `a_procedure' is the procedure being called by the agent.
		do
			report_feature_called (a_procedure)
		end

	report_unqualified_query_call_agent (an_expression: ET_CALL_AGENT; a_query: ET_QUERY) is
			-- Report that an unqualified query call agent `an_expression' has been processed,
			-- where `a_query' is the query being called by the agent.
		do
			report_feature_called (a_query)
		end

feature {NONE} -- Access

	used_features: DS_ARRAYED_STACK [ET_FEATURE]
			-- Features which have already been marked as used but
			-- have not been traversed yet

feature {NONE} -- Implementation

	add_redeclarations (a_class: ET_CLASS; a_redeclarations: DS_ARRAYED_LIST [ET_FEATURE]) is
			-- Add to `a_redeclarations' the features of `a_class' that are either a redeclaration
			-- or a join of two or more features inherited from parent classes.
		require
			a_class_not_void: a_class /= Void
			a_redeclarations_not_void: a_redeclarations /= Void
			no_void_redeclaration: not a_redeclarations.has_void
		do
			a_class.features_do_declared_if (agent a_redeclarations.force_last, agent {ET_FEATURE}.is_redeclaration (a_class))
			a_class.features_do_inherited_if (agent a_redeclarations.force_last, agent {ET_FEATURE}.is_join (a_class))
		ensure
			no_void_redeclaration: not a_redeclarations.has_void
		end

invariant

	used_features_not_void: used_features /= Void
	no_void_used_feature: not used_features.has_void

end
