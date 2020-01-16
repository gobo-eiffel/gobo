note

	description:

	"[
		Eiffel attachment scopes, to determine whether a given entity
		can be considered as attached (when declared as detachable)
		or initialized (when declared as attached).
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ATTACHMENT_SCOPE

inherit

	ANY

	ET_SHARED_IDENTIFIER_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new attachment scope.
		do
			create locals_attached.make (50)
			create arguments_attached.make (10)
			create attributes_attached.make (50)
		end

feature -- Status report

	has_local_variable (a_name: ET_IDENTIFIER): BOOLEAN
			-- Is local variable `a_name' attached (when declared as detachable)
			-- or initialized (when declared as attached)?
		require
			a_name_not_void: a_name /= Void
			a_name_is_local: a_name.is_local
		do
			Result := locals_attached.has (a_name.seed)
		end

	has_formal_argument (a_name: ET_IDENTIFIER): BOOLEAN
			-- Is formal argument `a_name' attached (when declared as detachable)
			-- or initialized (when declared as attached)?
		require
			a_name_not_void: a_name /= Void
			a_name_is_argument: a_name.is_argument
		do
			Result := arguments_attached.has (a_name.seed)
		end

	has_attribute (a_name: ET_IDENTIFIER): BOOLEAN
			-- Is attribute `a_name' attached (when declared as detachable)
			-- or initialized (when declared as attached)?
		require
			a_name_not_void: a_name /= Void
		do
			Result := attributes_attached.has (a_name.seed)
		end

	has_result: BOOLEAN
			-- Is entity 'Result' attached (when declared as detachable)
			-- or initialized (when declared as attached)?
		do
			Result := result_attached
		end

	has_name (a_name: ET_IDENTIFIER): BOOLEAN
			-- Is entity named `a_name' attached (when declared as detachable)
			-- or initialized (when declared as attached)?
		require
			a_name_not_void: a_name /= Void
			valid_name: a_name.is_local or a_name.is_argument or a_name.is_feature_name
		do
			if a_name.is_local then
				Result := locals_attached.has (a_name.seed)
			elseif a_name.is_argument then
				Result := arguments_attached.has (a_name.seed)
			elseif a_name.is_feature_name then
				Result := attributes_attached.has (a_name.seed)
			end
		end

	is_subset (other: ET_ATTACHMENT_SCOPE): BOOLEAN
			-- Is `Current' a subset of `other'
		require
			other_not_void: other /= Void
		do
			Result := True
			if result_attached and then not other.result_attached then
				Result := False
			end
			if Result then
				from
					locals_attached.start
				until
					locals_attached.after
				loop
					if not other.locals_attached.has (locals_attached.item_for_iteration) then
						Result := False
							-- Jump out of the loop.
						locals_attached.go_after
					else
						locals_attached.forth
					end
				end
			end
			if Result then
				from
					arguments_attached.start
				until
					arguments_attached.after
				loop
					if not other.arguments_attached.has (arguments_attached.item_for_iteration) then
						Result := False
							-- Jump out of the loop.
						arguments_attached.go_after
					else
						arguments_attached.forth
					end
				end
			end
			if Result then
				from
					attributes_attached.start
				until
					attributes_attached.after
				loop
					if not other.attributes_attached.has (attributes_attached.item_for_iteration) then
						Result := False
							-- Jump out of the loop.
						attributes_attached.go_after
					else
						attributes_attached.forth
					end
				end
			end
		end

	is_code_unreachable: BOOLEAN
			-- Has an instruction which makes the code appearing after it unreachable been executed?
			--
			-- Currently only the following instructions are taken into account:
			--    check False then ... end
			--
			-- Starting with ISE 7.0.8.7345, void-safety errors in unreachable code are not reported.

feature -- Access

	locals_attached: DS_HASH_SET [INTEGER]
			-- Indexes of local variables which are attached (when declared as detachable)
			-- or initialized (when declared as attached)

	arguments_attached: DS_HASH_SET [INTEGER]
			-- Indexes of formal arguments which are attached (when declared as detachable)
			-- or initialized (when declared as attached)

	attributes_attached: DS_HASH_SET [INTEGER]
			-- Seeds of attributes which are attached (when declared as detachable)
			-- or initialized (when declared as attached)

	result_attached: BOOLEAN
			-- Is 'Result' attached (when declared as detachable)
			-- or initialized (when declared as attached)?

