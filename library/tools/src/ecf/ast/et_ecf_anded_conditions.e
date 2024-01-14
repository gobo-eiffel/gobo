note

	description:

		"ECF condition lists where conditions will be and-ed when calling `is_enabled'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_ANDED_CONDITIONS

inherit

	ET_ECF_CONDITIONS
		redefine
			condition,
			is_capability_supported
		end

create

	make,
	make_empty

feature -- Status report

	is_ored: BOOLEAN = False
			-- Should the conditions be or-ed when calling `is_enabled'?

	is_capability_supported (a_capability_name: STRING; a_target_capabilities, a_other_capabilities: ET_ECF_CAPABILITIES): BOOLEAN
			-- Is capability `a_capability_name' of the enclosing target with
			-- capabilities `a_target_capabilities', possibly restricted by the
			-- current condition, supported by the capabilities `a_other_capabilities'?
		local
			i, nb: INTEGER
			l_condition: like condition
			l_is_aware: BOOLEAN
		do
			Result := True
			nb := conditions.count
			from i := 1 until i > nb loop
				l_condition := conditions.item (i)
				if l_condition.is_capability_aware (a_capability_name) then
					l_is_aware := True
					if not l_condition.is_capability_supported (a_capability_name, a_target_capabilities, a_other_capabilities) then
						Result := False
							-- Jump out of the loop.
						i := nb + 1
					end
				end
				i := i + 1
			end
			if not l_is_aware then
				Result := precursor (a_capability_name, a_target_capabilities, a_other_capabilities)
			end
		end

feature -- Access

	condition (i: INTEGER): ET_ECF_CONDITION_ITEM
			-- `i'-th condition
		do
			Result := conditions.item (i)
		end

invariant

	is_anded: not is_ored

end
