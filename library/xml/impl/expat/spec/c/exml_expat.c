#include "exml_expat.h"


/* enum XML_Content_Type */

EIF_INTEGER exml_xml_ctype_empty()
{
  return XML_CTYPE_EMPTY;
}

EIF_INTEGER exml_xml_ctype_any()
{
  return XML_CTYPE_ANY;
}

EIF_INTEGER exml_xml_ctype_mixed()
{
  return XML_CTYPE_MIXED;
}

EIF_INTEGER exml_xml_ctype_name()
{
  return XML_CTYPE_NAME;
}

EIF_INTEGER exml_xml_ctype_choice()
{
  return XML_CTYPE_CHOICE;
}

EIF_INTEGER exml_xml_ctype_seq()
{
  return XML_CTYPE_SEQ;
}


/* enum XML_Content_Quant */

EIF_INTEGER exml_xml_cquant_none()
{
  return XML_CQUANT_NONE;
}

EIF_INTEGER exml_xml_cquant_opt()
{
  return XML_CQUANT_OPT;
}

EIF_INTEGER exml_xml_cquant_rep()
{
  return XML_CQUANT_REP;
}

EIF_INTEGER exml_xml_cquant_plus()
{
  return XML_CQUANT_PLUS;
}


/* enum XML_ParamEntityParsing */

EIF_INTEGER exml_xml_param_entity_parsing_never()
{
  return XML_PARAM_ENTITY_PARSING_NEVER;
}

EIF_INTEGER exml_xml_param_entity_parsing_unless_standalone()
{
  return XML_PARAM_ENTITY_PARSING_UNLESS_STANDALONE;
}

EIF_INTEGER exml_xml_param_entity_parsing_always()
{
  return XML_PARAM_ENTITY_PARSING_ALWAYS;
}


/* enum XML_Error */

EIF_INTEGER exml_xml_error_none()
{
  return XML_ERROR_NONE;
}

EIF_INTEGER exml_xml_error_no_memory()
{
  return XML_ERROR_NO_MEMORY;
}

EIF_INTEGER exml_xml_error_syntax()
{
  return XML_ERROR_SYNTAX;
}

EIF_INTEGER exml_xml_error_no_elements()
{
  return XML_ERROR_NO_ELEMENTS;
}

EIF_INTEGER exml_xml_error_invalid_token()
{
  return XML_ERROR_INVALID_TOKEN;
}

EIF_INTEGER exml_xml_error_unclosed_token()
{
  return XML_ERROR_UNCLOSED_TOKEN;
}

EIF_INTEGER exml_xml_error_partial_char()
{
  return XML_ERROR_PARTIAL_CHAR;
}

EIF_INTEGER exml_xml_error_tag_mismatch()
{
  return XML_ERROR_TAG_MISMATCH;
}

EIF_INTEGER exml_xml_error_duplicate_attribute()
{
  return XML_ERROR_DUPLICATE_ATTRIBUTE;
}

EIF_INTEGER exml_xml_error_junk_after_doc_element()
{
  return XML_ERROR_JUNK_AFTER_DOC_ELEMENT;
}

EIF_INTEGER exml_xml_error_param_entity_ref()
{
  return XML_ERROR_PARAM_ENTITY_REF;
}

EIF_INTEGER exml_xml_error_undefined_entity()
{
  return XML_ERROR_UNDEFINED_ENTITY;
}

EIF_INTEGER exml_xml_error_recursive_entity_ref()
{
  return XML_ERROR_RECURSIVE_ENTITY_REF;
}

EIF_INTEGER exml_xml_error_async_entity()
{
  return XML_ERROR_ASYNC_ENTITY;
}

EIF_INTEGER exml_xml_error_bad_char_ref()
{
  return XML_ERROR_BAD_CHAR_REF;
}

EIF_INTEGER exml_xml_error_binary_entity_ref()
{
  return XML_ERROR_BINARY_ENTITY_REF;
}

