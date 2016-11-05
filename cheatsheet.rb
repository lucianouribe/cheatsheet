@program_open = true
@list = ['cd', 'mkdir', 'touch', 'mv', 'rm', 'cp', 'ls', 'pwd']


# OPTION 1 LIST
def show_command_list
  @list.each do |item|
    print @list.index(item) + 1
    puts ": " + item
  end
  sub_menu
end

# OPTION 1.2 SUBMENU
def sub_menu
  puts "Command Line Options"
  puts "(1)Find (2) Export (3)Add (4)Erase (5)Back"
  sub_menu_pick = gets.strip.downcase
  print ">> "
  case sub_menu_pick
  when '1', 'find'
    search_manuals
  when '2', 'export'
    export_manuals
  when '3', 'add'
    add_new_member_to_the_club
  when '4', 'erase'
    remove
  when '5', 'back'
    menu_options
  else
    puts "Select a valid choice"
    sub_menu
  end
end

# OPTION 1.2.1 FIND
def search_manuals
  puts "Enter the command line you want to check"
  command_to_find = $stdin.gets.strip
  # if @list.include?("command_to_find")
    @list.delete(command_to_find)
    @list << command_to_find
    # puts "Unexistent Command"
    # search_manuals
  print ">> "
  puts `man #{command_to_find}`
  show_command_list
end

# OPTION 1.2.2 EXPORT
def export_manuals
  puts "Enter the command line you want to export"
  command_to_export = $stdin.gets.strip
  print ">> "
  text = `man #{command_to_export}`
  # Creacion del archivo alterno con los resultados
  target = open("#{command_to_export}.txt", 'w') # this is creating the file
  target.write(text)                              # this is actualy writing in the file
  target.close
  # Salida al submenu
  puts "\n\nCommand manual #{command_to_export} succesfully printed\n\n"
  puts "*" * 10
  show_command_list
end

# OPTION 1.2.3 ADD NEW
def add_new_member_to_the_club
  puts "Command line to add: "
  print ">> "
  new_commmand = $stdin.gets.strip
  @list << new_commmand
  puts "\nCommand Line Added! \n\n"
  show_command_list
end

# OPTION 1.2.4 DELETE|REMOVE
def remove
  puts "Command Line to Remove"
  print ">> "
  remove_item = $stdin.gets.strip
  @list.delete(remove_item)
  `rm #{remove_item}.txt`
  puts "\n\nCommand line removed...\n\n"
  show_command_list
end

# OPTION 3 GOODBYE
def exit
  program_open = false
  puts """
  We are so sorry that you're leaving us!
  But this is not a sad goodbye, it's just a hopeful see you later.
  Hope you like our Manuals
  Byeeee!!!!
  """
  @program_open = false
end


# MAIN MENU
def menu_options
  puts "\n--- SUPER COOL, NICE, BEAUTIFUL AND GREAT CHEATSHEET ---\n\n"
  puts "1: Command Line List"
  puts "2: Quick Search Manuals"
  puts "3: Exit"
  puts "\n******* Make a selection! ******* \n\n"
  print ">> "
end

def menu
  menu_options
  choice = $stdin.gets.strip.downcase
  case choice
    when '1', 'command', 'line'
      show_command_list
    when '2', 'search', 'manu', 'quick'
      search_manuals
    when '3', 'quit', 'exit', 'q', 'e'
      exit
    else
    puts "Select a valid choice"
  end
end

# THE WHILE FACTOR EVERYTHING STARTS HERE AND GOES &uarr;&uarr;&uarr;
while @program_open
  menu
end
