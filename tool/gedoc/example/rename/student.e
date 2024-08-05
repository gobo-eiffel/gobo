class STUDENT
inherit PERSON

feature {ANY}
   get_student_addr():STRING  is do Result := get_addr() end  -- assign dorm semantics to addr
   set_student_addr(a:STRING) is do set_addr(a) end

   take_rest() is
     do
       io.put_string(name + " take_rest in the: " + get_student_addr() + "%N");
     end
end