EIF_INTEGER exml_xml_error_attribute_external_entity_ref()
{
  return XML_ERROR_ATTRIBUTE_EXTERNAL_ENTITY_REF;
}

EIF_INTEGER exml_xml_error_misplaced_xml_pi()
{
  return XML_ERROR_MISPLACED_XML_PI;
}

EIF_INTEGER exml_xml_error_unknown_encoding()
{
  return XML_ERROR_UNKNOWN_ENCODING;
}

EIF_INTEGER exml_xml_error_incorrect_encoding()
{
  return XML_ERROR_INCORRECT_ENCODING;
}

EIF_INTEGER exml_xml_error_unclosed_cdata_section()
{
  return XML_ERROR_UNCLOSED_CDATA_SECTION;
}

EIF_INTEGER exml_xml_error_external_entity_handling()
{
  return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
}

EIF_INTEGER exml_xml_error_not_standalone()
{
  return XML_ERROR_NOT_STANDALONE;
}

EIF_INTEGER exml_xml_error_unexpected_state()
{
  return XML_ERROR_UNEXPECTED_STATE;
}


/* struct XML_cp */

EIF_INTEGER exml_xml_cp_size()
{
   return (sizeof (struct XML_cp));
}

EIF_INTEGER exml_xml_cp_type(struct XML_cp *p)
{
  return p->type;
}

EIF_INTEGER exml_xml_cp_quant(struct XML_cp *p)
{
  return p->quant;
}

EIF_POINTER exml_xml_cp_name(struct XML_cp *p)
{
  return ((void*) p->name);
}

EIF_INTEGER exml_xml_cp_numchildren(struct XML_cp *p)
{
  return p->numchildren;
}

EIF_POINTER exml_xml_cp_children(struct XML_cp *p, EIF_INTEGER index)
{
  return ( (EIF_POINTER) (&(p->children[index])));
}


/* creating and destroying parsers */

EIF_POINTER exml_XML_ParserCreate(EIF_POINTER encoding)
{
  return ( XML_ParserCreate(encoding) );
}

EIF_POINTER exml_XML_ParserCreateNS(EIF_POINTER encoding, EIF_CHARACTER namespace_separator)
{
  return ( XML_ParserCreateNS(encoding, namespace_separator) );
}

EIF_POINTER exml_XML_ParserCreate_MM(EIF_POINTER encoding, EIF_POINTER memsuite, EIF_POINTER namespace_separator)
{
  return ( XML_ParserCreate_MM(encoding, (void*) memsuite, namespace_separator) );
}

EIF_POINTER exml_XML_ExternalEntityParserCreate(EIF_POINTER parser, EIF_POINTER context, EIF_POINTER encoding)
{
  return ( XML_ExternalEntityParserCreate(parser, context, encoding) );
}

void exml_XML_ParserFree(EIF_POINTER parser)
{
  XML_ParserFree (parser);
}


/* parsing */

EIF_INTEGER exml_XML_Parse(EIF_POINTER parser, EIF_POINTER s, EIF_INTEGER len, EIF_BOOLEAN isFinal)
{
  return (XML_Parse(parser, s, len, isFinal) );
}


/* error reporting */

EIF_INTEGER exml_XML_GetErrorCode(EIF_POINTER parser)
{
  return ( XML_GetErrorCode(parser) );
}

EIF_POINTER exml_XML_ErrorString(EIF_INTEGER code)
{
  return ( (void*) (XML_ErrorString(code)) );
}


/* parse state reporting */

EIF_INTEGER exml_XML_GetCurrentLineNumber(EIF_POINTER parser)
{
  return XML_GetCurrentLineNumber(parser);
}
EIF_INTEGER exml_XML_GetCurrentColumnNumber(EIF_POINTER parser)
{
  return XML_GetCurrentColumnNumber(parser);
}

EIF_INTEGER exml_XML_GetCurrentByteIndex(EIF_POINTER parser)
{
  return XML_GetCurrentByteIndex(parser);
}


