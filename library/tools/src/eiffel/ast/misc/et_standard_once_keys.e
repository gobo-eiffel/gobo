note

	description:

		"Eiffel standard once keys"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date:  $"
	revision: "$Revision: $"

class ET_STANDARD_ONCE_KEYS

inherit

		ANY

		KL_IMPORTED_STRING_ROUTINES
			export {NONE} all end

feature -- Status report

	has_object_key (a_keys: ET_MANIFEST_STRING_LIST): BOOLEAN
			-- Does `a_keys' contain the "OBJECT" once key?
		require
			a_keys_not_void: a_keys /= Void
		do
			Result := has_expected_key (a_keys, object_once_key)
		end

	is_object_key (a_key: ET_MANIFEST_STRING): BOOLEAN
			-- Is `a_key' the "OBJECT" once key?
		require
			a_key_not_void: a_key /= Void
		do
			Result := is_expected_key (a_key, object_once_key)
		end

	has_thread_key (a_keys: ET_MANIFEST_STRING_LIST): BOOLEAN
			-- Does `a_keys' contain the "THREAD" once key?
		require
			a_keys_not_void: a_keys /= Void
		do
			Result := has_expected_key (a_keys, thread_once_key)
		end

	is_thread_key (a_key: ET_MANIFEST_STRING): BOOLEAN
			-- Is `a_key' the "THREAD" once key?
		require
			a_key_not_void: a_key /= Void
		do
			Result := is_expected_key (a_key, thread_once_key)
		end

	has_process_key (a_keys: ET_MANIFEST_STRING_LIST): BOOLEAN
			-- Does `a_keys' contain the "PROCESS" once key?
		require
			a_keys_not_void: a_keys /= Void
		do
			Result := has_expected_key (a_keys, process_once_key)
		end

	is_process_key (a_key: ET_MANIFEST_STRING): BOOLEAN
			-- Is `a_key' the "PROCESS" once key?
		require
			a_key_not_void: a_key /= Void
		do
			Result := is_expected_key (a_key, process_once_key)
		end

	has_expected_key (a_keys: ET_MANIFEST_STRING_LIST; a_expected_key: STRING): BOOLEAN
			-- Does `a_keys' contain the once key `a_expected_key'?
		require
			a_keys_not_void: a_keys /= Void
			a_expected_key_not_void: a_expected_key /= Void
		local
			i, nb: INTEGER
		do
			nb := a_keys.count
			from i := 1 until i > nb loop
				if is_expected_key (a_keys.manifest_string (i), a_expected_key) then
					Result := True
						-- Jump out of the list.
					i := nb + 1
				end
				i := i + 1
			end
		end

	is_expected_key (a_key: ET_MANIFEST_STRING; a_expected_key: STRING): BOOLEAN
			-- Is `a_key' the once key `a_expected_key'?
		require
			a_key_not_void: a_key /= Void
			a_expected_key_not_void: a_expected_key /= Void
		do
			Result := STRING_.same_case_insensitive (a_key.value, a_expected_key)
		end

feature -- Standard once keys

	thread_once_key: STRING = "THREAD"
			-- "THREAD" once key

	process_once_key: STRING = "PROCESS"
			-- "PROCESS" once key

	object_once_key: STRING = "OBJECT"
			-- "OBJECT" once key

end
