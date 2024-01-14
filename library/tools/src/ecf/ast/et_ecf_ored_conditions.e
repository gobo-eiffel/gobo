note

	description:

		"ECF condition lists where conditions will be or-ed when calling `is_enabled'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_ORED_CONDITIONS

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

	is_ored: BOOLEAN = True
			-- Should the conditions be or-ed when calling `is_enabled'?

	is_capability_supported (a_capability_name: STRING; a_target_capabilities, a_other_capabilities: ET_ECF_CAPABILITIES): BOOLEAN
			-- Is capability `a_capability_name' of the enclosing target with
			-- capabilities `a_target_capabilities', possibly restricted by the
			-- current condition, supported by the capabilities `a_other_capabilities'?
		local
			i, nb: INTEGER
			l_condition: like condition
		do
			nb := conditions.count
			if nb = 0 then
				Result := precursor (a_capability_name, a_target_capabilities, a_other_capabilities)
			else
				Result := True
				from i := 1 until i > nb loop
					l_condition := conditions.item (i)
					if not l_condition.is_capability_supported (a_capability_name, a_target_capabilities, a_other_capabilities) then
						Result := False
							-- Jump out of the loop.
						i := nb + 1
					end
					i := i + 1
				end
			end
		end

feature -- Access

	condition (i: INTEGER): ET_ECF_ANDED_CONDITIONS
			-- `i'-th condition
		do
			Result := conditions.item (i)
		end

invariant

	is_ored: is_ored

end