/* various */

void exml_XML_SetExternalEntityRefHandlerArg(EIF_POINTER parser, EIF_POINTER arg)
{
  XML_SetExternalEntityRefHandlerArg (parser, arg);
}

void exml_XML_SetUserData(EIF_POINTER parser, EIF_OBJECT callback)
{
#ifdef ise
  EIF_OBJECT protected_callback;
  if (callback == NULL)
    {
      /* just for debugging purposes, will be removed */
      eif_disable_visible_exception ();

      protected_callback = XML_GetUserData(parser);
      if (protected_callback != NULL)
        { eif_wean (protected_callback); }
      XML_SetUserData(parser, NULL);
    }
  else
    {
      /* just for debugging purposes, will be removed */
      //eif_enable_visible_exception ();

      protected_callback = eif_adopt (callback);
      XML_SetUserData(parser, protected_callback);
    }
#endif
#ifdef se
  XML_SetUserData(parser, callback);
#endif
}

EIF_OBJECT exml_XML_GetUserData(EIF_POINTER parser)
{
#ifdef ise
  return ( eif_access (XML_GetUserData(parser)) );
#endif
#ifdef se
  return ( XML_GetUserData(parser) );
#endif
}

EIF_BOOLEAN exml_XML_SetBase(EIF_POINTER parser, EIF_POINTER base)
{
  return XML_SetBase(parser, base);
}

EIF_POINTER exml_XML_GetBase(EIF_POINTER parser)
{
  return ( (void*) XML_GetBase(parser));
}

EIF_BOOLEAN exml_XML_SetParamEntityParsing(EIF_POINTER parser, EIF_INTEGER parsing)
{
  return XML_SetParamEntityParsing(parser, parsing);
}

EIF_POINTER exml_XML_ExpatVersion()
{
  return ( (void*) XML_ExpatVersion());
}


/* register handlers */

/* C intermediate callbacks between Expat and Eiffel code.  
   the exml_on_* functions will be registered when a callback is
   requested for a certain XML event. This callback will dispatch the
   event further to the Eiffel side using the registered eiffel_object. */

#ifdef se
/* prototype callback function */
void eif_exml_on_element_declaration_proc(EIF_OBJ obj, EIF_POINTER name, EIF_POINTER model);
void eif_exml_on_attribute_declaration_proc(EIF_OBJ obj, EIF_POINTER elname, EIF_POINTER attname, EIF_POINTER att_type, EIF_POINTER dflt, EIF_BOOLEAN isrequired);
void eif_exml_on_xml_declaration_proc(EIF_OBJ obj, EIF_POINTER version, EIF_POINTER encoding, EIF_INTEGER standalone);
void eif_exml_on_entity_declaration_proc(EIF_OBJ obj, EIF_POINTER entityName, EIF_BOOLEAN is_parameter_entity, EIF_POINTER value, EIF_INTEGER length, EIF_POINTER base, EIF_POINTER systemId, EIF_POINTER publicId, EIF_POINTER notationName);
void eif_exml_on_start_tag_proc(EIF_OBJ obj, EIF_POINTER name, EIF_POINTER atts);
void eif_exml_on_end_tag_proc(EIF_OBJ obj, EIF_POINTER name);
void eif_exml_on_content_proc(EIF_OBJ obj, EIF_POINTER name, EIF_INTEGER len);
void eif_exml_on_processing_instruction_proc(EIF_OBJ obj, EIF_POINTER target, EIF_POINTER data);
void eif_exml_on_comment_proc(EIF_OBJ obj, EIF_POINTER data);
void eif_exml_on_start_cdata_section_proc(EIF_OBJ obj);
void eif_exml_on_end_cdata_section_proc(EIF_OBJ obj);
void eif_exml_on_default_proc(EIF_OBJ obj, EIF_POINTER s, EIF_INTEGER len);
void eif_exml_on_default_expanded_proc(EIF_OBJ obj, EIF_POINTER s, EIF_INTEGER len);
void eif_exml_on_start_doctype_proc(EIF_OBJ obj, EIF_POINTER doctypeName, EIF_POINTER sysid, EIF_POINTER pubid, EIF_BOOLEAN has_internal_subset);
void eif_exml_on_end_doctype_proc(EIF_OBJ obj);
void eif_exml_on_notation_declaration_proc(EIF_OBJ obj, EIF_POINTER notation_name, EIF_POINTER base, EIF_POINTER system_id, EIF_POINTER public_id);
void eif_exml_on_start_namespace_declaration_proc(EIF_OBJ obj, EIF_POINTER prefix, EIF_POINTER uri);
void eif_exml_on_end_namespace_declaration_proc(EIF_OBJ obj, EIF_POINTER prefix);
EIF_BOOLEAN eif_exml_on_not_standalone_proc(EIF_OBJ obj);
EIF_BOOLEAN eif_exml_on_external_entity_reference_proc(EIF_OBJ obj, EIF_POINTER context, EIF_POINTER base, EIF_POINTER systemId, EIF_POINTER publicId);
EIF_BOOLEAN eif_exml_on_unknown_encoding_proc(EIF_OBJ obj, EIF_POINTER name, EIF_POINTER info);
#endif

