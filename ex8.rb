 def input_students
   puts "Enter the names of the students"
   puts "To finish, just hit return twice"
   students = []
   name = gets.chomp
   while !name.empty? do
     students << {name:name, cohort: :november}
     puts "Now we have #{students.count} students"
     name = gets.chomp
   end
   students
 end

 def print_header
   puts "The students of Villains Academy"
   puts "--------------------"
 end

 def prints(names)
     names.each_with_index do |student, index|
     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
   end
 end

def students_starting_with(students)
  puts "Print students' names starting with letter ..."
  char = gets.chomp
  puts "and shorter then 12 characters"
  students.each_with_index {|student, index|
    if student[:name][0].downcase == char && student[:name].length < 12
      then puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  }
end


def print_footer(names)
  print "Overall, we have #{names.count} great students "
end

 students = input_students
 print_header
 prints(students)
 students_starting_with(students)
 print_footer(students)
 puts
