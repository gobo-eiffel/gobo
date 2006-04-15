indexing

	description:

		"Eiffel provider checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PROVIDER_CHECKER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make,
			process_class
		end

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new provider checker for classes in `a_universe'.
		do
			precursor (a_universe)
		end

feature -- Processing

	process_class (a_class: ET_CLASS) is
			-- Parse `a_class' if not already done. Then check
			-- the dependence constraint of its cluster.
		local
			a_processor: like Current
		do
			if a_class = none_class then
				a_class.set_interface_checked
			elseif current_class /= unknown_class then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaaa_error
				create a_processor.make (universe)
				a_processor.process_class (a_class)
			elseif a_class /= unknown_class then
				internal_process_class (a_class)
			else
				set_fatal_error (a_class)
			end
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		do
			-- No error is fatal.
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS) is
			-- Parse `a_class' if not already done. Then check
			-- the dependence constraint of its cluster.
		require
			a_class_not_void: a_class /= Void
		local
			old_class: ET_CLASS
		do
			old_class := current_class
			current_class := a_class
				-- Parse of `current_class' if not already done.
			current_class.process (universe.eiffel_parser)
			if current_class.is_parsed and then not current_class.has_syntax_error then
				error_handler.report_compilation_status (Current, current_class)
				check_cluster_dependence_constraints
			else
				set_fatal_error (current_class)
			end
			current_class := old_class
		end

feature {NONE} -- Cluster dependence constraints

	check_cluster_dependence_constraints is
			-- Check of cluster dependence constraints.
		local
			l_cluster: ET_CLUSTER
			l_providers: DS_HASH_SET [ET_CLASS]
			l_providers_cursor: DS_HASH_SET_CURSOR [ET_CLASS]
			l_provider: ET_CLASS
			l_provider_cluster: ET_CLUSTER
			l_dependant_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT
			l_provider_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT
			l_overridden_class: ET_CLASS
		do
			if current_class.is_preparsed then
				l_cluster := current_class.cluster
				l_provider_constraint := l_cluster.provider_constraint
				l_overridden_class := current_class.non_override_overridden_class
				if l_overridden_class /= Void and then l_overridden_class.cluster /= Void then
					l_cluster := l_overridden_class.cluster
					if l_provider_constraint = Void then
						l_provider_constraint := l_cluster.provider_constraint
					end
				end
				l_providers := current_class.providers
				if l_providers /= Void then
					l_providers_cursor := l_providers.new_cursor
					from l_providers_cursor.start until l_providers_cursor.after loop
						l_provider := l_providers_cursor.item
						if not l_provider.is_preparsed then
							universe.preparse
						end
						if l_provider.is_preparsed then
							l_provider_cluster := l_provider.cluster
							l_dependant_constraint := l_provider_cluster.dependant_constraint
							l_overridden_class := l_provider.non_override_overridden_class
							if l_overridden_class /= Void and then l_overridden_class.cluster /= Void then
								l_provider_cluster := l_overridden_class.cluster
								if l_dependant_constraint = Void then
									l_dependant_constraint := l_provider_cluster.dependant_constraint
								end
							end
							if l_provider_constraint /= Void and then not l_provider_constraint.has_cluster (l_provider_cluster) then
								set_fatal_error (current_class)
								error_handler.report_gcpro_error (l_provider_constraint.current_cluster, current_class, l_provider, l_provider_constraint)
							end
							if l_dependant_constraint /= Void and then not l_dependant_constraint.has_cluster (l_cluster) then
								set_fatal_error (current_class)
								error_handler.report_gcdep_error (l_dependant_constraint.current_cluster, l_provider, current_class, l_dependant_constraint)
							end
						end
						l_providers_cursor.forth
					end
				end
			end
		end

end
