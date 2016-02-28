note

	description:

		"xml:id validator"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XMLID_VALIDATOR

inherit

	XM_CALLBACKS_FILTER
		redefine
			initialize,
			on_start,
			on_finish,
			on_attribute
		end

	XM_MARKUP_CONSTANTS
		export {NONE} all end

	XM_SHARED_UNICODE_CHARACTERS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make_null,
	make_next

feature {NONE} -- Initialization

	initialize
			-- Initialize current callbacks.
		do
			create ids.make_default
			ids.set_equality_tester (string_equality_tester)
		end

feature -- Events

	on_start
			-- Initialize ID set.
		do
			ids.wipe_out
			Precursor
		end

	on_finish
			-- Clear ID set.
		do
			ids.wipe_out
			Precursor
		end

	on_attribute (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING; a_value: STRING)
			-- Normalize xml:id attribute and check it is unique.
		local
			an_id: STRING
		do
			if (a_prefix /= Void and then has_prefix (a_prefix) and then a_prefix.same_string (Xml_prefix)) and a_local_part.same_string (Xml_id) then
				an_id := normalize (a_value)
				if not characters_1_0.is_ncname (an_id) then
					on_error (Id_not_ncname_error)
				elseif ids.has (an_id) then
					on_error (Duplicate_id_error)
				else
					ids.force (an_id)
				end
				Precursor (a_namespace, a_prefix, a_local_part, an_id)
			end
		end

feature {NONE} -- Implementation

	ids: DS_HASH_SET [STRING]
			-- IDs table for duplicate check

feature {NONE} -- Implementation

	normalize (an_id: STRING): STRING
			-- Identifier attribute normalized
			-- (duplicates spaces removed, head and trailing spaces removed)
		require
			an_id_not_void: an_id /= Void
			--xml_normalized: is_normalized_attribute (an_id)
		local
			last_start: INTEGER
			i: INTEGER
		do
				-- Remove duplicate spaces
			from
				create Result.make_empty
				last_start := 1
				i := 2
			until
				i > an_id.count
			loop
				if is_space (an_id.item_code (i)) and is_space (an_id.item_code (i - 1)) then
					if last_start > 0 then
							-- There has been valid chars since last duplicate space
						Result := STRING_.appended_string (Result, an_id.substring (last_start, i - 1))
						last_start := 0
					end
				else
					if last_start = 0 then
							-- first of non duplicate space char
						last_start := i
					end
				end
				i := i + 1
			variant
				an_id.count - i + 1
			end

			if last_start = 1 then
					-- no duplicate spaces
				Result := an_id
			elseif last_start > 1 then
					-- tail
				Result := STRING_.appended_string (Result, an_id.substring (last_start, an_id.count))
			else
				check
					no_leftovers: last_start = 0
					ends_with_space: is_space (an_id.item_code (an_id.count))
				end
			end

				-- Remove heading and trailing space
			if not Result.is_empty and then is_space (Result.item_code (1)) then
				Result := Result.substring (2, Result.count)
			end
			if not Result.is_empty and then is_space (Result.item_code (Result.count)) then
				Result := Result.substring (1, Result.count - 1)
			end
		ensure
			result_not_void: Result /= Void
			fewer_or_equal_count: Result.count <= an_id.count
			not_heading_space: Result.is_empty or else not is_space (Result.item_code (1))
			not_trailing_space: Result.is_empty or else not is_space (Result.item_code (Result.count))
		end

	is_space (a_char: INTEGER): BOOLEAN
			-- Is this character a space for the purpose of ID normalisation?
		do
			Result := characters_1_0.is_space (a_char)
		end

feature {NONE} -- Constants

	Duplicate_id_error: STRING = "duplicate xml:id declaration"
			-- Duplicate ID

	Id_not_ncname_error: STRING = "xml:id value is not an NCName"
			-- NCName error

invariant

	ids_not_void: ids /= Void
	no_void_id: not ids.has_void

end
