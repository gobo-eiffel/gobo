indexing

	description: 

		"Context for namespace resolver"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_NAMESPACE_RESOLVER_CONTEXT

creation

	make

feature {NONE} -- Creation

	make is
			-- Make context.
		do
			!! context.make
		end

feature {NONE} -- Implementation

	context: DS_BILINKED_LIST [DS_HASH_TABLE [UC_STRING, UC_STRING]]
			-- Really a DS_STACK but we need to see 
			-- the content.

feature -- Add

	add_default (a_namespace: UC_STRING) is
			-- Add default namespace to context.
		require
			not_void: a_namespace /= Void
		do
			add (a_namespace, Default_pseudo_prefix)
		end

	add (a_namespace: UC_STRING; a_prefix: UC_STRING) is
			-- Add namespace to context.
		require
			not_void: a_namespace /= Void
			prefix_not_void: a_prefix /= Void
			not_has: not shallow_has (a_prefix)
		do
			context.last.force_new (a_namespace, a_prefix)
		end

feature -- Query

	shallow_has (a_prefix: UC_STRING): BOOLEAN is
			-- Is this prefix known at the current level?
			-- (for duplicate declaration checks)
		require
			not_void: a_prefix /= Void
		do
			Result := context.count > 0 and then context.last.has (a_prefix)
		end

	has (a_prefix: UC_STRING): BOOLEAN is
			-- Is this prefix known
		require
			not_void: a_prefix /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR[DS_HASH_TABLE[UC_STRING, UC_STRING]]
		do
			from
				a_cursor := context.new_cursor
				a_cursor.finish
			until	
				a_cursor.before
			loop
				Result := a_cursor.item.has (a_prefix)
				if Result then
					a_cursor.go_before
				else
					a_cursor.back
				end
			end
		end

	resolve_default: UC_STRING is
			-- Resolve default namespace.
		do
			Result := resolve (Default_pseudo_prefix)
		end

	resolve (a_prefix: UC_STRING): UC_STRING is
			-- Resolve a prefix.
		require
			not_void: a_prefix /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR[DS_HASH_TABLE[UC_STRING, UC_STRING]]
		do
			Result := Default_namespace
			from
				a_cursor := context.new_cursor
				a_cursor.finish
			until	
				a_cursor.before
			loop
				if a_cursor.item.has (a_prefix) then
					Result := a_cursor.item.item (a_prefix)
					a_cursor.go_before
				else
					a_cursor.back
				end
			end
		ensure
			not_void: Result /= Void
		end

feature -- Stack

	push is
			-- Push element context.
		local
			a_table: DS_HASH_TABLE [UC_STRING, UC_STRING]
		do
			!! a_table.make (0)
			context.force_last (a_table)
		end

	pop is
			-- Pop element context.
		do
			if context.count > 0 then
				context.remove_last
			end
		end

feature {NONE} -- Constants

	Default_pseudo_prefix: UC_STRING is
			-- Default pseduo prefix
		once
			!! Result.make (0)
		end

	Default_namespace: UC_STRING is
			-- Default namespace (empty)
		once
			!! Result.make (0)
		end

end
