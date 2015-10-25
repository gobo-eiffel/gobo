note

	description:

		"Objects that receive the results of one transformation, and pass them to another"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
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

	make (a_transformer: like transformer; a_system_id: like base_uri; a_destination: like next_destination)
			-- Establish invariant.
		require
			transformer_not_void: a_transformer /= Void
			system_id_not_void: a_system_id /= Void
			destination_not_void: a_destination /= Void
		local
			l_document_uri: like document_uri
		do
			transformer := a_transformer
			base_uri := a_system_id
			create l_document_uri.make (base_uri)
			document_uri := l_document_uri
			next_destination := a_destination
			builder := transformer.new_builder (transformer.new_parser, base_uri, l_document_uri)
			builder.set_base_uri (base_uri)
			builder.set_document_uri (l_document_uri)
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

	document_pool: XM_XPATH_DOCUMENT_POOL
			-- Document pool
		do
			Result := transformer.document_pool
		end

feature -- Events

	close
			-- Notify the end of event stream.
		do
			Precursor
			if attached {XM_XPATH_DOCUMENT} builder.current_root as a_document then
				check attached document_uri as l_document_uri then
					if document_pool.is_document_mapped (l_document_uri.full_reference) then

						-- Done to keep the one URI to same document mapping
						--  in some sort of spurious shape

						remove_document (l_document_uri.full_reference)
					end
					transformer.register_document (a_document, transformer.configuration.default_media_type (l_document_uri.full_uri), l_document_uri.full_uri)
					transformer.transform_document (a_document, next_destination)
				end
			end
		end

invariant

	transformer_not_void: transformer /= Void

end

