note

	description:

		"Eiffel lists of formal generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"

class ET_FORMAL_PARAMETER_LIST

inherit

	ET_ACTUAL_PARAMETER_LIST
		redefine
			item, put_first, process,
			resolved_formal_parameters,
			named_types, fixed_array
		end

create

	make, make_with_capacity

feature -- Initialization

	reset_constraint_base_types
			-- Reset 'constraint_base_types' and 'recursive_formal_constraints'
			-- as they were just after the current formal parameters were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				formal_parameter (i).reset_constraint_base_types
				i := i + 1
			end
		end

	reset_constraint_renames
			-- Reset constraint renames as they were just
			-- after they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				formal_parameter (i).reset_constraint_renames
				i := i + 1
			end
		end

	reset_constraint_creation_procedures
			-- Reset constraint creation procedures as they were just
			-- after they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				formal_parameter (i).reset_constraint_creation_procedures
				i := i + 1
			end
		end

feature -- Access

	item (i: INTEGER): ET_FORMAL_PARAMETER_ITEM
			-- Item at index `i' in list
		do
			Result := storage.item (count - i)
		end

	formal_parameter (i: INTEGER): ET_FORMAL_PARAMETER
			-- Type of `i'-th formal generic parameter
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).formal_parameter
		ensure
			formal_parameter_not_void: Result /= Void
		end

	formal_parameter_by_name (a_name: ET_IDENTIFIER): detachable ET_FORMAL_PARAMETER
			-- Formal generic parameter with name `a_name';
			-- Void if no such generic parameter
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			a_parameter: ET_FORMAL_PARAMETER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				a_parameter := storage.item (i).formal_parameter
				if a_parameter.name.same_identifier (a_name) then
					Result := a_parameter
					i := nb + 1  -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			has_formal_parameter: has_formal_parameter (a_name) = (Result /= Void)
			same_name: Result /= Void implies Result.name.same_identifier (a_name)
		end

	named_types (a_context: ET_TYPE_CONTEXT): ET_FORMAL_PARAMETER_LIST
			-- Named types of current parameters, when they appear in `a_context'
			-- in `a_universe', only made up of class names and generic
			-- formal parameters when the root type of `a_context' is a
			-- generic type not fully derived (Definition of base type in
			-- ETL2 p.198). Replace by "*UNKNOWN*" any unresolved identifier
			-- type, anchored type involved in a cycle.
		do
			Result := Current
		end

feature -- Status report

	has_formal_parameter (a_name: ET_IDENTIFIER): BOOLEAN
			-- Is `a_name' a formal generic parameter?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).formal_parameter.name.same_identifier (a_name) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Element change

	put_first (an_item: like item)
			-- Put `an_item' at first position in list.
		do
			precursor (an_item)
			an_item.formal_parameter.set_index (capacity - count + 1)
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETERS): ET_FORMAL_PARAMETER_LIST
			-- Version of current types where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		do
			Result := Current
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_formal_parameter_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_FORMAL_PARAMETER_ITEM]
			-- Fixed array routines
		once
			create Result
		end

end
