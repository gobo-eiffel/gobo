indexing

	description:
	"[
		Eiffel adapted classes.
		Note that there is at most one such object per class name in a given universe.
		For incrementality purposes, we should only keep reference to objects of
		type ET_ADAPTED_CLASS and not directly to objects of type ET_CLASS. Otherwise
		we will get corrupted information when classes are moved from one library to
		another for example. We can still get access to the actual class object with
		the given name when viewed from the surrounding universe using `actual_class'.
	]"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: $"

deferred class ET_ADAPTED_CLASS

feature -- Access

	actual_class: ET_CLASS is
			-- Actual class
		deferred
		ensure
			actual_class_not_void: Result /= Void
		end

	classes_in_group (a_group: ET_GROUP): DS_ARRAYED_LIST [ET_CLASS] is
			-- Classes among local, imported and overriding classes
			-- that are declared in `a_group'
		require
			a_group_not_void: a_group /= Void
		do
			create Result.make (1)
			if a_group.is_override then
				local_override_classes_do_if (agent Result.force_last, agent {ET_CLASS}.is_in_group (a_group))
				overriding_classes_do_all (agent {ET_ADAPTED_CLASS}.local_override_classes_do_if (agent Result.force_last, agent {ET_CLASS}.is_in_group (a_group)))
			else
				local_non_override_classes_do_if (agent Result.force_last, agent {ET_CLASS}.is_in_group (a_group))
				imported_classes_do_all (agent {ET_ADAPTED_CLASS}.local_classes_do_if (agent Result.force_last, agent {ET_CLASS}.is_in_group (a_group)))
			end
		ensure
			in_group: Result.for_all (agent {ET_CLASS}.is_in_group (a_group))
		end

	classes_in_group_recursive (a_group: ET_GROUP): DS_ARRAYED_LIST [ET_CLASS] is
			-- Classes among local, imported and overriding classes
			-- that are declared in `a_group' or recursively in one of its subgroups
		require
			a_group_not_void: a_group /= Void
		do
			create Result.make (1)
			if a_group.is_override then
				local_override_classes_do_if (agent Result.force_last, agent {ET_CLASS}.is_in_group_recursive (a_group))
				overriding_classes_do_all (agent {ET_ADAPTED_CLASS}.local_override_classes_do_if (agent Result.force_last, agent {ET_CLASS}.is_in_group_recursive (a_group)))
			else
				local_non_override_classes_do_if (agent Result.force_last, agent {ET_CLASS}.is_in_group_recursive (a_group))
				imported_classes_do_all (agent {ET_ADAPTED_CLASS}.local_classes_do_if (agent Result.force_last, agent {ET_CLASS}.is_in_group_recursive (a_group)))
			end
		ensure
			in_group: Result.for_all (agent {ET_CLASS}.is_in_group_recursive (a_group))
		end

feature -- Element change

	add_first_local_class (a_class: ET_CLASS) is
			-- Add `a_class' to `first_local_override_class' if `a_class' is
			-- in an override group, to `first_local_non_override_class' otherwise.
			-- If there was already such class, move it to `other_local_override_classes'
			-- or to `other_local_non_override_classes'.
			-- Update `intrinsic_class' and `is_modified' accordingly.
			--
			-- The difference between `add_first_local_class' and `add_last_local_class'
			-- is that here we try to set `intrinsic_class' to `a_class' if possible.
			-- This will happen if `a_class' is in an override group or if there was no
			-- `first_local_override_class'.
		require
			a_class_not_void: a_class /= Void
		do
			if a_class.is_in_override_group then
				add_first_local_override_class (a_class)
			else
				add_first_local_non_override_class (a_class)
			end
		end

	add_last_local_class (a_class: ET_CLASS) is
			-- If `a_class' is in an override group, then add `a_class' to `first_local_override_class'
			-- if no such class, otherwise add it to `other_local_override_classes'.
			-- If `a_class' is not in an override group, then add `a_class' to `first_local_non_override_class'
			-- if no such class, otherwise add it to `other_local_non_override_classes'.
			-- Update `intrinsic_class' and `is_modified' accordingly.
			--
			-- The difference between `add_first_local_class' and `add_last_local_class' is
			-- that here we try to avoid having to modify `intrinsic_class'. It will be modified,
			-- and hence set to `a_class', only if `a_class' is in an override group and there was
			-- no `first_local_override_class', or if there was no `first_local_override_class'
			-- and no `first_local_non_override_class'.
		require
			a_class_not_void: a_class /= Void
		do
			if a_class.is_in_override_group then
				add_last_local_override_class (a_class)
			else
				add_last_local_non_override_class (a_class)
			end
		end

	add_first_local_override_class (a_class: ET_CLASS) is
			-- Add `a_class' to `first_local_override_class'. If there was
			-- already such class, move it to `other_local_override_classes'.
			-- Update `intrinsic_class' and `is_modified' accordingly.
			--
			-- The difference between `add_first_local_override_class' and
			-- `add_last_local_override_class' is that here we are sure that
			-- `intrinsic_class' will be set to `a_class'.
		require
			a_class_not_void: a_class /= Void
		deferred
		end

	add_last_local_override_class (a_class: ET_CLASS) is
			-- Add `a_class' to `first_local_override_class', if there was
			-- no such class, otherwise add it to `other_local_override_classes'.
			-- Update `intrinsic_class' and `is_modified' accordingly.
			--
			-- The difference between `add_first_local_override_class' and
			-- `add_last_local_override_class' is that here we try to avoid
			-- having to modify `intrinsic_class'. It will be modified, and hence
			-- set to `a_class', only if there was no `first_local_override_class'.
		require
			a_class_not_void: a_class /= Void
		deferred
		end

	add_first_local_non_override_class (a_class: ET_CLASS) is
			-- Add `a_class' to `first_local_non_override_class'.
			-- If there was already such class, move it to `other_local_non_override_classes'.
			-- Update `intrinsic_class' and `is_modified' accordingly.
			--
			-- The difference between `add_first_local_non_override_class' and
			-- `add_last_local_non_override_class' is that here we try to set
			-- `intrinsic_class' to `a_class' if possible. This will happen
			-- if there was no `first_local_override_class'.
		require
			a_class_not_void: a_class /= Void
		deferred
		end

	add_last_local_non_override_class (a_class: ET_CLASS) is
			-- Add `a_class' to `first_local_non_override_class', if there was
			-- no such class, otherwise add it to `other_local_non_override_classes'.
			-- Update `intrinsic_class' and `is_modified' accordingly.
			--
			-- The difference between `add_first_local_non_override_class' and
			-- `add_last_local_non_override_class' is that here we try to avoid
			-- having to modify `intrinsic_class'. It will be modified, and hence
			-- set to `a_class', only if there was no `first_local_override_class'
			-- and no `first_local_non_override_class'.
		require
			a_class_not_void: a_class /= Void
		deferred
		end

	remove_local_class (a_class: ET_CLASS) is
			-- Remove `a_class' from `first_local_override_class', `other_local_override_classes',
			-- `first_local_non_override_class' and `other_local_non_override_classes'.
			-- Update `intrinsic_class' and `is_modified' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if a_class.is_in_override_group then
				remove_local_override_class (a_class)
			else
				remove_local_non_override_class (a_class)
			end
		end

	remove_local_override_class (a_class: ET_CLASS) is
			-- Remove `a_class' from `first_local_override_class' and `other_local_override_classes'.
		require
			a_class_not_void: a_class /= Void
		deferred
		end

	remove_local_non_override_class (a_class: ET_CLASS) is
			-- Remove `a_class' from `first_local_non_override_class' and `other_local_non_override_classes'.
			-- Update `intrinsic_class' and `is_modified' accordingly.
		require
			a_class_not_void: a_class /= Void
		deferred
		end

