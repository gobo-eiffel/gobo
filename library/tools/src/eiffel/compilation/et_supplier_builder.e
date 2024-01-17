note

	description:

		"Eiffel client/supplier relationship builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2010, Eric Bezault and others"
	license: "MIT License"

class ET_SUPPLIER_BUILDER

inherit

	ET_SUPPLIER_HANDLER

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new client/supplier relationship builder.
		do
			current_class := tokens.unknown_class
			supplier_classes := dummy_suppliers
		end

feature -- Initialization

	set (a_class: like current_class; a_suppliers: like supplier_classes)
			-- Start a new build where supplier classes of `a_class'
			-- will be stored in `a_suppliers'.
		require
			a_class_not_void: a_class /= Void
			a_suppliers_not_void: a_suppliers /= Void
			no_void_supplier: not a_suppliers.has_void
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

	supplier_classes: DS_HASH_SET [ET_NAMED_CLASS]
			-- Supplier classes

feature -- Reporting

	report_expression_supplier (a_supplier: ET_TYPE_CONTEXT; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
			-- Report the fact that `a_supplier' is the type of an expression
			-- in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' may be altered after the execution of
			-- this routine. Therefore if you want to keep a reference to it
			-- you should duplicate it or use its base type for example.)
		do
			if a_client.base_class = current_class then
				add_supplier (a_supplier.named_base_class)
			end
		end

	report_argument_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_routine: ET_ROUTINE)
			-- Report the fact that `a_supplier' is the type of a formal argument
			-- of `a_routine' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.base_class = current_class then
				add_supplier (a_supplier.named_base_class (a_client))
			end
		end

	report_result_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_query: ET_QUERY)
			-- Report the fact that `a_supplier' is the type of the result
			-- of `a_query' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.base_class = current_class then
				add_supplier (a_supplier.named_base_class (a_client))
			end
		end

	report_static_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
			-- Report the fact that `a_supplier' is the type of a static call
			-- in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.base_class = current_class then
				add_supplier (a_supplier.named_base_class (a_client))
			end
		end

	report_create_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
			-- Report the fact that `a_supplier' is the explicit type of a
			-- creation instruction or expression in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.base_class = current_class then
				add_supplier (a_supplier.named_base_class (a_client))
			end
		end

	report_local_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_FEATURE)
			-- Report the fact that `a_supplier' is the type of a local variable
			-- of `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.base_class = current_class then
				add_supplier (a_supplier.named_base_class (a_client))
			end
		end

	report_inline_agent_argument_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
			-- Report the fact that `a_supplier' is the type of a formal argument
			-- of an inline agent in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.base_class = current_class then
				add_supplier (a_supplier.named_base_class (a_client))
			end
		end

	report_inline_agent_local_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
			-- Report the fact that `a_supplier' is the type of a local variable
			-- of an inline agent in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.base_class = current_class then
				add_supplier (a_supplier.named_base_class (a_client))
			end
		end

	report_inline_agent_result_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
			-- Report the fact that `a_supplier' is the type of the result of
			-- an inline agent in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.base_class = current_class then
				add_supplier (a_supplier.named_base_class (a_client))
			end
		end

	report_qualified_anchored_type_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE)
			-- Report the fact that `a_supplier' is the target type of a
			-- qualified anchored type in a feature or invariant in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		do
			if a_client.base_class = current_class then
				add_supplier (a_supplier.named_base_class (a_client))
			end
		end

feature {NONE} -- Element change

	add_supplier (a_class: ET_NAMED_CLASS)
			-- Add `a_class' to `supplier_classes' if it is not the class "NONE".
		require
			a_class_not_void: a_class /= Void
		do
			if not a_class.actual_class.is_none then
				supplier_classes.force_last (a_class)
			end
		end

feature {NONE} -- Implementation

	dummy_suppliers: DS_HASH_SET [ET_NAMED_CLASS]
			-- Dummy suppliers
		once
			create Result.make (0)
		ensure
			dummy_suppliers_not_void: Result /= Void
			dummy_suppliers_empty: Result.is_empty
		end

invariant

	current_class_not_void: current_class /= Void
	supplier_classes_not_void: supplier_classes /= Void
	no_void_supplier_class: not supplier_classes.has_void

end
