note

	description:

		"ECF target parents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_TARGET_PARENT

create

	make

feature {NONE} -- Initialization

	make (a_name_id: like name_id; a_location_id: like location_id)
			-- Create a new ECF target parent.
		require
			a_name_id_or_a_location_id_not_void: a_name_id /= Void or a_location_id /= Void
		do
			name_id := a_name_id
			location_id := a_location_id
		ensure
			name_id_set: name_id = a_name_id
			location_id_set: location_id = a_location_id
		end

feature -- Access

	name: detachable STRING
			-- Name
		do
			if attached name_id as l_name_id then
				Result := l_name_id.name
			end
		ensure
			definition: attached name_id as l_name_id implies Result = l_name_id.name
		end

	name_id: detachable ET_IDENTIFIER
			-- Name identifier

	location: detachable STRING
			-- ECF filename
		do
			if attached location_id as l_location_id then
				Result := l_location_id.name
			end
		ensure
			definition: attached location_id as l_location_id implies Result = l_location_id.name
		end

	location_id: detachable ET_IDENTIFIER
			-- ECF filename identifier

	target: detachable ET_ECF_TARGET
			-- Actual target

feature -- Setting

	set_name_id (a_name_id: like name_id)
			-- Set `name_id' to `a_name_id'.
		require
			a_name_id_or_location_id_not_void: a_name_id /= Void or location_id /= Void
		do
			name_id := a_name_id
		ensure
			name_id_set: name_id = a_name_id
		end

	set_location_id (a_location_id: like location_id)
			-- Set `location_id' to `a_location_id'.
		require
			name_id_or_a_location_id_not_void: name_id /= Void or a_location_id /= Void
		do
			location_id := a_location_id
		ensure
			location_id_set: location_id = a_location_id
		end

	set_target (a_target: like target)
			-- Set `target'	to `a_target'.
		do
			target := a_target
		ensure
			target_set: target = a_target
		end

invariant

	name_id_or_location_id_not_void: name_id /= Void or location_id /= Void

end
