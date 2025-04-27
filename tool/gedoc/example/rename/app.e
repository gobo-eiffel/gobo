-- to build with SmartEiffel: compile  app.e -o app
class APP inherit INTERNAL

create {ANY}
   make

feature {ANY}
   ra: RESEARCH_ASSISTANT
   p:  PERSON
   s:  STUDENT
   f:  FACULTY

   -- problematic implementation: direct field access
   print_student_addr_direct_field(u: STUDENT) is
      do io.put_string(u.name + " as STUDENT.addr: " + u.addr + "%N") end
   print_faculty_addr_direct_field(u: FACULTY) is
      do io.put_string(u.name + " as FACULTY.addr: " + u.addr + "%N") end

   -- correct implementation: use semantic assigning accessor
   print_student_addr_via_accessor(u: STUDENT) is
      do io.put_string(u.name + " as STUDENT.addr: " + u.get_student_addr() + "%N") end
   print_faculty_addr_via_accessor(u: FACULTY) is
      do io.put_string(u.name + " as FACULTY.addr: " + u.get_faculty_addr() + "%N") end

   make is
      do
	 create  p.default_create
	 create  s.default_create
	 create  f.default_create
	 create ra.make

	 ra.print_ra()
	 io.put_string("PERSON  size: " +physical_size(p ).out+ "%N")
	 io.put_string("STUDENT size: " +physical_size(s ).out+ "%N")
	 io.put_string("FACULTY size: " +physical_size(f ).out+ "%N")
	 io.put_string("RESEARCH_ASSISTANT size: " +physical_size(ra).out+ "%N")

	 ra.do_benchwork()  -- which addr field will this calls access?
	 ra.take_rest()     -- which addr field will this calls access?

	 io.put_string("-- print_student|faculty_addr_direct_field%N")
	 print_student_addr_direct_field(ra)
	 print_faculty_addr_direct_field(ra)

	 io.put_string("-- print_student|faculty_addr_via_accessor%N")
	 print_student_addr_via_accessor(ra)
	 print_faculty_addr_via_accessor(ra)

	 io.put_string("-- check reference identity%N")
  	 if                  ra.addr  = ra.faculty_addr
	 then io.put_string("ra.addr  = ra.faculty_addr%N")
         else io.put_string("ra.addr != ra.faculty_addr%N") end

  	 if                  ra.addr  = ra.student_addr
	 then io.put_string("ra.addr  = ra.student_addr%N")
         else io.put_string("ra.addr != ra.student_addr%N") end

  	 if                  ra.student_addr  = ra.faculty_addr
	 then io.put_string("ra.student_addr  = ra.faculty_addr%N")
         else io.put_string("ra.student_addr != ra.faculty_addr%N") end

	 io.put_string("-- test some assignment: suppose ra moved both lab2 and dorm2%N")
	 ra.set_faculty_addr("lab2")
	 ra.print_ra()
	 ra.set_student_addr("dorm2")
	 ra.print_ra()
      end
end