void exml_on_element_declaration (void *eiffel_object, 
                                  const XML_Char *name, 
                                  XML_Content *model)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_element_declaration_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_element_declaration_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object), (void*) name, (void*) model); }
#endif
#ifdef se
  ((eif_exml_on_element_declaration_proc) (eiffel_object, (void*) name, (void*) model));
#endif
}

void exml_on_attribute_declaration (void *eiffel_object, 
                                    const XML_Char *elname, 
                                    const XML_Char *attname, 
                                    const XML_Char *att_type, 
                                    const XML_Char *dflt, 
                                    int isrequired)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_attribute_declaration_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_attribute_declaration_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object), (void*) elname, (void*) attname, (void*) att_type, (void*) dflt, isrequired); }
#endif
#ifdef se
  ((eif_exml_on_attribute_declaration_proc) (eiffel_object, (void*) elname, (void*) attname, (void*) att_type, (void*) dflt, isrequired));
#endif
}

void exml_on_xml_declaration (void *eiffel_object, 
                              const XML_Char *version, 
                              const XML_Char *encoding, 
                              int standalone)
{
#ifdef ise
  EIF_PROCEDURE ep;
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");
	ep = eif_procedure ("on_xml_declaration_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_xml_declaration_procedure not found."); }
  (ep) (eif_access(eiffel_object), (void*) version, (void*) encoding, standalone);
#endif
#ifdef se
  ((eif_exml_on_xml_declaration_proc) (eiffel_object, (void*) version, (void*) encoding, standalone));
#endif
}

void exml_on_entity_declaration (void *eiffel_object, 
                                 const XML_Char *entityName,
                                 int is_parameter_entity,
                                 const XML_Char *value,
                                 int value_length,
                                 const XML_Char *base,
                                 const XML_Char *systemId,
                                 const XML_Char *publicId,
                                 const XML_Char *notationName)
{
#ifdef ise
  EIF_PROCEDURE ep;
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_entity_declaration_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_entity_declaration_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object), (void*) entityName, is_parameter_entity, (void*) value, value_length, (void*) base, (void*) systemId, (void*) publicId, (void*) notationName); }
#endif
#ifdef se
  ((eif_exml_on_entity_declaration_proc) (eiffel_object, (void*) entityName, is_parameter_entity, (void*) value, value_length, (void*) base, (void*) systemId, (void*) publicId, (void*) notationName));
#endif
}

void exml_on_start_tag (void *eiffel_object, 
                        const char *name, 
                        const char **atts)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_start_tag_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_start_tag_procedure not found."); }
  (ep) (eif_access(eiffel_object), (void*) name, (void*) atts);
#endif
#ifdef se
  ((eif_exml_on_start_tag_proc) (eiffel_object, (void*) name, (void*) atts));
