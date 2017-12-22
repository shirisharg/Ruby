choice = 0
grid = Array.new(10) { Array.new(10) { Hash.new } }


def evaluate_expression(grid, i, j)

  expr = grid[i][j][:expression] 
  tokens = expr.split(" ")
  num1 = 0
  num2 = 0

  cell1 = tokens[0].split("")
  op = tokens[1]
  cell2 = tokens[2].split("")

  m1 = cell1[1].to_i
  n1 = cell1[0].ord - 'A'.ord
  m2 = cell2[1].to_i
  n2 = cell2[0].ord - 'A'.ord

  if grid[m1][n1][:type] == "value"
    num1 = grid[m1][n1][:value]
    #puts grid[m1][n1][:value]
  else 
    num1 = evaluate_expression(grid, m1, n1)
  end

  if grid[m2][n2][:type] == "value"
    num2 = grid[m2][n2][:value]
    #puts grid[m2][n2][:value]
  else 
    num2 = evaluate_expression(grid, m2, n2)
  end
  
  case op
    when "+" then return num1 + num2
    when "-" then return num1 - num2 
    when "*" then return num1 * num2
    when "/" then return num1 / num2
  end

end


def display_grid(grid)
  for i in 0...3
    for j in 0...3
      if grid[i][j][:type]
        if grid[i][j][:type] == "value"
          print grid[i][j][:value] 
          print " "
        else 
          print evaluate_expression(grid, i, j)
          print " "
        end
      else
        print "0 "       
      end
    end
    puts ""
  end
end

while choice.to_i != 3 do
  puts "1. Set value"
  puts "2. Set expression"
  puts "3. Exit"
  choice = gets.chomp
  case choice.to_i
  when 1
    puts "Enter expression: "
    expr = gets.chomp
    tokens = expr.split(" ")
    cell = tokens[0].split("")
    m = cell[1].to_i
    n = cell[0].ord - 'A'.ord
    grid[m][n][:type] = "value" 
    grid[m][n][:value] = tokens[2].to_i
    display_grid(grid)
  when 2
    puts "Enter expression: "
    expr = gets.chomp
    tokens = expr.split(" ")
    cell1 = tokens[0].split("")
    m = cell1[1].to_i
    n = cell1[0].ord - 'A'.ord
    grid[m][n][:type] = "expression" 
    grid[m][n][:expression] = tokens[2] << " " << tokens[3] << " " << tokens[4]
    puts grid[m][n][:expression]
    display_grid(grid)
  when 3
    puts "Exiting!!"
  else
    puts "Unkonwn option."
  end
end  
  
  
      
