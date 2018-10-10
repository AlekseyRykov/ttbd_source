require 'date'

def tdate
  Date.today
  puts "\rToday is #{Date.today}"
end

def add_category cetegory_name
  @tasks << [category_name]
end

def show_category
  if @tasks.empty?
    puts 'There are no categories.'
  else
    @tasks.each_with_index { |name, index| puts "#{index+1}. #{name[0]}" }
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
end