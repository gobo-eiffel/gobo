class PRINT_EVENT_PARSER

inherit

	XM_EVENT_PARSER
		redefine
			on_xml_declaration,
			on_start_tag,
			on_end_tag,
			on_content,
			on_processing_instruction,
			on_comment
		end

creation

	make_from_implementation

feature

	on_xml_declaration (xml_version, encoding: UC_STRING; standalone: BOOLEAN) is
		do
			print ("xml_decl: version=")
			print (xml_version.out)
			print ("%N")
		end

	on_start_tag (name, ns_prefix: UC_STRING; attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]) is
		local
			cs: DS_BILINEAR_CURSOR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]
		do
			print ("<")
			print (ns_prefix.out)
			print (":")
			print (name.out)
			print (" ")
			from
				cs := attributes.new_cursor
				cs.start
			until
				cs.off
			loop
				print (cs.item.first.second.out)
				print (":")
				print (cs.item.first.first.out)
				print ("=%"")
				print (cs.item.second.out)
				print ("%" ")
				cs.forth
			end
			print (">%N")
		end

	on_end_tag (name, ns_prefix: UC_STRING) is
		do
			print ("</")
			print (ns_prefix.out)
			print (":")
			print (name.out)
			print (">%N")
		end

	on_content (chr_data: UC_STRING) is
		do
			print ("content:")
			print (chr_data.out)
			print ("%N")
		end

	on_processing_instruction (target, data: UC_STRING) is
		do
			print ("pi:")
			print (target.out)
			print (" ->")
			print (data.out)
			print ("%N")
		end

	on_comment (com: UC_STRING) is
		do
			print ("comment:")
			print (com.out)
			print ("%N")
		end

end