#endif
}

void exml_on_end_tag (void *eiffel_object, 
                      const char *name)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_end_tag_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_end_tag_procedure not found."); }
  (ep) (eif_access(eiffel_object), (void*) name);
#endif
#ifdef se
  ((eif_exml_on_end_tag_proc) (eiffel_object, (void*) name));
#endif
}

void exml_on_content (void *eiffel_object, 
                      const XML_Char *s, 
                      int len)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_content_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_content_procedure not found."); }
  (ep) (eif_access(eiffel_object), (void*) s, len);
#endif
#ifdef se
  ((eif_exml_on_content_proc) (eiffel_object, (void*) s, len));
#endif
}

void exml_on_processing_instruction (void *eiffel_object, 
                                     const XML_Char *target, 
                                     const XML_Char *data)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_processing_instruction_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_processing_instruction_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object), (void*) target, (void*) data); }
#endif
#ifdef se
  ((eif_exml_on_processing_instruction_proc) (eiffel_object, (void*) target, (void*) data));
#endif
}

void exml_on_comment (void *eiffel_object, 
                      const XML_Char *data)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_comment_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_comment_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object), (void*) data); }
#endif
#ifdef se
  ((eif_exml_on_comment_proc) (eiffel_object, (void*) data));
#endif
}

void exml_on_start_cdata_section (void *eiffel_object)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_start_cdata_section_tag_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_start_cdata_section_tag_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object)); }
#endif
#ifdef se
  ((eif_exml_on_start_cdata_section_proc) (eiffel_object));
#endif
}

void exml_on_end_cdata_section (void *eiffel_object)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_end_cdata_section_tag_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_end_cdata_section_tag_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object)); }
#endif
#ifdef se
  ((eif_exml_on_end_cdata_section_proc) (eiffel_object));
#endif
}

void exml_on_default (void *eiffel_object, 
                      const XML_Char *data, 
                      int len)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_default_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_default_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object), (void*) data, len); }
#endif
#ifdef se
  ((eif_exml_on_default_proc) (eiffel_object, (void*) data, len));
#endif
}

void exml_on_default_expanded (void *eiffel_object, 
                               const XML_Char *data, 
                               int len)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_default_expanded_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_default_expanded_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object), (void*) data, (int) len); }
#endif
#ifdef se
  ((eif_exml_on_default_expanded_proc) (eiffel_object, (void*) data, (int) len));
#endif
}

void exml_on_start_doctype (void *eiffel_object, 
                            const char *doctypeName, 
                            const char *sysid, 
                            const char *pubid, 
                            int has_internal_subset)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_start_doctype_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_start_doctype_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object), (void*) doctypeName, (void*) sysid, (void*) pubid, has_internal_subset); }
#endif
#ifdef se
  ((eif_exml_on_start_doctype_proc) (eiffel_object, (void*) doctypeName, (void*) sysid, (void*) pubid, has_internal_subset));
#endif
}

void exml_on_end_doctype (void *eiffel_object)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_end_doctype_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_end_doctype_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object)); }
#endif
#ifdef se
  ((eif_exml_on_end_doctype_proc) (eiffel_object));
#endif
}

void exml_on_notation_declaration (void *eiffel_object, const XML_Char *notationName, const XML_Char *base, const XML_Char *systemId, const XML_Char *publicId)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_notation_declaration_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_notation_declaration_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object), (void*) notationName, (void*) base, (void*) systemId, (void*) publicId); }
#endif
#ifdef se
  ((eif_exml_on_notation_declaration_proc) (eiffel_object, (void*) notationName, (void*) base, (void*) systemId, (void*) publicId));
#endif
}

void exml_on_start_namespace_declaration (void *eiffel_object, 
                                          const char *prefix, 
                                          const char *uri)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_start_namespace_declaration_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_start_namespace_declaration_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object), (void*) prefix, (void*) uri); }
