indexing

	description:

		"Objects that strip white space from stylesheet elements."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_STYLESHEET_STRIPPER

inherit
	
	XM_XSLT_STRIPPER
		rename
			make as make_stripper
		redefine
			another, space_preserving_mode, is_local_invariant_met
		end

create

	make, make_another

feature {NONE} -- Initialization

	make (an_underlying_receiver: XM_XPATH_RECEIVER) is
			-- Build stylesheet rules.
		require
			underlying_receiver_not_void: an_underlying_receiver /= Void
		do
			xsl_text_fingerprint := shared_name_pool.fingerprint (Xslt_uri, "text")
			create specials.make (1, 10)
			specials.put (shared_name_pool.fingerprint (Xslt_uri, "analyze-string"), 1)
			specials.put (shared_name_pool.fingerprint (Xslt_uri, "apply-imports"), 2)
			specials.put (shared_name_pool.fingerprint (Xslt_uri, "apply-templates"), 3)
			specials.put (shared_name_pool.fingerprint (Xslt_uri, "attribute-set"), 4)
			specials.put (shared_name_pool.fingerprint (Xslt_uri, "call-template"), 5)
			specials.put (shared_name_pool.fingerprint (Xslt_uri, "character-map"), 6)
			specials.put (shared_name_pool.fingerprint (Xslt_uri, "choose"), 7)
			specials.put (shared_name_pool.fingerprint (Xslt_uri, "next-match"), 8)
			specials.put (shared_name_pool.fingerprint (Xslt_uri, "stylesheet"), 9)
			specials.put (shared_name_pool.fingerprint (Xslt_uri, "transform"), 10)
			base_receiver := an_underlying_receiver
			create strip_stack.make (100)
			system_id := an_underlying_receiver.system_id
		ensure
			base_receiver_set: base_receiver = an_underlying_receiver
		end

	make_another (other: XM_XSLT_STYLESHEET_STRIPPER) is
			-- Create another stylesheet stripper.
		require
			stripper_not_void: other /= Void
		do
			xsl_text_fingerprint := other.xsl_text_fingerprint
			specials := other.specials
			base_receiver := other.base_receiver
		ensure
			fingerprint_set: xsl_text_fingerprint = other.xsl_text_fingerprint
			specials_set: specials = other.specials
			base_receiver_set: base_receiver = other.base_receiver
		end

feature -- Access

	space_preserving_mode (a_name_code: INTEGER): INTEGER is
			-- Space-preserving mode for element identitifed by `a_name_code'
		local
			a_fingerprint, counter: INTEGER
			found: BOOLEAN
		do
			a_fingerprint := a_name_code - (a_name_code // bits_20) * bits_20
			if a_fingerprint = xsl_text_fingerprint then
				Result := Always_preserve
			else
				from
					counter := 1
				variant
					11 - counter
				until
					found or else counter > 10
				loop
					if specials.item (counter) = a_fingerprint then
						found := True
						Result := Always_strip
					end	
					counter := counter + 1
				end
				if not found then
					Result := Strip_default
				end
			end
		end

feature -- Duplication

	another: XM_XSLT_STRIPPER is
			-- A clean copy of `Current'
		do
			create {XM_XSLT_STYLESHEET_STRIPPER} Result.make_another (Current)
		end

feature {XM_XSLT_STYLESHEET_STRIPPER} -- Local

	xsl_text_fingerprint: INTEGER
			-- Fingerprint for xsl:text elements

	specials: ARRAY [INTEGER]
			-- Fingerprints for xsl elements which must always be white-space-stripped

	is_local_invariant_met: BOOLEAN is
			-- is the invariant met?
		do
			Result := strip_stack /= Void
		end

invariant

	specials_not_void: specials /= Void
	no_stripper_mode: stripper_mode = Void

end
	
