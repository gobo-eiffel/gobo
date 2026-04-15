note

	description:

	"[
		Checkers to see whether the initialization of attached attributes
		of a class needs to be checked again or not after some classes have
		been modified in the Eiffel system.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_ATTACHED_ATTRIBUTE_INITIALIZATION_STATUS_CHECKER

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
			-- Check whether the attached attribute initialization of `a_class' needs to
			-- be checked again after some classes have been modified in the Eiffel system.
			--
			-- It is assumed that if `a_class.has_attached_attribute_initialization_error' is
			-- True, then this class has not been checked yet. False means that it has already
			-- been checked.
		local
			a_processor: like Current
		do
			if a_class.is_none then
				a_class.unset_attached_attribute_initialization_error
			elseif a_class.is_formal then
				a_class.unset_attached_attribute_initialization_error
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
		ensure then
			attached_attribute_initialization_checked: not a_class.attached_attribute_initialization_checked or else not a_class.has_attached_attribute_initialization_error
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS)
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.reset_after_implementation_checked
		ensure
			attached_attribute_initialization_not_checked: not a_class.attached_attribute_initialization_checked
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS)
			-- Check whether the attached attribute initialization of `a_class' needs to
			-- be checked again after some classes have been modified in the Eiffel system.
			--
			-- It is assumed that if `a_class.has_attached_attribute_initialization_error' is True,
			-- then this class has not been checked yet. False means that it has already
			-- been checked.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
		do
			old_class := current_class
			current_class := a_class
			if current_class.attached_attribute_initialization_checked and then current_class.has_attached_attribute_initialization_error then
					-- The class has been marked with an attached_attribute_initialization error to
					-- indicate that we need to check whether its attached attribute initialization
					-- needs to be checked again or not. It might happen if other classes on which it
					-- depends have been modified or recursively made invalid. If its attached
					-- attribute initialization is still valid then the error flag will be cleared.
					-- Otherwise the class will be reset to the previous processing step.
				current_class.unset_attached_attribute_initialization_error
				check_suppliers_validity
				check_providers_validity
			end
			current_class := old_class
		ensure
			attached_attribute_initialization_checked: not a_class.attached_attribute_initialization_checked or else not a_class.has_attached_attribute_initialization_error
		end

feature {NONE} -- Suppliers and providers validity

	check_suppliers_validity
			-- Check whether none of the supplier classes
			-- of `current_class' has been modified.
		local
			l_suppliers: detachable DS_HASH_SET [ET_NAMED_CLASS]
			l_cursor: DS_HASH_SET_CURSOR [ET_NAMED_CLASS]
			l_class: ET_NAMED_CLASS
		do
			if current_class.attached_attribute_initialization_checked then
				l_suppliers := current_class.suppliers
				if l_suppliers = Void then
						-- Force attached attribute initialization to be checked again.
						-- It would be too long to recompute the suppliers.
					set_fatal_error (current_class)
				else
					l_cursor := l_suppliers.new_cursor
					from l_cursor.start until l_cursor.after loop
						l_class := l_cursor.item
						if not l_class.implementation_checked or else l_class.has_implementation_error then
								-- This check is probably too strong in many cases.
								-- But that would be too long to check. We don't
								-- need such level of fine-grained checking here.
							set_fatal_error (current_class)
							l_cursor.go_after -- Jump out of the loop.
						else
							l_cursor.forth
						end
					end
				end
			end
		end

	check_providers_validity
			-- Check whether none of the provider classes
			-- of `current_class' has been modified.
		local
			l_providers: detachable DS_HASH_SET [ET_NAMED_CLASS]
			l_cursor: DS_HASH_SET_CURSOR [ET_NAMED_CLASS]
			l_class: ET_NAMED_CLASS
		do
			if current_class.attached_attribute_initialization_checked then
				l_providers := current_class.providers
				if l_providers = Void then
						-- Force attached attribute initialization to be checked again.
						-- It would be too long to recompute the providers.
					set_fatal_error (current_class)
				else
					l_cursor := l_providers.new_cursor
					from l_cursor.start until l_cursor.after loop
						l_class := l_cursor.item
						if not l_class.implementation_checked or else l_class.has_implementation_error then
								-- This check is probably too strong in many cases.
								-- But that would be too long to check. We don't
								-- need such level of fine-grained checking here.
							set_fatal_error (current_class)
							l_cursor.go_after -- Jump out of the loop.
						else
							l_cursor.forth
						end
					end
				end
			end
		end

end