#endif
#ifdef se
  ((eif_exml_on_start_namespace_declaration_proc) (eiffel_object, (void*) prefix, (void*) uri));
#endif
}

void exml_on_end_namespace_declaration (void *eiffel_object,
                                        const char *prefix)
{
#ifdef ise
  EIF_PROCEDURE ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_procedure ("on_end_namespace_declaration_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_end_namespace_declaration_procedure not found."); }
  else
    { (ep) (eif_access(eiffel_object), (void*) prefix); }
#endif
#ifdef se
  ((eif_exml_on_end_namespace_declaration_proc) (eiffel_object, (void*) prefix));
#endif
}

int exml_on_not_standalone_handler (void *eiffel_object)
{
#ifdef ise
  EIF_BOOLEAN_FUNCTION ep;               
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_boolean_function ("on_not_standalone_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_not_standalone_procedure not found."); }
  return ((ep) (eif_access(eiffel_object)));
#endif
#ifdef se
  return ((eif_exml_on_not_standalone_proc) (eiffel_object));
#endif
}

int exml_on_external_entity_reference_handler (XML_Parser parser,
                                               const XML_Char *context,
                                               const XML_Char *base,
                                               const XML_Char *systemId,
                                               const XML_Char *publicId)
{
#ifdef ise
  EIF_BOOLEAN_FUNCTION ep;               
	EIF_TYPE_ID tid;
  void *eiffel_object;
  eiffel_object = XML_GetUserData(parser);
	tid = eif_type_id ("EP_EVENT_PARSER");              
	ep = eif_boolean_function ("on_external_entity_reference_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_external_entity_reference_procedure not found."); }
  return ((ep) (eif_access(eiffel_object), (void*) context, (void*) base, (void*) systemId, (void*) publicId));
#endif
#ifdef se
  void *eiffel_object;
  eiffel_object = XML_GetUserData(parser);
  return ((eif_exml_on_external_entity_reference_proc) (eiffel_object, (void*) context, (void*) base, (void*) systemId, (void*) publicId));
#endif
}

int exml_on_unknown_encoding_handler (void *eiffel_object,
                                      const XML_Char *name,
                                      XML_Encoding *info)
{
#ifdef ise
  EIF_BOOLEAN_FUNCTION ep;
	EIF_TYPE_ID tid;
	tid = eif_type_id ("EP_ENCODING_CALLBACK");              
	ep = eif_boolean_function ("on_unknown_encoding_procedure", tid);
  if (ep == 0)
    { eif_panic ("on_unknown_encoding_procedure not found."); }
  return ((ep) (eif_access(eiffel_object), (void*) name, (void*) info));
#endif
#ifdef se
  return ((eif_exml_on_unknown_encoding_proc) (eiffel_object, (void*) name, (void*) info));
#endif
}


void exml_register_XML_SetElementDeclHandler(EIF_POINTER parser)
{
  XML_SetElementDeclHandler(parser, exml_on_element_declaration);
}

void exml_register_XML_SetAttlistDeclHandler(EIF_POINTER parser)
{
  XML_SetAttlistDeclHandler(parser, exml_on_attribute_declaration);
}

void exml_register_XML_SetXmlDeclHandler(EIF_POINTER parser)
{
  XML_SetXmlDeclHandler(parser, exml_on_xml_declaration);
}
void exml_register_XML_SetEntityDeclHandler(EIF_POINTER parser)
{
  XML_SetEntityDeclHandler(parser, exml_on_entity_declaration);
}

void exml_register_XML_SetElementHandler(EIF_POINTER parser)
{
  XML_SetElementHandler(parser, exml_on_start_tag, exml_on_end_tag);
}

void exml_register_XML_SetStartElementHandler(EIF_POINTER parser)
{
  XML_SetStartElementHandler(parser, exml_on_start_tag);
}

void exml_register_XML_SetEndElementHandler(EIF_POINTER parser)
{
  XML_SetEndElementHandler(parser, exml_on_end_tag);
}

