deferred class XM_URI_SOURCE

inherit

	XM_SOURCE
		redefine
			out
		end

feature

	uri: UC_STRING is
			-- URI for the source of the XML document
		deferred
		end

	out: STRING is
		do
			Result := clone (uri.to_utf8)
		end

end
