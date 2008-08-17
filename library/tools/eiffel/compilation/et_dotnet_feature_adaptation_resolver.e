indexing

	description:

		"Feature adaptation resolvers for .NET classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_FEATURE_ADAPTATION_RESOLVER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		undefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new feature adaptation resolver for .NET classes.
		local
			l_dotnet_signature_tester: ET_DOTNET_SIGNATURE_TESTER
		do
			precursor {ET_CLASS_SUBPROCESSOR}
			create dotnet_features.make (400)
			create l_dotnet_signature_tester.make
			dotnet_features.set_equality_tester (l_dotnet_signature_tester)
			create other_dotnet_features.make_map (400)
			other_dotnet_features.set_key_equality_tester (l_dotnet_signature_tester)
		end

feature -- Feature adaptation resolving

	resolve_feature_adaptations (a_class: ET_CLASS; a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]) is
			-- Resolve the feature inheritance of `a_class'
			-- and put resulting features in `a_features'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_class_is_dotnet: a_class.is_dotnet
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
		local
			old_class: ET_CLASS
			a_parents: ET_PARENT_LIST
			i, nb: INTEGER
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
				-- Under .NET the features that we get from the assembly
				-- consumer are not only those declared in `current_class'
				-- but also those inherited from other .NET classes.
			add_current_features (a_features)
				-- Traverse parents' .NET features in order to build back
				-- the inheritance links with the features in `current_class'.
				-- Using `dotnet_features' helps here because it takes into
				-- account possibly overloaded feature names when building
				-- the inheritance links.
			a_parents := current_class.parents
			if a_parents = Void or else a_parents.is_empty then
				if current_class = current_system.system_object_class then
						-- Features from "ANY" will be added at the end.
					a_parents := Void
				else
					a_parents := current_system.system_object_parents
				end
			end
			if a_parents /= Void then
				nb := a_parents.count
				from i := 1 until i > nb loop
					add_inherited_features (a_parents.parent (i), a_features)
					i := i + 1
				end
			end
				-- Add to `a_features' features inherited from ANY.
			add_any_features (a_features)
				-- Clean up.
			dotnet_features.wipe_out
			other_dotnet_features.wipe_out
			free_parent_feature := parent_feature_list
			free_inherited_feature := inherited_feature_list
			free_redeclared_feature := redeclared_feature_list
			current_class := old_class
		ensure
			no_void_feature: not a_features.has_item (Void)
		end