void exml_register_XML_SetCharacterDataHandler(EIF_POINTER parser)
{
  XML_SetCharacterDataHandler(parser, exml_on_content);
}

void exml_register_XML_SetProcessingInstructionHandler(EIF_POINTER parser)
{
  XML_SetProcessingInstructionHandler(parser, exml_on_processing_instruction);
}

void exml_register_XML_SetCommentHandler(EIF_POINTER parser)
{
  XML_SetCommentHandler(parser, exml_on_comment);
}

void exml_register_XML_SetCdataSectionHandler(EIF_POINTER parser)
{
  XML_SetCdataSectionHandler(parser, exml_on_start_cdata_section, exml_on_end_cdata_section);
}

void exml_register_XML_SetStartCdataSectionHandler(EIF_POINTER parser)
{
  XML_SetStartCdataSectionHandler(parser, exml_on_start_cdata_section);
}
void exml_register_XML_SetEndCdataSectionHandler(EIF_POINTER parser)
{
  XML_SetEndCdataSectionHandler(parser, exml_on_end_cdata_section);
}

void exml_register_XML_SetDefaultHandler(EIF_POINTER parser)
{
  XML_SetDefaultHandler(parser, exml_on_default);
}

void exml_register_XML_SetDefaultHandlerExpand(EIF_POINTER parser)
{
  XML_SetDefaultHandler(parser, exml_on_default_expanded);
}

void exml_register_XML_SetDoctypeDeclHandler(EIF_POINTER parser)
{
  XML_SetDoctypeDeclHandler(parser, exml_on_start_doctype, exml_on_end_doctype);
}

void exml_register_XML_SetStartDoctypeDeclHandler(EIF_POINTER parser)
{
  XML_SetStartDoctypeDeclHandler(parser, exml_on_start_doctype);
}

void exml_register_XML_SetEndDoctypeDeclHandler(EIF_POINTER parser)
{
  XML_SetEndDoctypeDeclHandler(parser, exml_on_end_doctype);
}

void exml_register_XML_SetNotationDeclHandler(EIF_POINTER parser)
{
  XML_SetNotationDeclHandler(parser, exml_on_notation_declaration);
}

void exml_register_XML_SetNamespaceDeclHandler(EIF_POINTER parser)
{
  XML_SetNamespaceDeclHandler(parser, exml_on_start_namespace_declaration, exml_on_end_namespace_declaration);
}

void exml_register_XML_SetStartNamespaceDeclHandler(EIF_POINTER parser)
{
  XML_SetStartNamespaceDeclHandler(parser, exml_on_start_namespace_declaration);
}
void exml_register_XML_SetEndNamespaceDeclHandler(EIF_POINTER parser)
{
  XML_SetEndNamespaceDeclHandler(parser, exml_on_end_namespace_declaration);
}

void exml_register_XML_SetNotStandaloneHandler(EIF_POINTER parser)
{
  XML_SetNotStandaloneHandler(parser, exml_on_not_standalone_handler);
}

void exml_register_XML_SetExternalEntityRefHandler(EIF_POINTER parser)
{
  XML_SetExternalEntityRefHandler(parser, exml_on_external_entity_reference_handler);
}

void exml_register_XML_SetUnknownEncodingHandler(EIF_POINTER parser, EIF_OBJECT encoding_callback)
{
#ifdef ise
  /* note that encoding_callback will never be weaned!! */
  EIF_OBJECT protected_callback;  
  protected_callback = eif_adopt (encoding_callback);
  XML_SetUnknownEncodingHandler(parser, exml_on_unknown_encoding_handler, protected_callback);
#endif
#ifdef se
  XML_SetUnknownEncodingHandler(parser, exml_on_unknown_encoding_handler, encoding_callback);
#endif
}


/* unregister handlers */

void exml_unregister_XML_SetElementDeclHandler(EIF_POINTER parser)
{
  XML_SetElementDeclHandler(parser, NULL);
}

