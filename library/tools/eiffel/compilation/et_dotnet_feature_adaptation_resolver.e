indexing

	description:

		"Feature adaptation resolvers for .NET classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_FEATURE_ADAPTATION_RESOLVER

inherit

	ANY -- Needed for SE.

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new feature adaptation resolver for .NET classes in `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			l_dotnet_signature_tester: ET_DOTNET_SIGNATURE_TESTER
		do
			universe := a_universe
			current_class := a_universe.unknown_class
			create dotnet_features.make_map (400)
			create l_dotnet_signature_tester.make (a_universe)
			dotnet_features.set_key_equality_tester (l_dotnet_signature_tester)
		ensure
			universe_set: universe = a_universe
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Error handling

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when checking
			-- validity of last feature adaptations?

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := universe.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Feature adaptation resolving

	resolve_feature_adaptations (a_class: ET_CLASS; a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]) is
			-- Resolve the feature inheritance of `a_class'
			-- and put resulting features in `a_features'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_is_dotnet: a_class.is_dotnet
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
		local
			old_class: ET_CLASS
			a_parents: ET_PARENT_LIST
			i, nb: INTEGER
			l_feature: ET_FLATTENED_FEATURE
			other_feature: ET_FLATTENED_FEATURE
			l_any: ET_CLASS
			l_name: ET_FEATURE_NAME
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
				-- Under .NET the features that we get from the assembly
				-- consumer are not only those declared in `current_class'
				-- but also those inherited from other .NET classes.
			add_current_features
				-- Traverse parents' .NET features in order to build back
				-- the inheritance links with the features in `current_class'.
				-- Using `dotnet_features' helps here because it takes into
				-- account possibly overloaded feature names when building
				-- the inheritance links.
			a_parents := current_class.parents
			if a_parents = Void or else a_parents.is_empty then
				if current_class = universe.system_object_class then
						-- Features from "ANY" will be added at the end.
					a_parents := Void
				else
					a_parents := universe.system_object_parents
				end
			end
			if a_parents /= Void then
				nb := a_parents.count
				from i := 1 until i > nb loop
					add_inherited_features (a_parents.parent (i))
					i := i + 1
				end
			end
			l_any := universe.any_class
			nb := dotnet_features.count + l_any.queries.count + l_any.procedures.count
			if a_features.capacity < nb then
				a_features.resize (nb)
			end
			from dotnet_features.start until dotnet_features.after loop
				l_feature := dotnet_features.item_for_iteration
				l_name := l_feature.name
				a_features.search (l_name)
				if a_features.found then
						-- Error: two features with the same name. This is
						-- doe to a bad design decision in the metadata consumer
						-- which for each 'x' field introduces a setter 'set_x_field'
						-- without checking whether this name is not already used.
					set_fatal_error
					other_feature := a_features.found_item
					error_handler.report_vmfn0a_error (current_class, other_feature.flattened_feature, l_feature.flattened_feature)
				else
					a_features.put_last (l_feature, l_name)
				end
				dotnet_features.forth
			end
				-- Add to `a_features' features inherited from ANY.
			add_any_features (a_features)
				-- Clean up.
			dotnet_features.wipe_out
			free_parent_feature := parent_feature_list
			free_inherited_feature := inherited_feature_list
			free_redeclared_feature := redeclared_feature_list
			current_class := old_class
		ensure
			no_void_feature: not a_features.has_item (Void)
		end

feature {NONE} -- Feature recording

	add_current_features is
			-- Add to `dotnet_features' the .NET features of `current_class'
			-- declared in its assembly.
		local
			l_query: ET_QUERY
			l_queries: ET_QUERY_LIST
			l_procedure: ET_PROCEDURE
			l_procedures: ET_PROCEDURE_LIST
			l_dotnet_feature: ET_DOTNET_FEATURE
			other_feature: ET_FLATTENED_FEATURE
			i, nb, nb2: INTEGER
		do
			l_queries := current_class.queries
			l_procedures := current_class.procedures
			nb := l_queries.declared_count
			nb2 := nb + l_procedures.declared_count
			if dotnet_features.capacity < nb2 then
				dotnet_features.resize (nb2)
			end
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				l_dotnet_feature ?= l_query
				if l_dotnet_feature /= Void then
					dotnet_features.search (l_dotnet_feature)
					if dotnet_features.found then
							-- Error: two features with the same .NET name and signature.
						set_fatal_error
						other_feature := dotnet_features.found_item
						error_handler.report_vmfn0a_error (current_class, other_feature.flattened_feature, l_dotnet_feature)
					else
						dotnet_features.put_last (l_dotnet_feature, l_dotnet_feature)
					end
				else
						-- Internal error: should be a .NET feature.
					set_fatal_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
			nb := nb2 - nb
			from i := 1 until i > nb loop
				l_procedure := l_procedures.item (i)
				l_dotnet_feature ?= l_procedure
				if l_dotnet_feature /= Void then
					dotnet_features.search (l_dotnet_feature)
					if dotnet_features.found then
							-- Error: two features with the same .NET name and signature.
						set_fatal_error
						other_feature := dotnet_features.found_item
						error_handler.report_vmfn0a_error (current_class, other_feature.flattened_feature, l_dotnet_feature)
					else
						dotnet_features.put_last (l_dotnet_feature, l_dotnet_feature)
					end
				else
						-- Internal error: should be a .NET feature.
					set_fatal_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		end

	add_inherited_features (a_parent: ET_PARENT) is
			-- Add to `dotnet_features' the .NET features inherited from `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		local
			l_class: ET_CLASS
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			l_flattened_feature: ET_FLATTENED_FEATURE
			l_redeclared_feature: ET_REDECLARED_FEATURE
			l_parent_feature: ET_PARENT_FEATURE
			l_parent_query: ET_DOTNET_QUERY
			l_parent_procedure: ET_DOTNET_PROCEDURE
			l_heir_feature: ET_DOTNET_FEATURE
			l_parent_class_impl: ET_CLASS
			l_heir_class_impl: ET_CLASS
			i, nb: INTEGER
		do
			l_class := a_parent.type.direct_base_class (universe)
			l_queries := l_class.queries
			l_procedures := l_class.procedures
			nb := l_queries.declared_count + l_procedures.declared_count + dotnet_features.count
			if dotnet_features.capacity < nb then
				dotnet_features.resize (nb)
			end
			nb := l_queries.declared_count
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				l_parent_query ?= l_query
				if l_parent_query /= Void then
						-- Look for .NET feature with the same .NET name and the same signature.
					dotnet_features.search (l_parent_query)
					if dotnet_features.found then
						l_flattened_feature := Void
						l_heir_feature := dotnet_features.found_key
						l_heir_class_impl := l_heir_feature.implementation_class
						l_parent_class_impl := l_parent_query.implementation_class
						if not l_heir_feature.is_virtual then
							if l_parent_class_impl = l_heir_class_impl then
								l_flattened_feature := dotnet_features.found_item
								l_heir_feature.set_implementation_feature (l_parent_query.implementation_feature)
								l_heir_feature.set_version (l_parent_query.version)
							else
