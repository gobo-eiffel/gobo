indexing

	description:

		"Lists of descendants of Eiffel classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: $"

class ET_DESCENDANT_CLASSES

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new descendant classes.
		do
			create descendants_cache.make_map (50000)
		end

feature -- Initialization

	reset is
			-- Reset the cache so that to force the computation of the list
			-- of descendant classes next time `descendants' will be called.
		do
			descendants_cache.wipe_out
		end

	build_all_descendants (a_system: ET_SYSTEM) is
			-- Build descendants of all classes marked in `a_system' and
			-- keep them in a cache to be used by next calls to `descendants'.
			--
			-- It is assumed that the ancestors of all classes marked in the
			-- system have already been successfully built. Otherwise some
			-- classes may be missing when building the list of descendant classes.
		require
			a_system_not_void: a_system /= Void
		do
			descendants_cache.wipe_out
			a_system.classes_do_recursive (agent add_to_ancestors)
			a_system.classes_do_recursive (agent add_no_descendants)
		end

feature -- Status report

	deferred_excluded: BOOLEAN
			-- Should deferred classes not be included in the list of descendants?

	none_excluded: BOOLEAN
			-- Should class "NONE" not be included in the list of descendants?

feature -- Status setting

	set_deferred_excluded (b: BOOLEAN) is
			-- Set `deferred_excluded' to `b'.
			--
			-- Note that `reset' might need to be called for this to take effect
			-- on lists of descendants which have already been computed and stored
			-- in the cache.
		do
			deferred_excluded := b
		ensure
			deferred_excluded_set: deferred_excluded = b
		end

	set_none_excluded (b: BOOLEAN) is
			-- Set `none_excluded' to `b'.
			--
			-- Note that `reset' might need to be called for this to take effect
			-- on lists of descendants which have already been computed and stored
			-- in the cache.
		do
			none_excluded := b
		ensure
			none_excluded_set: none_excluded = b
		end

feature -- Access

	descendants (a_class: ET_CLASS): DS_ARRAYED_LIST [ET_CLASS] is
			-- Proper descendant classes of `a_class' that have been marked
			-- as being part of the system
			--
			-- It is assumed that the ancestors of all classes marked in the
			-- system have already been successfully built. Otherwise some
			-- classes may be missing when building the list of descendant classes.
			--
			-- Note that for efficiency, the result is kept in cache. To force the
			-- computation of the list of descendant classes, please call `reset'.
		require
			a_class_not_void: a_class /= Void
		do
			descendants_cache.search (a_class)
			if descendants_cache.found then
				Result := descendants_cache.found_item
			else
				create Result.make (50)
				descendants_cache.force_last_new (Result, a_class)
				if a_class.is_preparsed then
					a_class.current_system.classes_do_recursive (agent add_to_descendants (a_class, ?, Result))
				end
			end
		ensure
			descendants_not_void: Result /= Void
			no_void_descendant: not Result.has_void
		end

feature {NONE} -- Implementation

	descendants_cache: DS_HASH_TABLE [DS_ARRAYED_LIST [ET_CLASS], ET_CLASS]
			-- Descendants of a given class that have already been computed,
			-- indexed by the given class

	add_to_descendants (a_class, a_other_class: ET_CLASS; a_descendants: DS_ARRAYED_LIST [ET_CLASS])
			-- Add `a_other_class' to `a_descendants' if it is a proper descendant
			-- of `a_class' that has been marked as being part of the system.
		require
			a_class_not_void: a_class /= Void
			a_other_class_not_void: a_other_class /= Void
			a_descendants_not_void: a_descendants /= Void
			no_void_descendants: not a_descendants.has_void
		do
			if not a_other_class.is_marked then
				-- Ignore this class: not in the compiled system.
			elseif none_excluded and then a_other_class.is_none then
				-- We are not interested in class "NONE".
			elseif deferred_excluded and then a_other_class.is_deferred then
				-- We are not interested in deferred classes.
			elseif not a_other_class.ancestors_built_successfully then
				-- We cannot determine whether `a_class' is an
				-- ancestor of `a_other_class' in that case.
			elseif a_other_class.has_ancestor (a_class) then
				a_descendants.force_last (a_other_class)
			end
		ensure
			no_void_descendants: not a_descendants.has_void
		end

	add_to_ancestors (a_class: ET_CLASS) is
			-- Add `a_class' to the descendants of its ancestors.
		require
			a_class_not_void: a_class /= Void
		do
			if not a_class.is_marked then
				-- Ignore this class: not in the compiled system.
			elseif none_excluded and then a_class.is_none then
				-- We are not interested in class "NONE".
			elseif deferred_excluded and then a_class.is_deferred then
				-- We are not interested in deferred classes.
			elseif not a_class.ancestors_built_successfully then
				-- We cannot determine whether `a_class' is an
				-- ancestor of `a_other_class' in that case.
			else
				a_class.ancestors.do_all (agent add_to_ancestor (a_class, ?))
			end
		end

	add_to_ancestor (a_class: ET_CLASS; a_ancestor: ET_BASE_TYPE) is
			-- Add `a_class' to the descendants of `a_ancestors'.
		require
			a_class_not_void: a_class /= Void
			a_ancestor_not_void: a_ancestor /= Void
		local
			l_ancestor_class: ET_CLASS
			l_descendants: DS_ARRAYED_LIST [ET_CLASS]
		do
			l_ancestor_class := a_ancestor.base_class
			descendants_cache.search (l_ancestor_class)
			if descendants_cache.found then
				l_descendants := descendants_cache.found_item
			else
				create l_descendants.make (50)
				descendants_cache.force_last_new (l_descendants, l_ancestor_class)
			end
			l_descendants.force_last (a_class)
		end

	add_no_descendants (a_class: ET_CLASS) is
			-- Associate `no_descendants' to `a_class' if no descendant
			-- has been found for this class.
		require
			a_class_not_void: a_class /= Void
		do
			descendants_cache.search (a_class)
			if not descendants_cache.found then
				descendants_cache.force_last_new (no_descendants, a_class)
			end
		end

	no_descendants: DS_ARRAYED_LIST [ET_CLASS] is
			-- Shared empty list descendants
		once
			create Result.make (50)
		ensure
			no_descendants_not_void: Result /= Void
		end

invariant

	descendants_cache_not_void: descendants_cache /= Void
	no_void_descendant_list: not descendants_cache.has_void_item
	no_void_descendants: not descendants_cache.there_exists (agent {DS_ARRAYED_LIST [ET_CLASS]}.has_void)

end
