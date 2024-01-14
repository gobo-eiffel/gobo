note

	description:

		"Eiffel provider checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2017, Eric Bezault and others"
	license: "MIT License"

class ET_PROVIDER_CHECKER

inherit

	ET_CLASS_PROCESSOR

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_class
		end

create

	make

feature -- Processing

	process_class (a_class: ET_CLASS)
			-- Parse `a_class' if not already done. Then check
			-- the dependence constraint of its cluster.
		local
			a_processor: like Current
		do
			if a_class.is_none then
				-- Do nothing.
			elseif not current_class.is_unknown then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaaa_error
				create a_processor.make (system_processor)
				a_processor.process_class (a_class)
			elseif a_class.is_unknown then
				set_fatal_error (a_class)
				error_handler.report_giaaa_error
			elseif not a_class.is_preparsed then
				set_fatal_error (a_class)
			else
				internal_process_class (a_class)
			end
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS)
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			-- No error is fatal.
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS)
			-- Parse `a_class' if not already done. Then check
			-- the dependence constraint of its cluster.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
		do
			old_class := current_class
			current_class := a_class
				-- Parse of `current_class' if not already done.
			current_class.process (system_processor.eiffel_parser)
			if current_class.is_parsed and then not current_class.has_syntax_error then
				error_handler.report_compilation_status (Current, current_class, system_processor)
				check_cluster_dependence_constraints
			else
				set_fatal_error (current_class)
			end
			current_class := old_class
		end

feature {NONE} -- Cluster dependence constraints

	check_cluster_dependence_constraints
			-- Check of cluster dependence constraints.
		local
			l_group: ET_GROUP
			l_cluster: ET_CLUSTER
			l_providers_cursor: DS_HASH_SET_CURSOR [ET_NAMED_CLASS]
			l_named_provider: ET_NAMED_CLASS
			l_provider: ET_CLASS
			l_provider_group: ET_GROUP
			l_dependant_constraint: detachable ET_CLUSTER_DEPENDENCE_CONSTRAINT
			l_provider_constraint: detachable ET_CLUSTER_DEPENDENCE_CONSTRAINT
		do
			if current_class.is_preparsed then
				l_group := current_class.group
				if l_group.is_cluster then
					l_cluster := l_group.cluster
					l_provider_constraint := l_cluster.provider_constraint
					if l_cluster.scm_mapping_constraint_enabled then
						if attached l_cluster.scm_write_mapping_recursive as l_scm_write_mapping then
							if attached scm_mapped_cluster (l_cluster) as l_mapped_cluster then
								l_group := l_mapped_cluster
								l_provider_constraint := l_mapped_cluster.provider_constraint
							else
								l_provider_constraint := Void
							end
						end
					elseif l_cluster.overridden_constraint_enabled then
						if attached current_class.first_non_override_overridden_class as l_overridden_class then
							l_group := l_overridden_class.group
							if l_group.is_cluster then
								l_provider_constraint := l_group.cluster.provider_constraint
							else
								l_provider_constraint := Void
							end
						end
					end
				end
				if attached current_class.providers as l_providers then
					l_providers_cursor := l_providers.new_cursor
					from l_providers_cursor.start until l_providers_cursor.after loop
						l_named_provider := l_providers_cursor.item
						l_provider := l_named_provider.actual_class
						if l_provider.is_none then
							-- Skip this one: no constraint on class NONE.
						elseif l_provider.is_preparsed then
							l_dependant_constraint := Void
							l_provider_group := l_provider.group
							if l_provider_group.is_cluster then
								l_cluster := l_provider_group.cluster
								l_dependant_constraint := l_cluster.dependant_constraint
								if l_cluster.scm_mapping_constraint_enabled then
									if attached l_cluster.scm_write_mapping_recursive as l_scm_write_mapping then
										if attached scm_mapped_cluster (l_cluster) as l_mapped_cluster then
											l_provider_group := l_mapped_cluster
											l_dependant_constraint := l_mapped_cluster.dependant_constraint
										else
											l_dependant_constraint := Void
										end
									end
								elseif l_cluster.overridden_constraint_enabled then
									if attached l_provider.first_non_override_overridden_class as l_overridden_class then
										l_provider_group := l_overridden_class.group
										if l_provider_group.is_cluster then
											l_dependant_constraint := l_provider_group.cluster.dependant_constraint
										else
											l_dependant_constraint := Void
										end
									end
								end
							end
							if l_provider_constraint /= Void and then not l_provider_constraint.has_group (l_provider_group) then
								set_fatal_error (current_class)
								error_handler.report_gcpro_error (l_provider_constraint.current_cluster, current_class, l_provider, l_provider_constraint)
							end
							if l_dependant_constraint /= Void and then not l_dependant_constraint.has_group (l_group) then
								set_fatal_error (current_class)
								error_handler.report_gcdep_error (l_dependant_constraint.current_cluster, l_provider, current_class, l_dependant_constraint)
							end
						end
						l_providers_cursor.forth
					end
				end
			end
		end

	scm_mapped_cluster (a_cluster: ET_CLUSTER): detachable ET_CLUSTER
			-- Cluster where classes from `a_cluster' will be checked-in to, if any
		require
			a_cluster_not_void: a_cluster /= Void
		do
			if attached a_cluster.scm_write_mapping_recursive as l_scm_write_mapping then
				if l_scm_write_mapping.master_cluster = l_scm_write_mapping.current_cluster then
					Result := a_cluster
				else
					Result := l_scm_write_mapping.master_cluster.cluster_with_relative_pathname_to (a_cluster, l_scm_write_mapping.current_cluster)
				end
			end
		end

end