-- TODO: this feature does not seem to exist anymore in `current_class',
-- it's the joy of .NET.
							end
						elseif current_class.is_interface and l_heir_feature.is_deferred and l_heir_class_impl /= l_parent_class_impl then
-- TODO: an interface and a parent interface defined a feature with the same .NET name
-- and signature, they are considered as two different unrelated features.
						elseif l_parent_query.is_frozen and l_heir_class_impl /= l_parent_class_impl then
-- TODO: if the feature is frozen in the parent then they should be declared in the same class.
-- If not then they are two different routines.
						elseif not l_heir_class_impl.conforms_to_type (l_parent_class_impl, current_class, current_class, universe) then
-- TODO: there is no guarantee that these two features are related.
						else
							l_flattened_feature := dotnet_features.found_item
							if l_parent_class_impl = l_heir_class_impl then
								l_heir_feature.set_implementation_feature (l_parent_query.implementation_feature)
								l_heir_feature.set_version (l_parent_query.version)
							end
						end
						if l_flattened_feature /= Void then
							l_parent_feature := new_parent_feature (l_parent_query, a_parent)
							if l_flattened_feature.is_immediate then
								l_redeclared_feature := new_redeclared_feature (l_heir_feature, l_parent_feature)
								dotnet_features.replace_found_item (l_redeclared_feature)
							else
								l_flattened_feature.adapted_feature.put_parent_feature (l_parent_feature)
							end
						end
					else
-- TODO: this feature does not seem to exist anymore in `current_class',
-- it's the joy of .NET.
					end
				else
						-- Internal error: should be a .NET feature.
					set_fatal_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
			nb := l_procedures.declared_count
			from i := 1 until i > nb loop
				l_procedure := l_procedures.item (i)
				l_parent_procedure ?= l_procedure
				if l_parent_procedure /= Void then
						-- Look for .NET feature with the same .NET name and the same signature.
					dotnet_features.search (l_parent_procedure)
					if dotnet_features.found then
						l_flattened_feature := Void
						l_heir_feature := dotnet_features.found_key
						l_heir_class_impl := l_heir_feature.implementation_class
						l_parent_class_impl := l_parent_procedure.implementation_class
						if not l_heir_feature.is_virtual then
							if l_parent_class_impl = l_heir_class_impl then
								l_flattened_feature := dotnet_features.found_item
								l_heir_feature.set_implementation_feature (l_parent_procedure.implementation_feature)
								l_heir_feature.set_version (l_parent_procedure.version)
							else
