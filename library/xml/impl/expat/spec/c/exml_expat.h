/*
eXML, Eiffel XML Parser Toolkit
Copyright (C) 2001  Andreas Leitner, Berend de Boer and others
See the file forum.txt included in this package for licensing info.

Comments, Questions, Additions to this library? please contact:

Andreas Leitner
Arndtgasse 1/3/5
8010 Graz
Austria
email: andreas.leitner@chello.at
www: http://exml.dhs.org


This header makes the Expat interface available to Eiffel programmers.
This header was  based upon the Expat 1.95.1 header.

*/

#ifndef _EXML_EXPAT_H_
#define _EXML_EXPAT_H_

#include <expat.h>
#include "eiffel.h"


/* enum XML_Content_Type */

EIF_INTEGER exml_xml_ctype_empty();
EIF_INTEGER exml_xml_ctype_any();
EIF_INTEGER exml_xml_ctype_mixed();
EIF_INTEGER exml_xml_ctype_name();
EIF_INTEGER exml_xml_ctype_choice();
EIF_INTEGER exml_xml_ctype_seq();


/* enum XML_Content_Quant */

EIF_INTEGER exml_xml_cquant_none();
EIF_INTEGER exml_xml_cquant_opt();
EIF_INTEGER exml_xml_cquant_rep();
EIF_INTEGER exml_xml_cquant_plus();


/* enum XML_ParamEntityParsing */

EIF_INTEGER exml_xml_param_entity_parsing_never();
EIF_INTEGER exml_xml_param_entity_parsing_unless_standalone();
EIF_INTEGER exml_xml_param_entity_parsing_always();


/* enum XML_Error */

EIF_INTEGER exml_xml_error_none();
EIF_INTEGER exml_xml_error_no_memory();
EIF_INTEGER exml_xml_error_syntax();
EIF_INTEGER exml_xml_error_no_elements();
EIF_INTEGER exml_xml_error_invalid_token();
EIF_INTEGER exml_xml_error_unclosed_token();
EIF_INTEGER exml_xml_error_partial_char();
EIF_INTEGER exml_xml_error_tag_mismatch();
EIF_INTEGER exml_xml_error_duplicate_attribute();
EIF_INTEGER exml_xml_error_junk_after_doc_element();
EIF_INTEGER exml_xml_error_param_entity_ref();
EIF_INTEGER exml_xml_error_undefined_entity();
EIF_INTEGER exml_xml_error_recursive_entity_ref();
EIF_INTEGER exml_xml_error_async_entity();
EIF_INTEGER exml_xml_error_bad_char_ref();
EIF_INTEGER exml_xml_error_binary_entity_ref();
EIF_INTEGER exml_xml_error_attribute_external_entity_ref();
EIF_INTEGER exml_xml_error_misplaced_xml_pi();
EIF_INTEGER exml_xml_error_unknown_encoding();
EIF_INTEGER exml_xml_error_incorrect_encoding();
EIF_INTEGER exml_xml_error_unclosed_cdata_section();
EIF_INTEGER exml_xml_error_external_entity_handling();
EIF_INTEGER exml_xml_error_not_standalone();
EIF_INTEGER exml_xml_error_unexpected_state();


/* struct XML_cp */

EIF_INTEGER exml_xml_cp_size();

EIF_INTEGER exml_xml_cp_type(struct XML_cp *p);
EIF_INTEGER exml_xml_cp_quant(struct XML_cp *p);
EIF_POINTER exml_xml_cp_name(struct XML_cp *p);
EIF_INTEGER exml_xml_cp_numchildren(struct XML_cp *p);
EIF_POINTER exml_xml_cp_children(struct XML_cp *p, EIF_INTEGER index);


/* creating and destroying parsers */

EIF_POINTER exml_XML_ParserCreate(EIF_POINTER encoding);
EIF_POINTER exml_XML_ParserCreateNS(EIF_POINTER encoding, EIF_CHARACTER namespace_separator);
EIF_POINTER exml_XML_ParserCreate_MM(EIF_POINTER encoding, EIF_POINTER memsuite, EIF_POINTER namespace_separator);
EIF_POINTER exml_XML_ExternalEntityParserCreate(EIF_POINTER parser, EIF_POINTER context, EIF_POINTER encoding);
void exml_XML_ParserFree(EIF_POINTER parser);


/* parsing */

EIF_INTEGER exml_XML_Parse(EIF_POINTER parser, EIF_POINTER s, EIF_INTEGER len, EIF_BOOLEAN isFinal);


/* error reporting */

EIF_INTEGER exml_XML_GetErrorCode(EIF_POINTER parser);
EIF_POINTER exml_XML_ErrorString(EIF_INTEGER code);


/* parse state reporting */

EIF_INTEGER exml_XML_GetCurrentLineNumber(EIF_POINTER parser);
EIF_INTEGER exml_XML_GetCurrentColumnNumber(EIF_POINTER parser);
EIF_INTEGER exml_XML_GetCurrentByteIndex(EIF_POINTER parser);


/* various */

