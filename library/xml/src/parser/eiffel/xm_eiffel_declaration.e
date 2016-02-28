note

	description:

		"XML declaration"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_EIFFEL_DECLARATION

create

	make

feature {NONE} -- Creation

	make
			-- Initialize.
		do
			version := Default_version
			encoding := Default_encoding
			stand_alone := Default_stand_alone
		end

feature {NONE} -- Encoding

	Default_version: STRING = "1.0"
	Default_encoding: STRING = "utf-8"
	Default_stand_alone: BOOLEAN = True

feature -- Attribute(s)

	version: STRING
			-- Version

	encoding: STRING
			-- XML encoding.

	stand_alone: BOOLEAN
			-- Standalone document?

feature -- Setting

	set_version (a: STRING)
			-- Set version.
		require
			not_void: a /= Void
		do
			version := a
		end

	set_encoding (a: STRING)
			-- Set encoding
		require
			not_void: a /= Void
		do
			encoding := a
		end

	set_stand_alone (a: BOOLEAN)
			-- Set stand alone status.
		do
			stand_alone := a
		end

feature -- Event(s)

	process (a_callback: XM_CALLBACKS)
			-- Process XML declaration events.
		require
			not_void: a_callback /= Void
		do
			a_callback.on_xml_declaration (version, encoding, stand_alone)
		end

invariant

	version_not_void: version /= Void
	encoding_not_void: encoding /= Void

end