feature -- Iteration

	local_classes_do_all (a_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]) is
			-- Apply `a_action' to every class, among `actual_class' and the classes it overrides.
		require
			a_action_not_void: a_action /= Void
		do
			local_override_classes_do_all (a_action)
			local_non_override_classes_do_all (a_action)
		end

	local_override_classes_do_all (a_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]) is
			-- Apply `a_action' to every class, among `actual_class' and the classes it overrides, declared in override groups.
		require
			a_action_not_void: a_action /= Void
		local
			l_class: ET_CLASS
		do
			from
				l_class := actual_class
			until
				l_class = Void
			loop
				if l_class.is_in_override_group then
					a_action.call ([l_class])
				end
				l_class := l_class.overridden_class
			end
		end

	local_non_override_classes_do_all (a_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]) is
			-- Apply `a_action' to every class, among `actual_class' and the classes it overrides, declared in non-override groups.
		require
			a_action_not_void: a_action /= Void
		local
			l_class: ET_CLASS
		do
			from
				l_class := actual_class
			until
				l_class = Void
			loop
				if not l_class.is_in_override_group then
					a_action.call ([l_class])
				end
				l_class := l_class.overridden_class
			end
		end

	local_classes_do_if (a_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN]) is
			-- Apply `a_action' to every class, among `actual_class' and the classes it overrides,
			-- that satisfies `a_test'.
		require
			a_action_not_void: a_action /= Void
			a_test_not_void: a_test /= Void
		do
			local_override_classes_do_if (a_action, a_test)
			local_non_override_classes_do_if (a_action, a_test)
		end

	local_override_classes_do_if (a_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN]) is
			-- Apply `a_action' to every class, among `actual_class' and the classes it overrides, declared in override groups
			-- that satisfies `a_test'.
		require
			a_action_not_void: a_action /= Void
			a_test_not_void: a_test /= Void
		local
			l_class: ET_CLASS
		do
			from
				l_class := actual_class
			until
				l_class = Void
			loop
				if l_class.is_in_override_group then
					if a_test.item ([l_class]) then
						a_action.call ([l_class])
					end
				end
				l_class := l_class.overridden_class
			end
		end

	local_non_override_classes_do_if (a_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN]) is
			-- Apply `a_action' to every class, among `actual_class' and the classes it overrides, declared in non-override groups
			-- that satisfies `a_test'.
		require
			a_action_not_void: a_action /= Void
			a_test_not_void: a_test /= Void
		local
			l_class: ET_CLASS
		do
			from
				l_class := actual_class
			until
				l_class = Void
			loop
				if not l_class.is_in_override_group then
					if a_test.item ([l_class]) then
						a_action.call ([l_class])
					end
				end
				l_class := l_class.overridden_class
			end
		end

	imported_classes_do_all (a_action: PROCEDURE [ANY, TUPLE [ET_ADAPTED_CLASS]]) is
			-- Apply `a_action' to every imported class.
		require
			a_action_not_void: a_action /= Void
		do
		end

	imported_classes_do_if (a_action: PROCEDURE [ANY, TUPLE [ET_ADAPTED_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_ADAPTED_CLASS], BOOLEAN]) is
			-- Apply `a_action' to every imported class that satisfies `a_test'.
		require
			a_action_not_void: a_action /= Void
			a_test_not_void: a_test /= Void
		do
		end

	overriding_classes_do_all (a_action: PROCEDURE [ANY, TUPLE [ET_ADAPTED_CLASS]]) is
			-- Apply `a_action' to every overriding class declared in another universe.
		require
			a_action_not_void: a_action /= Void
		do
		end

	overriding_classes_do_if (a_action: PROCEDURE [ANY, TUPLE [ET_ADAPTED_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_ADAPTED_CLASS], BOOLEAN]) is
			-- Apply `a_action' to every overriding class declared in another universe that satisfies `a_test'.
		require
			a_action_not_void: a_action /= Void
			a_test_not_void: a_test /= Void
		do
		end

end
