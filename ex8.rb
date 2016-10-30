$cohorts = ["January",
          "February",
          "March",
          "April",
          "May",
          "June",
          "July",
          "August",
          "September",
          "November",
          "October",
          "December"
]

 def input_students
   puts "Enter the names of the students"
   puts "To finish, just hit return twice"
   students = []
   name = gets.chomp
   while !name.empty? do
     cohort = ""
     while !$cohorts.include?(cohort.capitalize)
        puts "If student is in November cohort, press enter. /n Otherwise enter the month of their cohort."
        cohort = gets.chomp
        if cohort == ""
     	    cohort = "November"
        end
     end
     students << {name:name, cohort: cohort.to_sym}
     puts "Now we have #{students.count} students"
     name = gets.chomp
   end
   students
 end

 def print_header
   line_width = 80
   puts "The students of Villains Academy".center(line_width)
   puts "--------------------".center(line_width)
 end

 def prints(names)
  names =	names.sort_by { |entry| entry[:cohort]}
 	index = 0
   while index < names.length do
     puts "#{index + 1}. #{names[index][:name]} (#{names[index][:cohort]} cohort)"
     index += 1
    end
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
  line_width = 80
  if names.length == 1
    print "Overall, we have #{names.count} great student ".center(line_width)
  else
    print "Overall, we have #{names.count} great students ".center(line_width)
  end
end

 students = input_students
 print_header
 prints(students)
# students_starting_with(students)
 print_footer(students)
 puts