feature {NONE} -- Feature recording

	add_current_features (a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]) is
			-- Add to `a_features' the .NET features of `current_class'
			-- declared in its assembly.
		require
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
		local
			l_query: ET_QUERY
			l_queries: ET_QUERY_LIST
			l_procedure: ET_PROCEDURE
			l_procedures: ET_PROCEDURE_LIST
			l_dotnet_feature: ET_DOTNET_FEATURE
			i, nb, nb2, nb3: INTEGER
		do
			l_queries := current_class.queries
			l_procedures := current_class.procedures
			nb := l_queries.declared_count
			nb2 := l_procedures.declared_count
			nb3 := nb + nb2 + a_features.count
			if dotnet_features.capacity < nb3 then
				dotnet_features.resize (nb3)
			end
			if a_features.capacity < nb3 then
				a_features.resize (nb3)
			end
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				l_dotnet_feature ?= l_query
				if l_dotnet_feature /= Void then
					add_current_feature (l_dotnet_feature, a_features)
				else
						-- Internal error: should be a .NET feature.
					set_fatal_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
			from i := 1 until i > nb2 loop
				l_procedure := l_procedures.item (i)
				l_dotnet_feature ?= l_procedure
				if l_dotnet_feature /= Void then
					add_current_feature (l_dotnet_feature, a_features)
				else
						-- Internal error: should be a .NET feature.
					set_fatal_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		ensure
			no_void_feature: not a_features.has_item (Void)
		end

	add_current_feature (a_feature: ET_DOTNET_FEATURE; a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]) is
			-- Add to `a_features' the .NET feature `a_feature' of `current_class'
			-- declared in its assembly.
		require
			a_feature_not_void: a_feature /= Void
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
		local
			l_name: ET_FEATURE_NAME
			other_feature: ET_FLATTENED_FEATURE
			l_feature_list: DS_LINKED_LIST [ET_DOTNET_FEATURE]
		do
			l_name := a_feature.name
			a_features.search (l_name)
			if a_features.found then
					-- Error: two features with the same name. This is
					-- due to a bad design decision in the metadata consumer
					-- which for each 'x' field introduces a setter 'set_x_field'
					-- without checking whether this name is not already used.
				set_fatal_error
				other_feature := a_features.found_item
				error_handler.report_vmfn0a_error (current_class, other_feature.flattened_feature, a_feature)
			else
				a_features.force_last_new (a_feature, l_name)
				dotnet_features.search (a_feature)
				if dotnet_features.found then
						-- Two features with the same .NET name and signature.
					other_dotnet_features.search (a_feature)
					if other_dotnet_features.found then
						other_dotnet_features.found_item.force_last (a_feature)
					else
						create l_feature_list.make
						l_feature_list.force_last (a_feature)
						other_dotnet_features.force_last_new (l_feature_list, a_feature)
					end
				else
					dotnet_features.force_last (a_feature)
				end
			end
		ensure
			no_void_feature: not a_features.has_item (Void)
		end

	add_inherited_features (a_parent: ET_PARENT; a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]) is
			-- Add to `a_features' the .NET features inherited from `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
		local
			l_class: ET_CLASS
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			l_dotnet_feature: ET_DOTNET_FEATURE
			l_feature_list: DS_LINKED_LIST [ET_DOTNET_FEATURE]
			i, nb: INTEGER
		do
			l_class := a_parent.type.base_class
			l_queries := l_class.queries
			l_procedures := l_class.procedures
			nb := l_queries.declared_count
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				l_dotnet_feature ?= l_query
				if l_dotnet_feature /= Void then
						-- Look for .NET feature with the same .NET name and the same signature.
					dotnet_features.search (l_dotnet_feature)
					if dotnet_features.found then
						add_inherited_feature (a_parent, l_dotnet_feature, dotnet_features.found_item, a_features)
						other_dotnet_features.search (l_dotnet_feature)
						if other_dotnet_features.found then
							l_feature_list := other_dotnet_features.found_item
							from l_feature_list.start until l_feature_list.after loop
								add_inherited_feature (a_parent, l_dotnet_feature, l_feature_list.item_for_iteration, a_features)
								l_feature_list.forth
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
				l_dotnet_feature ?= l_procedure
				if l_dotnet_feature /= Void then
						-- Look for .NET feature with the same .NET name and the same signature.
					dotnet_features.search (l_dotnet_feature)
					if dotnet_features.found then
						add_inherited_feature (a_parent, l_dotnet_feature, dotnet_features.found_item, a_features)
						other_dotnet_features.search (l_dotnet_feature)
						if other_dotnet_features.found then
							l_feature_list := other_dotnet_features.found_item
							from l_feature_list.start until l_feature_list.after loop
								add_inherited_feature (a_parent, l_dotnet_feature, l_feature_list.item_for_iteration, a_features)
								l_feature_list.forth
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
		ensure
			no_void_feature: not a_features.has_item (Void)
		end

	add_inherited_feature (a_parent: ET_PARENT; a_parent_feature, a_heir_feature: ET_DOTNET_FEATURE; a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]) is
			-- Add to `a_features' .NET feature `a_parent_feature' inherited from `a_parent'
			-- if we can figure out that its version in `current_class' is `a_heir_feature'.
		require
			a_parent_not_void: a_parent /= Void
			a_parent_feature_not_void: a_parent_feature /= Void
			a_heir_feature_not_void: a_heir_feature /= Void
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
		local
			l_parent_class_impl: ET_CLASS
			l_heir_class_impl: ET_CLASS
			l_flattened_feature: ET_FLATTENED_FEATURE
			l_redeclared_feature: ET_REDECLARED_FEATURE
			l_parent_feature: ET_PARENT_FEATURE
			found: BOOLEAN
		do
			l_heir_class_impl := a_heir_feature.implementation_class
			l_parent_class_impl := a_parent_feature.implementation_class
			if not a_heir_feature.is_virtual then
				if l_parent_class_impl = l_heir_class_impl then
					a_heir_feature.set_implementation_feature (a_parent_feature.implementation_feature)
					a_heir_feature.set_version (a_parent_feature.version)
					found := True
				else
