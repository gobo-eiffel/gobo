indexing
   description: "Class for parsing XML documents"
   status: "See notice at end of class."
   author: "Andreas Leitner"

deferred class
   XI_EVENT_PARSER

inherit
   XI_PARSER
        redefine
	   last_error,
	   last_error_description
        end

   BIDIRECTIONAL_IMPLEMENTATION
      redefine
         interface
      end

feature {ANY} -- Status
   
   last_error: INTEGER is
	 -- see XM_PARSE_ERROR_CODES
      deferred
      end

   last_error_description: STRING is
	 -- gives a text that explain what the error reported by
	 -- 'last_error' was all about.
      deferred
      end


feature {NONE} -- Redefinable Callbacks
   
   on_element_declaration (name: UC_STRING) is
      require
         valid_name: name /= Void and not name.empty
--         valid_model: model /= default_pointer
      do
         interface.on_element_declaration (name)
      end
   
   on_attribute_declaration (element_name, attribute_name, attribute_type, default_value: UC_STRING; is_required: BOOLEAN) is
      do
         interface.on_attribute_declaration (element_name, attribute_name, attribute_type, default_value, is_required)
      end
   
   on_xml_declaration (xml_version, encoding: UC_STRING; standalone: BOOLEAN) is
      do
         interface.on_xml_declaration (xml_version, encoding, standalone)
      end
   
   on_entity_declaration (entity_name: UC_STRING; 
                                    is_parameter_entity: BOOLEAN; 
                                    value: UC_STRING; 
                                    value_length: INTEGER; 
                                    base, 
                                    system_id, 
                                    public_id, 
                                    notation_name: UC_STRING) is
      do
         interface.on_entity_declaration (entity_name, is_parameter_entity, value, value_length, base, system_id, public_id, notation_name)
      end
   
   on_start_tag (name, ns_prefix: UC_STRING; attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]) is
         -- called whenever the parser findes a start element
      require
         name_not_void: name /= Void
      do
         interface.on_start_tag (name, ns_prefix, attributes)
      end
   
   on_end_tag (name, ns_prefix: UC_STRING) is
         -- called whenever the parser findes an end element
      require
         name_not_void: name /= Void
      do
         interface.on_end_tag (name, ns_prefix)
      end
   
   on_content (chr_data: UC_STRING) is
         -- called whenever the parser findes character data
      require
         chr_data_not_void: chr_data /= Void
      do
         interface.on_content (chr_data)
      end
   
   on_processing_instruction (target, data: UC_STRING) is
         -- called whenever the parser findes a proccessing instruction.
      require
         target_not_void: target /= Void
         data_not_void: data /= Void
      do
         interface.on_processing_instruction (target, data)
      end

   on_comment (com: UC_STRING) is
         -- called whenever the parser findes a comment.
      require
         com_not_void: com /= Void
      do
         interface.on_comment (com)
      end
   
   on_start_cdata_section is
      do
         interface.on_start_cdata_section
      end
   
   on_end_cdata_section is
      do
         interface.on_end_cdata_section
      end

   on_default (data: UC_STRING) is
      do
         interface.on_default (data)
      end
   
   on_default_expanded (data: UC_STRING) is
      do
         interface.on_default_expanded (data)
      end   
   
   on_start_doctype (name, system_id, public_id: UC_STRING; has_internal_subset: BOOLEAN) is
         -- This is called for the start of the DOCTYPE declaration, before
         -- any DTD or internal subset is parsed.
      require
         valid_name: name /= Void
      do
         interface.on_start_doctype (name, system_id, public_id, has_internal_subset)
      end
   
   on_end_doctype is
         -- This is called for the start of the DOCTYPE declaration when the
         -- closing > is encountered, but after processing any external subset.
      do
         interface.on_end_doctype
      end
   
   on_notation_declaration (notation_name, 
                            base, 
                            system_id, 
                            public_id: UC_STRING) is
      do
         interface.on_notation_declaration (notation_name, base, system_id, public_id)
      end
   
   on_start_namespace_declaration (namespace_prefix, uri: UC_STRING) is
      do
         interface.on_start_namespace_declaration (namespace_prefix, uri)
      end
   
   on_end_namespace_declaration (namespace_prefix: UC_STRING) is
      do
         interface.on_end_namespace_declaration (namespace_prefix)
      end
   
   on_not_standalone: BOOLEAN is
      do
         Result := interface.on_not_standalone
      end
   

feature {NONE} -- Implementation
   
   interface: XM_EVENT_PARSER

end -- class XI_EVENT_PARSER

--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolkit
--| Copyright (C) 1999  Andreas Leitner and others
--| See the file forum.txt included in this package for licensing info.
--|
--| Comments, Questions, Additions to this library? please contact:
--|
--| Andreas Leitner
--| Arndtgasse 1/3/5
--| 8010 Graz
--| Austria
--| email: andreas.leitner@chello.at
--| www: http://exml.dhs.org
--|-------------------------------------------------------------------------
