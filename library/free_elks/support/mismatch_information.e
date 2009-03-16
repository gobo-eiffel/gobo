note

	description: "Original values of the attributes of a mismatched object."
	instructions: "[
		This object will contain the original values of the attributes
		of a retrieved object for which a mismatched was detected at
		retrieval time. The value are indexed by the name of the attribute
		in the stored object. One extra entry is provided to contain the
		original name of the class in the storing system, indexed by the
		string 'class'. This allows `correct_mismatch' to determine the
		original name of its generating class in case class-name
		translation is in effect.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class MISMATCH_INFORMATION

inherit
	HASH_TABLE [ANY, STRING]
		redefine
			default_create,
			out
		end

create {MISMATCH_CORRECTOR}
	default_create

feature -- Initialization

	default_create
			-- Make container with default size
		do
			make (5)
			set_callback_pointers
		end

feature -- Access

	class_name: STRING
			-- Name of generating class which held attribute values
		local
			r: detachable STRING
		do
			check
				has_class_entry: has (Class_key)
			end
			if attached {STRING} item (Class_key) as l_result then
				r := l_result
			end
			check
				r_attached: r /= Void
			end
			Result := r
		ensure
			result_exists: Result /= Void
		end

feature -- Output

	out: STRING
			-- Printable representation of attributes values
		local
			i: detachable ANY
			k: detachable STRING
		do
			from
				create Result.make (20 + class_name.count + 40 * count)
				Result.append ("Attributes of original class ")
				Result.append (class_name)
				Result.append (": ")
				Result.append_integer (count - 1)
				Result.append (" item")
				if count - 1 /= 1 then Result.append_character ('s') end
				Result.append_character ('%N')
				start
			until
				after
			loop
				k := key_for_iteration
				if k /~ Class_key then
					Result.append ("  ")
					if k = Void then
						Result.append ("Void")
					else
						Result.append (k)
					end
					Result.append (": ")
					i := item_for_iteration
					if i = Void then
						Result.append ("Void")
					else
						Result.append (i.out)
					end
					Result.append_character ('%N')
				end
				forth
			end
		end

feature {NONE} -- Implementation

	Class_key: STRING = "class"

	internal_put (value: ANY; ckey: POINTER)
			-- Allows run-time to insert items into table
		local
			l_key: STRING
		do
			create l_key.make_from_c (ckey)
			put (value, l_key)
		end

	set_callback_pointers
			-- Sets call-back pointers in the run-time
		once
			set_mismatch_information_access (Current, $clear_all, $internal_put)
		end

feature {NONE} -- Externals

	set_mismatch_information_access (obj: ANY; init, add: POINTER)
		external
			"C signature (EIF_OBJECT, EIF_PROCEDURE, EIF_PROCEDURE) use <eif_retrieve.h>"
		end

invariant
	singleton: (create {MISMATCH_CORRECTOR}).mismatch_information /= Void implies
		Current = (create {MISMATCH_CORRECTOR}).mismatch_information

end
