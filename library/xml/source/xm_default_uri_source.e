class XM_DEFAULT_URI_SOURCE

inherit

    XM_URI_SOURCE

creation

    make

feature

    make (a_uri: UC_STRING) is
        do
            uri := a_uri
        ensure
            uri_set: equal (uri, a_uri)
        end

feature

    uri: UC_STRING

end -- class XM_DEFAULT_URI_SOURCE

