note

	description:

		"Eiffel lists of creation clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"

class ET_CREATOR_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_CREATOR]

create

	make, make_with_capacity

feature -- Initialization

	reset
			-- Reset creators as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).reset
				i := i + 1
			end
		end

feature -- Status report

	is_exported_to (a_name: ET_FEATURE_NAME; a_client: ET_CLASS; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Is feature name `a_name' listed in current creation clauses
			-- and is it exported to `a_client'?
			-- (Note: Use `a_system_processor.ancestor_builder' on the classes whose ancestors
			-- need to be built in order to check for descendants.)
		require
			a_name_not_void: a_name /= Void
			a_client_not_void: a_client /= Void
			a_system_processor_not_void: a_system_processor /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).is_exported_to (a_name, a_client, a_system_processor) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	is_directly_exported_to (a_name: ET_FEATURE_NAME; a_client: ET_CLASS): BOOLEAN
			-- Is feature name `a_name' listed in current creation clauses
			-- and is it directly_exported to `a_client'?
			-- This is different from `is_exported_to' where `a_client' can
			-- be a descendant of a class appearing in the list of clients.
			-- Note: The use of 'direct' in the name of this feature has not
			-- the same meaning as 'direct and indirect client' in ETL2 p.91.
		require
			a_name_not_void: a_name /= Void
			a_client_not_void: a_client /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).is_directly_exported_to (a_name, a_client) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_feature_name (a_name: ET_FEATURE_NAME): BOOLEAN
			-- Is feature name `a_name' listed in current creation clauses?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).has_feature_name (a_name) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Access

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if is_empty then
				Result := tokens.null_position
			else
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if not is_empty then
				Result := first.first_leaf
			else
				Result := tokens.null_leaf
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			else
				Result := tokens.null_leaf
			end
		end

feature -- Basic operations

	add_creations_exported_to (a_client: ET_CLASS; a_set: DS_HASH_SET [ET_FEATURE_NAME]; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Add to `a_set' the feature name of creation procedures which are
			-- exported to `a_client'.
			-- (Note: Use `a_system_processor.ancestor_builder' on the classes
			-- whose ancestors need to be built in order to check for descendants.)
		require
			a_client_not_void: a_client /= Void
			a_set_not_void: a_set /= Void
			no_void_names: not a_set.has_void
			a_system_processor_not_void: a_system_processor /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).add_creations_exported_to (a_client, a_set, a_system_processor)
				i := i + 1
			end
		end

	add_creation_clients_to (a_name: ET_FEATURE_NAME; a_clients: ET_CLIENT_LIST)
			-- If feature name `a_name' is listed in current creation clauses,
			-- then add its creation clients to `a_clients'.
		require
			a_name_not_void: a_name /= Void
			a_clients_not_void: a_clients /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).add_creation_clients_to (a_name, a_clients)
				i := i + 1
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_creator_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_CREATOR]
			-- Fixed array routines
		once
			create Result
		end

end