feature -- Element change

	add_local_variable (a_name: ET_IDENTIFIER)
			-- Indicate that local variable `a_name' is attached
			-- (when declared as detachable) or initialized
			-- (when declared as attached).
		require
			a_name_not_void: a_name /= Void
			a_name_is_local: a_name.is_local
		do
			locals_attached.force_last (a_name.seed)
		ensure
			local_variable_added: has_local_variable (a_name)
		end

	add_formal_argument (a_name: ET_IDENTIFIER)
			-- Indicate that formal argument `a_name' is attached
			-- (when declared as detachable) or initialized
			-- (when declared as attached).
		require
			a_name_not_void: a_name /= Void
			a_name_is_argument: a_name.is_argument
		do
			arguments_attached.force_last (a_name.seed)
		ensure
			formal_argument_added: has_formal_argument (a_name)
		end

	add_attribute (a_name: ET_IDENTIFIER)
			-- Indicate that attribute `a_name' is attached
			-- (when declared as detachable) or initialized
			-- (when declared as attached).
		require
			a_name_not_void: a_name /= Void
			a_name_is_feature_name: a_name.is_feature_name
		do
			attributes_attached.force_last (a_name.seed)
		ensure
			attribute_added: has_attribute (a_name)
		end

	add_result
			-- Indicate that entity 'Result' is attached
			-- (when declared as detachable) or initialized
			-- (when declared as attached).
		do
			result_attached := True
		ensure
			result_added: has_result
		end

	add_name (a_name: ET_IDENTIFIER)
			-- Indicate that entity named `a_name' is attached
			-- (when declared as detachable) or initialized
			-- (when declared as attached).
		require
			a_name_not_void: a_name /= Void
			valid_name: a_name.is_local or a_name.is_argument or a_name.is_feature_name
		do
			if a_name.is_local then
				add_local_variable (a_name)
			elseif a_name.is_argument then
				add_formal_argument (a_name)
			elseif a_name.is_feature_name then
				add_attribute (a_name)
			end
		ensure
			name_added: has_name (a_name)
		end

	remove_local_variable (a_name: ET_IDENTIFIER)
			-- Indicate that local variable `a_name' is not attached
			-- (when declared as detachable) or not initialized
			-- (when declared as attached).
		require
			a_name_not_void: a_name /= Void
			a_name_is_local: a_name.is_local
		do
			locals_attached.remove (a_name.seed)
		ensure
			local_variable_removed: not has_local_variable (a_name)
		end

	remove_formal_argument (a_name: ET_IDENTIFIER)
			-- Indicate that formal argument `a_name' is not attached
			-- (when declared as detachable) or not initialized
			-- (when declared as attached).
		require
			a_name_not_void: a_name /= Void
			a_name_is_argument: a_name.is_argument
		do
			arguments_attached.remove (a_name.seed)
		ensure
			formal_argument_removed: not has_formal_argument (a_name)
		end

	remove_attribute (a_name: ET_IDENTIFIER)
			-- Indicate that attribute `a_name' is not attached
			-- (when declared as detachable) or not initialized
			-- (when declared as attached).
		require
			a_name_not_void: a_name /= Void
			a_name_is_feature_name: a_name.is_feature_name
		do
			attributes_attached.remove (a_name.seed)
		ensure
			attribute_removed: not has_attribute (a_name)
		end

	remove_result
			-- Indicate that entity 'Result' is not attached
			-- (when declared as detachable) or not initialized
			-- (when declared as attached).
		do
			result_attached := False
		ensure
			result_removed: not has_result
		end

	remove_name (a_name: ET_IDENTIFIER)
			-- Indicate that entity named `a_name' is not attached
			-- (when declared as detachable) or not initialized
			-- (when declared as attached).
		require
			a_name_not_void: a_name /= Void
			valid_name: a_name.is_local or a_name.is_argument or a_name.is_feature_name
		do
			if a_name.is_local then
				remove_local_variable (a_name)
			elseif a_name.is_argument then
				remove_formal_argument (a_name)
			elseif a_name.is_feature_name then
				remove_attribute (a_name)
			end
		ensure
			name_removed: not has_name (a_name)
		end

	set_code_unreachable (b: BOOLEAN)
			-- Set `is_code_unreachable' to `b'.
		do
			is_code_unreachable := b
		ensure
			code_unreachable_set: is_code_unreachable = b
		end

	copy_scope (other: ET_ATTACHMENT_SCOPE)
			-- Make sure that `Current' has the same entities as `other'.
		require
			other_not_void: other /= Void
		do
			locals_attached.wipe_out
			locals_attached.append_last (other.locals_attached)
			arguments_attached.wipe_out
			arguments_attached.append_last (other.arguments_attached)
			attributes_attached.wipe_out
			attributes_attached.append_last (other.attributes_attached)
			result_attached := other.result_attached
			is_code_unreachable := other.is_code_unreachable
		end

	merge_scope (other: ET_ATTACHMENT_SCOPE)
			-- Keep in `Current' only the entities which are also in `other'.
		require
			other_not_void: other /= Void
		local
			l_seed: INTEGER
		do
			if other.is_code_unreachable then
				-- Do nothing.
			elseif is_code_unreachable then
				copy_scope (other)
			else
				if result_attached and not other.result_attached then
					result_attached := False
				end
				from
					locals_attached.start
				until
					locals_attached.after
				loop
					l_seed := locals_attached.item_for_iteration
					if not other.locals_attached.has (l_seed) then
						locals_attached.remove (l_seed)
					else
						locals_attached.forth
					end
				end
				from
					arguments_attached.start
				until
					arguments_attached.after
				loop
					l_seed := arguments_attached.item_for_iteration
					if not other.arguments_attached.has (l_seed) then
						arguments_attached.remove (l_seed)
					else
						arguments_attached.forth
					end
				end
				from
					attributes_attached.start
				until
					attributes_attached.after
				loop
					l_seed := attributes_attached.item_for_iteration
					if not other.attributes_attached.has (l_seed) then
						attributes_attached.remove (l_seed)
					else
						attributes_attached.forth
					end
				end
				if is_code_unreachable and not other.is_code_unreachable then
					is_code_unreachable := False
				end
			end
		end

	wipe_out
			-- Indicate that no entity is attached (when declared
			-- as detachable) or initialized (when declared as attached).
		do
			locals_attached.wipe_out
			arguments_attached.wipe_out
			attributes_attached.wipe_out
			result_attached := False
			is_code_unreachable := False
		end

invariant

	locals_attached_not_void: locals_attached /= Void
	arguments_attached_not_void: arguments_attached /= Void
	attributes_attached_not_void: attributes_attached /= Void

end
