indexing

	description:

		"Eiffel client/supplier relationship builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SUPPLIER_BUILDER

inherit

	ET_SUPPLIER_HANDLER

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new client/supplier relationship builder.
		require
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			current_class := a_universe.unknown_class
			supplier_classes := dummy_suppliers
			create type_checker.make (a_universe)
		ensure
			universe_set: universe = a_universe
		end

feature -- Initialization

	set (a_class: like current_class; a_suppliers: like supplier_classes) is
			-- Start a new build where supplier classes of `a_class'
			-- will be stored in `a_suppliers'.
		require
			a_class_not_void: a_class /= Void
			a_suppliers_not_void: a_suppliers /= Void
			no_void_supplier: not a_suppliers.has (Void)
		do
			current_class := a_class
			supplier_classes := a_suppliers
		ensure
			current_class_set: current_class = a_class
			supplier_classes_set: supplier_classes = a_suppliers
		end

feature -- Access

	current_class: ET_CLASS
			-- Client class

	supplier_classes: DS_HASH_SET [ET_CLASS]
			-- Supplier classes

	universe: ET_UNIVERSE
			-- Eiffel universe

feature -- Reporting

	report_expression_supplier (a_supplier: ET_TYPE_CONTEXT; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of an expression
			-- in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' may be altered after the execution of
			-- this routine. Therefore if you want to keep a reference to it
			-- you should duplicate it or use its base type for example.)
		do
			if a_client.direct_base_class (universe) = current_class then
				supplier_classes.force_last (a_supplier.base_class (universe))
			end
		end

	report_argument_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_routine: ET_ROUTINE) is
			-- Report the fact that `a_supplier' is the type of a formal argument
			-- of `a_routine' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.direct_base_class (universe) = current_class then
				supplier_classes.force_last (a_supplier.base_class (a_client, universe))
			end
		end

	report_result_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_query: ET_QUERY) is
			-- Report the fact that `a_supplier' is the type of the result
			-- of `a_query' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.direct_base_class (universe) = current_class then
				supplier_classes.force_last (a_supplier.base_class (a_client, universe))
			end
		end

	report_static_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of a static call
			-- in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.direct_base_class (universe) = current_class then
				supplier_classes.force_last (a_supplier.base_class (a_client, universe))
			end
		end

	report_create_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the explicit type of a
			-- creation instruction or expression in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.direct_base_class (universe) = current_class then
				supplier_classes.force_last (a_supplier.base_class (a_client, universe))
			end
		end

	report_local_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report the fact that `a_supplier' is the type of a local variable
			-- of `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_feature.implementation_class'. Its
			-- formal generic parameters should be resolved in the
			-- base class of `a_client' first before using `a_client'
			-- as its context.)
		local
			a_type: ET_TYPE
		do
			if a_client.direct_base_class (universe) = current_class then
				a_type := type_checker.resolved_formal_parameters (a_supplier, a_feature.implementation_class, current_class)
				if not type_checker.has_fatal_error then
					supplier_classes.force_last (a_type.base_class (a_client, universe))
				end
			end
		end

	report_inline_agent_argument_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of a formal argument
			-- of an inline agent in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_feature.implementation_class'. Its
			-- formal generic parameters should be resolved in the
			-- base class of `a_client' first before using `a_client'
			-- as its context.)
		local
			a_type: ET_TYPE
		do
			if a_client.direct_base_class (universe) = current_class then
				a_type := type_checker.resolved_formal_parameters (a_supplier, a_feature.implementation_class, current_class)
				if not type_checker.has_fatal_error then
					supplier_classes.force_last (a_type.base_class (a_client, universe))
				end
			end
		end

	report_inline_agent_local_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of a local variable
			-- of an inline agent in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_feature.implementation_class'. Its
			-- formal generic parameters should be resolved in the
			-- base class of `a_client' first before using `a_client'
			-- as its context.)
		local
			a_type: ET_TYPE
		do
			if a_client.direct_base_class (universe) = current_class then
				a_type := type_checker.resolved_formal_parameters (a_supplier, a_feature.implementation_class, current_class)
				if not type_checker.has_fatal_error then
					supplier_classes.force_last (a_type.base_class (a_client, universe))
				end
			end
		end

	report_inline_agent_result_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of the result of
			-- an inline agent in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_feature.implementation_class'. Its
			-- formal generic parameters should be resolved in the
			-- base class of `a_client' first before using `a_client'
			-- as its context.)
		local
			a_type: ET_TYPE
		do
			if a_client.direct_base_class (universe) = current_class then
				a_type := type_checker.resolved_formal_parameters (a_supplier, a_feature.implementation_class, current_class)
				if not type_checker.has_fatal_error then
					supplier_classes.force_last (a_type.base_class (a_client, universe))
				end
			end
		end

feature {NONE} -- Implementation

	type_checker: ET_TYPE_CHECKER
			-- Type checker

	dummy_suppliers: DS_HASH_SET [ET_CLASS] is
			-- Dummy suppliers
		once
			create Result.make (0)
		ensure
			dummy_suppliers_not_void: Result /= Void
			dummy_suppliers_empty: Result.is_empty
		end

invariant

	universe_not_void: universe /= Void
	current_class_not_void: current_class /= Void
	supplier_classes_not_void: supplier_classes /= Void
	no_void_supplier_class: not supplier_classes.has (Void)
	type_checker_not_void: type_checker /= Void

end
