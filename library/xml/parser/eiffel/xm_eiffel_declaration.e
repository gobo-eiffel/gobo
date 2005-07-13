indexing

	description:

		"XML declaration"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_EIFFEL_DECLARATION

create

	make
	
feature {NONE} -- Creation

	make is
			-- Initialize.
		do
			version := Default_version
			encoding := Default_encoding
			stand_alone := Default_stand_alone
		end

feature {NONE} -- Encoding

	Default_version: STRING is "1.0"
	Default_encoding: STRING is "utf-8"
	Default_stand_alone: BOOLEAN is True
			
feature -- Attribute(s)

	version: STRING
			-- Version
			
	encoding: STRING
			-- XML encoding.
			
	stand_alone: BOOLEAN
			-- Standalone document?

feature -- Setting

	set_version (a: STRING) is
			-- Set version.
		require
			not_void: a /= Void
		do
			version := a
		end
		
	set_encoding (a: STRING) is
			-- Set encoding
		require
			not_void: a /= Void
		do
			encoding := a
		end
	
	set_stand_alone (a: BOOLEAN) is
			-- Set stand alone status.
		do
			stand_alone := a
		end

feature -- Event(s)

	process (a_callback: XM_CALLBACKS) is
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
