indexing

	description:

		"Eiffel creation clauses"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CREATOR

inherit

	KL_IMPORTED_ARRAY_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_clients: like clients; a_procedure_list: like procedure_list) is
			-- Create a new creation clause.
		require
			a_clients_not_void: a_clients /= Void
			no_void_procedure: a_procedure_list /= Void implies not ANY_ARRAY_.has (a_procedure_list, Void)
		do
			clients := a_clients
			procedure_list := a_procedure_list
		ensure
			clients_set: clients = a_clients
			procedure_list_set: procedure_list = a_procedure_list
		end

feature -- Access

	clients: ET_CLIENTS
			-- Clients

	procedure_list: ARRAY [ET_FEATURE_NAME]
			-- List of creation procedure names

feature -- Status report

	is_clause_empty: BOOLEAN is
			-- Is there no creation procedure name in current
			-- creation clause?
		do
			Result := procedure_list = Void or else procedure_list.count = 0
		end

	has_procedure (a_name: ET_FEATURE_NAME): BOOLEAN is
			-- Is `a_name' listed in current creation clause?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			if procedure_list /= Void then
				i := procedure_list.lower
				nb := procedure_list.upper
				from until i > nb loop
					if a_name.same_feature_name (procedure_list.item (i)) then
						Result := True
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	is_exported_to (a_name: ET_FEATURE_NAME; a_class: ET_CLASS): BOOLEAN is
			-- Is feature name listed in current creation clause
			-- and is it exported to `a_class'?
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			if not is_clause_empty then
				if clients.is_exported_to (a_class) then
					Result := has_procedure (a_name)
				end
			end
		end

invariant

	clients_not_void: clients /= Void
	no_void_procedure: procedure_list /= Void implies not ANY_ARRAY_.has (procedure_list, Void)

end -- class ET_CREATOR
