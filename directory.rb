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

@students = []

 def input_students
   puts "Enter the names of the students"
   puts "To finish, just hit return twice"
   name = gets.delete("\n")
   while !name.empty? do
     cohort = ""
     while !$cohorts.include?(cohort.capitalize)
        puts "If student is in November cohort, press enter. /n Otherwise enter the month of their cohort."
        cohort = gets.chomp
        if cohort == ""
     	    cohort = "November"
        end
     end
     @students << {name:name, cohort: cohort.to_sym}
     puts "Now we have #{@students.count} students"
     name = gets.chomp
   end
   if @students == []
     exit
   end
   @students
 end


 def print_header
   line_width = 80
   puts "The students of Villains Academy".center(line_width)
   puts "--------------------".center(line_width)
 end

 def print_students_list
  @students =	@students.sort_by { |entry| entry[:cohort]}
 	index = 0
   while index < @students.length do
     puts "#{index + 1}. #{@students[index][:name]} (#{@students[index][:cohort]} cohort)"
     index += 1
    end
 end


def print_footer
  line_width = 80
  if @students.length == 1
    print "Overall, we have 1 great student ".center(line_width)
  else
    print "Overall, we have #{@students.count} great students ".center(line_width)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end


def print_menu
  puts "1. input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process (selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end



interactive_menu