-- TODO: this feature does not seem to exist anymore in `current_class',
-- it's the joy of .NET.
				end
			elseif current_class.is_interface and a_heir_feature.is_deferred and l_heir_class_impl /= l_parent_class_impl then
-- TODO: an interface and a parent interface defined a feature with the same .NET name
-- and signature, they are considered as two different unrelated features.
			elseif a_parent_feature.is_frozen and l_heir_class_impl /= l_parent_class_impl then
-- TODO: if the feature is frozen in the parent then they should be declared in the same class.
-- If not then they are two different routines.
			elseif not l_heir_class_impl.conforms_to_type (l_parent_class_impl, current_class, current_class) then
-- TODO: there is no guarantee that these two features are related.
			else
				found := True
				if l_parent_class_impl = l_heir_class_impl then
					a_heir_feature.set_implementation_feature (a_parent_feature.implementation_feature)
					a_heir_feature.set_version (a_parent_feature.version)
				end
			end
			if found then
				a_features.search (a_heir_feature.name)
				if a_features.found then
					l_flattened_feature := a_features.found_item
					l_parent_feature := new_parent_feature (a_parent_feature, a_parent)
					if l_flattened_feature.is_immediate then
						l_redeclared_feature := new_redeclared_feature (a_heir_feature, l_parent_feature)
						a_features.replace_found_item (l_redeclared_feature)
					else
						l_flattened_feature.adapted_feature.put_parent_feature (l_parent_feature)
					end
				else
						-- Internal error: features in `dotnet_features' should be in `a_features'.
					set_fatal_error
					error_handler.report_giaaa_error
				end
			end
		ensure
			no_void_feature: not a_features.has_item (Void)
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
			i, j, nb, nb2, nb3: INTEGER
			l_inherited_feature: ET_INHERITED_FEATURE
			l_parent_feature: ET_PARENT_FEATURE
			l_rename: ET_RENAME
			l_identifier: ET_IDENTIFIER
		do
			l_any := current_system.any_class
			l_any_parent := current_system.any_parent
			l_queries := l_any.queries
			l_procedures := l_any.procedures
			nb := l_queries.count
			nb2 := l_procedures.count
			nb3 := nb + nb2 + a_features.count
			if a_features.capacity < nb3 then
				a_features.resize (nb3)
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
				a_features.put_last_new (l_inherited_feature, l_name)
				i := i + 1
			end
			from i := 1 until i > nb2 loop
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
				a_features.put_last_new (l_inherited_feature, l_name)
				i := i + 1
			end
		ensure
			no_void_feature: not a_features.has_item (Void)
		end

feature {NONE} -- Features

	dotnet_features: DS_HASH_SET [ET_DOTNET_FEATURE]
			-- Features indexed by .NET name and signature

	other_dotnet_features: DS_HASH_TABLE [DS_LINKED_LIST [ET_DOTNET_FEATURE], ET_DOTNET_FEATURE]
			-- Other features indexed by their .NET name and signature
			-- when there are more than one such feature declared
			-- (which can happen because of weirdness either in .NET
			-- or in the metadata consumer)

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

	dotnet_features_not_void: dotnet_features /= Void
	no_void_dotnet_feature: not dotnet_features.has (Void)
	-- no_inherited: for all f in dotnet_features, not f.is_inherited
	other_dotnet_features_not_void: other_dotnet_features /= Void
	no_void_other_dotnet_features: not other_dotnet_features.has_item (Void)
	-- no_other_inherited: for all l in other_dotnet_features, l /= Void and then not l.has (Void) and then for all f in l, not f.is_inherited

end