void exml_XML_SetExternalEntityRefHandlerArg(EIF_POINTER parser, EIF_POINTER arg);
void exml_XML_SetUserData(EIF_POINTER parser, EIF_OBJECT callback);
EIF_OBJECT exml_XML_GetUserData(EIF_POINTER parser);
EIF_BOOLEAN exml_XML_SetBase(EIF_POINTER parser, EIF_POINTER base);
EIF_POINTER exml_XML_GetBase(EIF_POINTER parser);
EIF_BOOLEAN exml_XML_SetParamEntityParsing(EIF_POINTER parser, EIF_INTEGER parsing);
EIF_POINTER exml_XML_ExpatVersion();


/* register handlers */

void exml_register_XML_SetElementDeclHandler(EIF_POINTER parser);
void exml_register_XML_SetAttlistDeclHandler(EIF_POINTER parser);
void exml_register_XML_SetXmlDeclHandler(EIF_POINTER parser);
void exml_register_XML_SetEntityDeclHandler(EIF_POINTER parser);
void exml_register_XML_SetElementHandler(EIF_POINTER parser);
void exml_register_XML_SetStartElementHandler(EIF_POINTER parser);
void exml_register_XML_SetEndElementHandler(EIF_POINTER parser);
void exml_register_XML_SetCharacterDataHandler(EIF_POINTER parser);
void exml_register_XML_SetProcessingInstructionHandler(EIF_POINTER parser);
void exml_register_XML_SetCommentHandler(EIF_POINTER parser);
void exml_register_XML_SetCdataSectionHandler(EIF_POINTER parser);
void exml_register_XML_SetStartCdataSectionHandler(EIF_POINTER parser);
void exml_register_XML_SetEndCdataSectionHandler(EIF_POINTER parser);
void exml_register_XML_SetDefaultHandler(EIF_POINTER parser);
void exml_register_XML_SetDefaultHandlerExpand(EIF_POINTER parser);
void exml_register_XML_SetDoctypeDeclHandler(EIF_POINTER parser);
void exml_register_XML_SetStartDoctypeDeclHandler(EIF_POINTER parser);
void exml_register_XML_SetEndDoctypeDeclHandler(EIF_POINTER parser);
void exml_register_XML_SetNotationDeclHandler(EIF_POINTER parser);
void exml_register_XML_SetNamespaceDeclHandler(EIF_POINTER parser);
void exml_register_XML_SetStartNamespaceDeclHandler(EIF_POINTER parser);
void exml_register_XML_SetEndNamespaceDeclHandler(EIF_POINTER parser);
void exml_register_XML_SetNotStandaloneHandler(EIF_POINTER parser);
void exml_register_XML_SetExternalEntityRefHandler(EIF_POINTER parser);
void exml_register_XML_SetUnknownEncodingHandler(EIF_POINTER parser, EIF_OBJECT encoding_callback);

/* unregister handlers */

void exml_unregister_XML_SetElementDeclHandler(EIF_POINTER parser);
void exml_unregister_XML_SetAttlistDeclHandler(EIF_POINTER parser);
void exml_unregister_XML_SetXmlDeclHandler(EIF_POINTER parser);
void exml_unregister_XML_SetEntityDeclHandler(EIF_POINTER parser);
void exml_unregister_XML_SetElementHandler(EIF_POINTER parser);
void exml_unregister_XML_SetStartElementHandler(EIF_POINTER parser);
void exml_unregister_XML_SetEndElementHandler(EIF_POINTER parser);
void exml_unregister_XML_SetCharacterDataHandler(EIF_POINTER parser);
void exml_unregister_XML_SetProcessingInstructionHandler(EIF_POINTER parser);
void exml_unregister_XML_SetCommentHandler(EIF_POINTER parser);
void exml_unregister_XML_SetCdataSectionHandler(EIF_POINTER parser);
void exml_unregister_XML_SetStartCdataSectionHandler(EIF_POINTER parser);
void exml_unregister_XML_SetEndCdataSectionHandler(EIF_POINTER parser);
void exml_unregister_XML_SetDefaultHandler(EIF_POINTER parser);
void exml_unregister_XML_SetDefaultHandlerExpand(EIF_POINTER parser);
void exml_unregister_XML_SetDoctypeDeclHandler(EIF_POINTER parser);
void exml_unregister_XML_SetStartDoctypeDeclHandler(EIF_POINTER parser);
void exml_unregister_XML_SetEndDoctypeDeclHandler(EIF_POINTER parser);
void exml_unregister_XML_SetNotationDeclHandler(EIF_POINTER parser);
void exml_unregister_XML_SetNamespaceDeclHandler(EIF_POINTER parser);
void exml_unregister_XML_SetStartNamespaceDeclHandler(EIF_POINTER parser);
void exml_unregister_XML_SetEndNamespaceDeclHandler(EIF_POINTER parser);
void exml_unregister_XML_SetNotStandaloneHandler(EIF_POINTER parser);
void exml_unregister_XML_SetExternalEntityRefHandler(EIF_POINTER parser);
void exml_unregister_XML_SetUnknownEncodingHandler(EIF_POINTER parser, EIF_OBJECT encoding_callback);

#endif /* _EXML_EXPAT_H_ */
