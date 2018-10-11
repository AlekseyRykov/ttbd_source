require 'date'

def tdate
  Date.today
  puts "\rToday is #{Date.today}"
end

def add_category category_name
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

@tasks = []

tdate

while true

  puts "\n(T)oday's date."
  puts '-----------------------------'
  puts "(S)how, (A)dd, (D)elete tasks."
  puts '-----------------------------'
  puts "Categories: (1)Add, (2)Show, (3)Delete.\n\n"
  print 'Enter: '

  command = gets.strip.upcase.to_s

  if command == '1'
    print 'Enter category name: '
    category_name = gets.strip
    add_category category_name
  elsif command == '2'
    show_category
  elsif command == '3'
    delete_category
  elsif command == "T"
    tdate
  else
    puts 'Unknown command'
  end

end