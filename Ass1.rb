input = gets.chomp

total = 0
n = 0
negative = false

chars = input.split('')
l = chars.length
i = 0

while i < l do
  num = 0
  if chars[i] == "-"
    i += 1
    while chars[i].to_i != 0 do
      i += 1
    end
  else
    while chars[i].to_i != 0 do
      num = num * 10 + chars[i].to_i
      i += 1
    end
  end
  total += num
  n += 1 if num != 0
  i += 1
end


puts "#{total}  #{n}"