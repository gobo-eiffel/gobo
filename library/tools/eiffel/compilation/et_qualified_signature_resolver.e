indexing

	description:

		"Resolvers of Eiffel feature signatures with qualified anchored types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_SIGNATURE_RESOLVER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make
		end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new qualified signature resolver for classes in `a_universe'.
		do
			precursor (a_universe)
			create qualified_type_resolver.make (Current)
		end

feature -- Access

	degree: STRING is "4.3"
			-- ISE's style degree of current processor

feature -- Processing

	process_class (a_class: ET_CLASS) is
			-- Flatten features of `a_class' is not already done.
			-- Then resolve the qualified anchored types in the
			-- signatures of the features of `a_class'.
		local
			a_processor: like Current
		do
			if a_class = none_class then
				a_class.set_qualified_signatures_resolved
			elseif current_class /= unknown_class then
					-- TODO: Internal error (recursive call)
print ("INTERNAL ERROR%N")
				create a_processor.make (universe)
				a_processor.process_class (a_class)
			elseif a_class /= unknown_class then
				internal_process_class (a_class)
			else
				set_fatal_error (a_class)
			end
		ensure then
			qualified_signatures_resolved: a_class.qualified_signatures_resolved
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		do
			a_class.set_qualified_signatures_resolved
			a_class.set_qualified_signatures_error
		ensure then
			qualified_signatures_resolved: a_class.qualified_signatures_resolved
			has_qualified_signatures_error: a_class.has_qualified_signatures_error
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS) is
			-- Flatten features of `a_class' is not already done.
			-- Then resolve the qualified anchored types in the
			-- signatures of the features of `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			old_class: ET_CLASS
			a_parents: ET_PARENT_LIST
			a_parent_class: ET_CLASS
			i, nb: INTEGER
		do
			old_class := current_class
			current_class := a_class
			if not current_class.qualified_signatures_resolved then
					-- Flatten features of `current_class' if not already done.
				current_class.process (universe.feature_flattener)
				if not current_class.has_flattening_error then
					current_class.set_qualified_signatures_resolved
						-- Process parents first.
					a_parents := current_class.parents
					if a_parents = Void or else a_parents.is_empty then
						if current_class = universe.general_class then
							a_parents := Void
						elseif current_class = universe.any_class then
								-- ISE Eiffel has no GENERAL class anymore.
								-- Use ANY has class root now.
							a_parents := Void
						else
							a_parents := universe.any_parents
						end
					end
					if a_parents /= Void then
						nb := a_parents.count
						from i := 1 until i > nb loop
								-- This is a controlled recursive call to `internal_process_class'.
							a_parent_class := a_parents.parent (i).type.direct_base_class (universe)
							internal_process_class (a_parent_class)
							if a_parent_class.has_qualified_signatures_error then
								set_fatal_error (current_class)
							end
							i := i + 1
						end
					end
					if not current_class.has_qualified_signatures_error then
						error_handler.report_compilation_status (Current)
						resolve_qualified_type_signatures
					end
				else
					set_fatal_error (current_class)
				end
			end
			current_class := old_class
		ensure
			qualified_signatures_resolved: a_class.qualified_signatures_resolved
		end

feature {NONE} -- Signature resolving

	resolve_qualified_type_signatures is
			-- Resolve qualified anchored types of the form
			-- 'like a.b' or 'like {A}.b' in signatures of
			-- all features written in `current_class'.
		local
			a_features: ET_FEATURE_LIST
			a_feature: ET_FEATURE
			i, nb: INTEGER
		do
			a_features := current_class.features
			nb := a_features.count
			from i := 1 until i > nb loop
				a_feature := a_features.item (i)
				if a_feature.implementation_class = current_class then
					resolve_qualified_type_signature (a_feature)
					i := i + 1
				else
					 	-- The following features have been written
					 	-- in parent classes, and their signatures have
					 	-- already been taken care of in these classes.
					 i := nb + 1 -- Jump out of the loop.
				end
			end
		end

	resolve_qualified_type_signature (a_feature: ET_FEATURE) is
			-- Resolve qualified anchored types of the form
			-- 'like a.b' or 'like {A}.b' in signature of
			-- `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_arg: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
		do
			a_type := a_feature.type
			if a_type /= Void then
				qualified_type_resolver.resolve_type (a_type)
			end
			args := a_feature.arguments
			if args /= Void then
				nb := args.count
				from i := 1 until i > nb loop
					an_arg := args.formal_argument (i)
					qualified_type_resolver.resolve_type (an_arg.type)
					i := i + 1
				end
			end
		end

	qualified_type_resolver: ET_QUALIFIED_TYPE_RESOLVER
			-- Qualified anchored type resolver

invariant

	qualified_type_resolver_not_void: qualified_type_resolver /= Void

end
