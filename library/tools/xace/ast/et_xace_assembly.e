indexing

	description:

		"Xace ISE .NET assemblies"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_ASSEMBLY

create

	make

feature {NONE} -- Initialization

	make (a_tag: like tag; a_name: like assembly_name; a_version: like version;
		a_culture: like culture; a_public_key_token: like public_key_token;
		a_prefix: like class_prefix) is
			-- Create a new assembly.
		require
			a_tag_not_void: a_tag /= Void
			a_tag_not_empty: a_tag.count > 0
			a_name_not_void: a_name /= Void
			a_version_not_void: a_version /= Void
			a_culture_not_void: a_culture /= Void
			a_public_key_token_not_void: a_public_key_token /= Void
		do
			tag := a_tag
			assembly_name := a_name
			version := a_version
			culture := a_culture
			public_key_token := a_public_key_token
			class_prefix := a_prefix
		ensure
			tag_set: tag = a_tag
			assembly_name_set: assembly_name = a_name
			version_set: version = a_version
			culture_set: culture = a_culture
			public_key_token_set: public_key_token = a_public_key_token
			class_prefix_set: class_prefix = a_prefix
		end

feature -- Access

	tag: STRING
			-- Tag

	assembly_name: STRING
			-- Assembly name

	assembly_pathname: STRING
			-- Assembly pathname
			-- (overrides other information when specified)

	version: STRING
			-- Version

	culture: STRING
			-- Culture

	public_key_token: STRING
			-- Public key token

	class_prefix: STRING
			-- Class prefix

feature -- Setting

	set_assembly_pathname (a_pathname: STRING) is
			-- Set `assembly_pathname' to `a_pathname'.
		do
			assembly_pathname := a_pathname
		ensure
			assembly_pathname_set: assembly_pathname = a_pathname
		end
		
invariant

	tag_not_void: tag /= Void
	tag_not_empty: tag.count > 0
	assembly_name_not_void: assembly_name /= Void
	version_not_void: version /= Void
	culture_not_void: culture /= Void
	public_key_token_not_void: public_key_token /= Void

end