void exml_unregister_XML_SetAttlistDeclHandler(EIF_POINTER parser)
{
  XML_SetAttlistDeclHandler(parser, NULL);
}

void exml_unregister_XML_SetXmlDeclHandler(EIF_POINTER parser)
{
  XML_SetXmlDeclHandler(parser, NULL);
}
void exml_unregister_XML_SetEntityDeclHandler(EIF_POINTER parser)
{
  XML_SetEntityDeclHandler(parser, NULL);
}

void exml_unregister_XML_SetElementHandler(EIF_POINTER parser)
{
  XML_SetElementHandler(parser, NULL, NULL);
}

void exml_unregister_XML_SetStartElementHandler(EIF_POINTER parser)
{
  XML_SetStartElementHandler(parser, NULL);
}

void exml_unregister_XML_SetEndElementHandler(EIF_POINTER parser)
{
  XML_SetEndElementHandler(parser, NULL);
}

void exml_unregister_XML_SetCharacterDataHandler(EIF_POINTER parser)
{
  XML_SetCharacterDataHandler(parser, NULL);
}

void exml_unregister_XML_SetProcessingInstructionHandler(EIF_POINTER parser)
{
  XML_SetProcessingInstructionHandler(parser, NULL);
}

void exml_unregister_XML_SetCommentHandler(EIF_POINTER parser)
{
  XML_SetCommentHandler(parser, NULL);
}

void exml_unregister_XML_SetCdataSectionHandler(EIF_POINTER parser)
{
  XML_SetCdataSectionHandler(parser, NULL, NULL);
}

void exml_unregister_XML_SetStartCdataSectionHandler(EIF_POINTER parser)
{
  XML_SetStartCdataSectionHandler(parser, NULL);
}
void exml_unregister_XML_SetEndCdataSectionHandler(EIF_POINTER parser)
{
  XML_SetEndCdataSectionHandler(parser, NULL);
}

void exml_unregister_XML_SetDefaultHandler(EIF_POINTER parser)
{
  XML_SetDefaultHandler(parser, NULL);
}

void exml_unregister_XML_SetDefaultHandlerExpand(EIF_POINTER parser)
{
  XML_SetDefaultHandler(parser, NULL);
}

void exml_unregister_XML_SetDoctypeDeclHandler(EIF_POINTER parser)
{
  XML_SetDoctypeDeclHandler(parser, NULL, NULL);
}

void exml_unregister_XML_SetStartDoctypeDeclHandler(EIF_POINTER parser)
{
  XML_SetStartDoctypeDeclHandler(parser, NULL);
}

void exml_unregister_XML_SetEndDoctypeDeclHandler(EIF_POINTER parser)
{
  XML_SetEndDoctypeDeclHandler(parser, NULL);
}

void exml_unregister_XML_SetNotationDeclHandler(EIF_POINTER parser)
{
  XML_SetNotationDeclHandler(parser, NULL);
}

void exml_unregister_XML_SetNamespaceDeclHandler(EIF_POINTER parser)
{
  XML_SetNamespaceDeclHandler(parser, NULL, NULL);
}

void exml_unregister_XML_SetStartNamespaceDeclHandler(EIF_POINTER parser)
{
  XML_SetStartNamespaceDeclHandler(parser, NULL);
}
void exml_unregister_XML_SetEndNamespaceDeclHandler(EIF_POINTER parser)
{
  XML_SetEndNamespaceDeclHandler(parser, NULL);
}

void exml_unregister_XML_SetNotStandaloneHandler(EIF_POINTER parser)
{
  XML_SetNotStandaloneHandler(parser, NULL);
}

void exml_unregister_XML_SetExternalEntityRefHandler(EIF_POINTER parser)
{
  XML_SetExternalEntityRefHandler(parser, NULL);
}

void exml_unregister_XML_SetUnknownEncodingHandler(EIF_POINTER parser, EIF_OBJECT encoding_callback)
{
  XML_SetUnknownEncodingHandler(parser, NULL, NULL);
}
