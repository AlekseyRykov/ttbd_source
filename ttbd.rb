require 'date'

def tdate
  Date.today
  puts "\rToday is #{Date.today}"
end

def loading
  5.times do
    print "."
    sleep rand(0.01..0.3)
  end
  print "\r"
end

def add_category
  print 'Enter category name: '
  category_name = gets.strip
  @tasks << [category_name]
end

def show_category
  if @tasks.empty?
    puts 'There are no categories.'
  else
    @tasks.each_with_index { |name, index| puts "#{index+1}. #{name[0]}" }
  end
end

def delete_category
  if @tasks.empty?
    puts 'There is nothing to delete.'
  else
    puts 'Which category delete? Choose number: '
    show_category
    category_index = gets.strip.to_i
    @tasks.delete_at(category_index-1)
  end
end

def add_task
  puts 'In which category add task? Choose number:'
  show_category
  print 'Enter: '
  category_index = gets.strip.to_i - 1
  print 'New task: '
  new_task = gets.chomp.capitalize
  print 'Date (00-00-0000): '
  date = gets.strip
  print 'Time (00:00): '
  time = gets.strip
  @tasks[category_index] << { 'task' => new_task, 'date' => date, 'time' => time }
end

def show_task
  if @tasks.empty?
    puts 'There is no tasks.'
  elsif
    @tasks.each_with_index do |name, index|
      array_length = name.length
      if name[1..array_length].empty?
        puts 'There is no tasks.'
      else
        task_number = 1
        puts "#{index+1}. #{name[0]}"
        until task_number == array_length
          puts "#{task_number}. #{name[task_number]['task']} // #{name[task_number]['date']} // #{name[task_number]['time']}"
          task_number += 1
        end
      end
    end
  end
end

def delete_task
  puts 'Choose category number:'
  show_task
  print 'Enter: '
  category_index = gets.strip.to_i - 1
  puts 'Choose task number:'
  task_number = gets.strip.to_i
  @tasks[category_index].delete_at(task_number)
end

puts "\n\"THINGS TO BE DONE\"\n"
loading
tdate

@tasks = []

while true

  puts "\n(T)oday's date."
  puts '-----------------------------'
  puts "(S)how, (A)dd, (D)elete tasks."
  puts '-----------------------------'
  puts "Categories: (1)Add, (2)Show, (3)Delete.\n\n"
  print 'Enter: '

  command = gets.strip.upcase.to_s

  if command == '1'
    add_category
  elsif command == '2'
    show_category
  elsif command == '3'
    delete_category
  elsif command == 'A'
    add_task
  elsif command == 'S'
    show_task
  elsif command == 'D'
    delete_task
  elsif command == "T"
    tdate
  else
    puts 'Unknown command'
  end

end