note

	description:

	"[
		Eiffel attachment scopes, to determine whether a given entity
		can be considered as attached (when declared as detachable)
		or initialized (when declared as attached).
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011, Eric Bezault and others"
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
			create names.make (50)
			names.set_equality_tester (identifier_tester)
		end

feature -- Status report

	has_name (a_name: ET_IDENTIFIER): BOOLEAN
			-- Is entity named `a_name' attached (when declared as detachable)
			-- or initialized (when declared as attached)?
		require
			a_name_not_void: a_name /= Void
		do
			Result := names.has (a_name)
		end

	has_result: BOOLEAN
			-- Is entity 'Result' attached (when declared as detachable)
			-- or initialized (when declared as attached)?
		do
			Result := result_attached
		end

	is_subset (other: ET_ATTACHMENT_SCOPE): BOOLEAN
			-- Is `Current' a subset of `other'
		require
			other_not_void: other /= Void
		do
			if result_attached and then not other.result_attached then
				Result := False
			else
				Result := True
				from
					names.start
				until
					names.after
				loop
					if not other.has_name (names.item_for_iteration) then
						Result := False
							-- Jump out of the loop.
						names.go_after
					else
						names.forth
					end
				end
			end
		end

feature -- Access

	names: DS_HASH_SET [ET_IDENTIFIER]
			-- Names of local variables, formal arguments and attributes
			-- which are attached (when declared as detachable)
			-- or initialized (when declared as attached)

	result_attached: BOOLEAN
			-- Is 'Result' attached (when declared as detachable)
			-- or initialized (when declared as attached)?

feature -- Element change

	add_name (a_name: ET_IDENTIFIER)
			-- Indicate that entity named `a_name' is attached
			-- (when declared as detachable) or initialized
			-- (when declared as attached).
		require
			a_name_not_void: a_name /= Void
		do
			names.force_last (a_name)
		ensure
			name_added: has_name (a_name)
		end

	remove_name (a_name: ET_IDENTIFIER)
			-- Indicate that entity named `a_name' is not attached
			-- (when declared as detachable) or not initialized
			-- (when declared as attached).
		require
			a_name_not_void: a_name /= Void
		do
			names.remove (a_name)
		ensure
			name_removed: not has_name (a_name)
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

	remove_result
			-- Indicate that entity 'Result' is not attached
			-- (when declared as detachable) or not initialized
			-- (when declared as attached).
		do
			result_attached := False
		ensure
			result_removed: not has_result
		end

	copy_scope (other: ET_ATTACHMENT_SCOPE)
			-- Make sure that `Current' has the same entities as `other'.
		require
			other_not_void: other /= Void
		do
			names.wipe_out
			names.append_last (other.names)
			result_attached := other.result_attached
		end

	merge_scope (other: ET_ATTACHMENT_SCOPE)
			-- Keep in `Current' only the entities which are not in `other'.
		require
			other_not_void: other /= Void
		local
			l_name: ET_IDENTIFIER
		do
			if result_attached and not other.result_attached then
				result_attached := False
			end
			from
				names.start
			until
				names.after
			loop
				l_name := names.item_for_iteration
				if not other.has_name (l_name) then
					names.remove (l_name)
				else
					names.forth
				end
			end
		end

	wipe_out
			-- Indicate that no entity is attached (when declared
			-- as detachable) or initialized (when declared as attached).
		do
			names.wipe_out
			result_attached := False
		end

invariant

	names_not_void: names /= Void
	no_void_name: not names.has_void

end