-- TODO: this feature does not seem to exist anymore in `current_class',
-- it's the joy of .NET.
							end
						elseif current_class.is_interface and l_heir_feature.is_deferred and l_heir_class_impl /= l_parent_class_impl then
-- TODO: an interface and a parent interface defined a feature with the same .NET name
-- and signature, they are considered as two different unrelated features.
						elseif l_parent_procedure.is_frozen and l_heir_class_impl /= l_parent_class_impl then
-- TODO: if the feature is frozen in the parent then they should be declared in the same class.
-- If not then they are two different routines.
						elseif not l_heir_class_impl.conforms_to_type (l_parent_class_impl, current_class, current_class, universe) then
-- TODO: there is no guarantee that these two features are related.
						else
							l_flattened_feature := dotnet_features.found_item
							if l_parent_class_impl = l_heir_class_impl then
								l_heir_feature.set_implementation_feature (l_parent_procedure.implementation_feature)
								l_heir_feature.set_version (l_parent_procedure.version)
							end
						end
						if l_flattened_feature /= Void then
							l_parent_feature := new_parent_feature (l_parent_procedure, a_parent)
							if l_flattened_feature.is_immediate then
								l_redeclared_feature := new_redeclared_feature (l_heir_feature, l_parent_feature)
								dotnet_features.replace_found_item (l_redeclared_feature)
							else
								l_flattened_feature.adapted_feature.put_parent_feature (l_parent_feature)
							end
						end
					else
-- TODO: this feature does not seem to exist anymore in `current_class',
-- it's the joy of .NET.
					end
				else
						-- Internal error: should be a .NET feature.
					set_fatal_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		end

	add_any_features (a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]) is
			-- Add to `a_features' features inherited from class "ANY".
		require
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
		local
			l_any: ET_CLASS
			l_any_parent: ET_PARENT
			l_query: ET_QUERY
			l_queries: ET_QUERY_LIST
			l_procedure: ET_PROCEDURE
			l_procedures: ET_PROCEDURE_LIST
			l_base_name: STRING
			l_new_name: STRING
			l_name: ET_FEATURE_NAME
			i, j, nb, nb2: INTEGER
			l_inherited_feature: ET_INHERITED_FEATURE
			l_parent_feature: ET_PARENT_FEATURE
			l_rename: ET_RENAME
			l_identifier: ET_IDENTIFIER
		do
			l_any := universe.any_class
			l_any_parent := universe.any_parent
			l_queries := l_any.queries
			l_procedures := l_any.procedures
			nb := l_queries.count
			nb2 := nb + l_procedures.count
			if a_features.capacity < nb2 then
				a_features.resize (nb2)
			end
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				l_parent_feature := new_parent_feature (l_query, l_any_parent)
				l_name := l_query.name
				if a_features.has (l_name) then
					from
						j := 1
						l_identifier ?= l_name
						if l_identifier /= Void then
							l_base_name := "any_" + l_identifier.name
						else
							l_base_name := "any_query"
						end
						create l_identifier.make (l_base_name)
					until
						not a_features.has (l_identifier)
					loop
						create l_new_name.make (l_base_name.count + 2)
						l_new_name.append_string (l_base_name)
						l_new_name.append_character ('_')
						l_new_name.append_string (j.out)
						create l_identifier.make (l_new_name)
						j := j + 1
					end
					create l_rename.make (l_name, l_identifier)
					l_parent_feature.set_new_name (l_rename)
					l_name := l_identifier
				end
				l_inherited_feature := new_inherited_feature (l_parent_feature)
				a_features.put_last (l_inherited_feature, l_name)
				i := i + 1
			end
			nb := nb2 - nb
			from i := 1 until i > nb loop
				l_procedure := l_procedures.item (i)
				l_parent_feature := new_parent_feature (l_procedure, l_any_parent)
				l_name := l_procedure.name
				if a_features.has (l_name) then
					from
						j := 1
						l_identifier ?= l_name
						if l_identifier /= Void then
							l_base_name := "any_" + l_identifier.name
						else
							l_base_name := "any_procedure"
						end
						create l_identifier.make (l_base_name)
					until
						not a_features.has (l_identifier)
					loop
						create l_new_name.make (l_base_name.count + 2)
						l_new_name.append_string (l_base_name)
						l_new_name.append_character ('_')
						l_new_name.append_string (j.out)
						create l_identifier.make (l_new_name)
						j := j + 1
					end
					create l_rename.make (l_name, l_identifier)
					l_parent_feature.set_new_name (l_rename)
					l_name := l_identifier
				end
				l_inherited_feature := new_inherited_feature (l_parent_feature)
				a_features.put_last (l_inherited_feature, l_name)
				i := i + 1
			end
		ensure
			no_void_feature: not a_features.has_item (Void)
		end

feature {NONE} -- Features

	dotnet_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_DOTNET_FEATURE]
			-- Features indexed by their flattened feature's .NET name and signature

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

feature {NONE} -- Access

	current_class: ET_CLASS
			-- Class being processed

feature {NONE} -- Implementation

	new_parent_feature (a_feature: ET_FEATURE; a_parent: ET_PARENT): ET_PARENT_FEATURE is
			-- New parent feature
		require
			a_feature_not_void: a_feature /= Void
			a_parent_not_void: a_parent /= Void
		do
			if free_parent_feature /= Void then
				Result := free_parent_feature
				Result.reset (a_feature, a_parent)
				free_parent_feature := free_parent_feature.next
			else
				create Result.make (a_feature, a_parent)
				Result.set_next (parent_feature_list)
				parent_feature_list := Result
			end
		ensure
			parent_feature_not_void: Result /= Void
		end

	new_inherited_feature (a_parent_feature: ET_PARENT_FEATURE): ET_INHERITED_FEATURE is
			-- New inherited feature
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		do
			if free_inherited_feature /= Void then
				Result := free_inherited_feature
				Result.reset (a_parent_feature)
				free_inherited_feature := free_inherited_feature.next
			else
				create Result.make (a_parent_feature)
				Result.set_next (inherited_feature_list)
				inherited_feature_list := Result
			end
		ensure
			inherited_feature_not_void: Result /= Void
		end

	new_redeclared_feature (a_feature: ET_FEATURE; a_parent_feature: ET_PARENT_FEATURE): ET_REDECLARED_FEATURE is
			-- New redeclared feature
		require
			a_feature_not_void: a_feature /= Void
			a_parent_feature_not_void: a_parent_feature /= Void
		do
			if free_redeclared_feature /= Void then
				Result := free_redeclared_feature
				Result.reset (a_feature, a_parent_feature)
				free_redeclared_feature := free_redeclared_feature.next
			else
				create Result.make (a_feature, a_parent_feature)
				Result.set_next (redeclared_feature_list)
				redeclared_feature_list := Result
			end
		ensure
			redeclared_feature_not_void: Result /= Void
		end

	parent_feature_list: ET_PARENT_FEATURE
			-- Parent feature free list

	free_parent_feature: ET_PARENT_FEATURE
			-- First available parent feature in free list

	inherited_feature_list: ET_INHERITED_FEATURE
			-- Inherited feature free list

	free_inherited_feature: ET_INHERITED_FEATURE
			-- First available inherited feature in free list

	redeclared_feature_list: ET_REDECLARED_FEATURE
			-- Redeclared feature free list

	free_redeclared_feature: ET_REDECLARED_FEATURE
			-- First available redeclared feature in free list

invariant

	universe_not_void: universe /= Void
	current_class_not_void: current_class /= Void
	dotnet_features_not_void: dotnet_features /= Void
	no_void_dotnet_feature: not dotnet_features.has_item (Void)
	-- no_inherited: for all f in dotnet_features, not f.is_inherited

end
