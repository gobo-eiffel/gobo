note

	description:

	"[
		Eiffel constraints on formal generic parameters where the 
		actual generic parameters need to conform to just one type,
		which is a base type), and with a rename clause.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BASE_TYPE_RENAME_CONSTRAINT

inherit

	ET_BASE_TYPE_CONSTRAINT
		undefine
			renames,
			is_formal_parameter
		redefine
			named_query,
			named_procedure,
			add_overloaded_queries,
			add_overloaded_procedures
		end

	ET_TYPE_RENAME_CONSTRAINT
		undefine
			type_constraint
		redefine
			type,
			process
		end

create

	make

feature -- Access

	type: ET_BASE_TYPE
			-- Type to which the actual generic parameters
			-- will need to conform

feature -- Features

	named_query (a_name: ET_CALL_NAME): detachable ET_QUERY
			-- Query named `a_name' in `type'.
			-- Take into account possible renaming with `renames'.
			-- Void if no such query.
		local
			l_index: INTEGER
		do
			l_index := renames.index_of_new_name (a_name)
			if l_index /= 0 then
				Result := base_class.queries.named_feature (renames.rename_pair (l_index).old_name)
			elseif attached type.base_class.queries.named_feature (a_name) as l_query and then renames.index_of_old_name (l_query.name) = 0 then
				Result := l_query
			end
		end

	named_procedure (a_name: ET_CALL_NAME): detachable ET_PROCEDURE
			-- Procedure named `a_name' in `type'.
			-- Take into account possible renaming with `renames'.
			-- Void if no such procedure.
		local
			l_index: INTEGER
		do
			l_index := renames.index_of_new_name (a_name)
			if l_index /= 0 then
				Result := base_class.procedures.named_feature (renames.rename_pair (l_index).old_name)
			elseif attached base_class.procedures.named_feature (a_name) as l_procedure and then renames.index_of_old_name (l_procedure.name) = 0 then
				Result := l_procedure
			end
		end

	add_overloaded_queries (a_name: ET_CALL_NAME; a_list: DS_ARRAYED_LIST [ET_QUERY])
			-- Add to `a_list' queries whose name or overloaded name is `a_name'.
			-- Take into account possible renaming.
		local
			l_index: INTEGER
			l_old_count: INTEGER
			i: INTEGER
		do
			l_index := renames.index_of_new_name (a_name)
			if l_index /= 0 then
				base_class.add_overloaded_queries (renames.rename_pair (l_index).old_name, a_list)
			else
				l_old_count := a_list.count
				base_class.add_overloaded_queries (a_name, a_list)
				from i := a_list.count until i = l_old_count loop
					if renames.index_of_old_name (a_list.item (i).name) /= 0 then
						a_list.remove (i)
					end
					i := i - 1
				end
			end
		end

	add_overloaded_procedures (a_name: ET_CALL_NAME; a_list: DS_ARRAYED_LIST [ET_PROCEDURE])
			-- Add to `a_list' procedures whose name or overloaded name is `a_name'.
			-- Take into account possible renaming.
		local
			l_index: INTEGER
			l_old_count: INTEGER
			i: INTEGER
		do
			l_index := renames.index_of_new_name (a_name)
			if l_index /= 0 then
				base_class.add_overloaded_procedures (renames.rename_pair (l_index).old_name, a_list)
			else
				l_old_count := a_list.count
				base_class.add_overloaded_procedures (a_name, a_list)
				from i := a_list.count until i = l_old_count loop
					if renames.index_of_old_name (a_list.item (i).name) /= 0 then
						a_list.remove (i)
					end
					i := i - 1
				end
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_base_type_rename_constraint (Current)
		end

end
