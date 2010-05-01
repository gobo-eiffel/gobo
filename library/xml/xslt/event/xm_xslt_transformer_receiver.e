note
	
	description:
	
		"Objects that receive the results of one transformation, and pass them to another"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_TRANSFORMER_RECEIVER
	
inherit

	XM_XPATH_TRANSFORMER

	XM_XPATH_PROXY_RECEIVER
		redefine
			close
		end

create

	make

feature {NONE} -- Initialization

	make (a_transformer: like transformer; a_system_id: like base_uri; a_destination: like next_destination) is
			-- Establish invariant.
		require
			transformer_not_void: a_transformer /= Void
			system_id_not_void: a_system_id /= Void
			destination_not_void: a_destination /= Void
		do
			transformer := a_transformer
			base_uri := a_system_id
			create document_uri.make (base_uri)
			next_destination := a_destination
			builder := transformer.new_builder (transformer.new_parser, base_uri, document_uri)
			builder.set_base_uri (base_uri)
			builder.set_document_uri (document_uri)
			base_receiver := transformer.new_stripper (builder)
		ensure
			transformer_set: transformer = a_transformer
			base_uri_set: base_uri = a_system_id
			destination_set: next_destination = a_destination
		end

feature -- Access

	next_destination:  XM_XSLT_TRANSFORMATION_RESULT
			-- Destination for next stage in transformation

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer for next stage

	builder: XM_XPATH_BUILDER
			-- Document builder

	document_pool: XM_XPATH_DOCUMENT_POOL is
			-- Document pool
		do
			Result := transformer.document_pool
		end

feature -- Events
	
	close is
			-- Notify the end of event stream.
		local
			a_document: XM_XPATH_DOCUMENT
		do
			Precursor
			a_document ?= builder.current_root
			if a_document /= Void then
				if document_pool.is_document_mapped (document_uri.full_reference) then

					-- Done to keep the one URI to same document mapping
					--  in some sort of spurious shape

					remove_document (document_uri.full_reference)
				end
				transformer.register_document (a_document, transformer.configuration.default_media_type (document_uri.full_uri), document_uri.full_uri)
				transformer.transform_document (a_document, next_destination)
			end
		end

invariant
	
	transformer_not_void: transformer /= Void

end
	
