choice = 0
grid = Array.new(5) { Array.new(5) }

for i in 0...5 do
  for j in 0...5 do
    grid[i][j] = 0    
  end
end

def display(grid)
  for i in 0...5 do
    for j in 0...5 do
        print grid[i][j]
        print " "
        print " "
    end
    puts ""
  end
end

def book(grid, m, n, s)
  b = true
  if m > 5 || n > 5 
    puts "Invalid Row / Column. " 
    return
  end
  if m < 1 || n < 1 
    puts "Invalid Row / Column. "
    return
  end
  if 5 - n + 1 < s 
    puts "Seats not available. " 
    return
  end
  for j in (n - 1)...5  do
    if grid[m - 1][j]
      grid[m - 1][j] = 1
    else  
      b = false
    end
  end
  (b) ? (puts "Seats Booked!") : (puts "Seats Cannot be Booked!")
end

while choice.to_i != 3 do
  puts "1. Display"
  puts "2. Book"
  puts "3. Exit"
  
  puts "Enter choice: "
  choice = gets.chomp
  
  case choice.to_i 
    when 1 then display(grid)
    when 2
      puts "Enter row, column: "
      m = gets.chomp
      n = gets.chomp
      puts "Enter number of seats: "
      s = gets.chomp
      book(grid, m.to_i, n.to_i, s.to_i)
    when 3 then puts "Exiting!"
    else
      puts "Unknown choice!"
  end    
end