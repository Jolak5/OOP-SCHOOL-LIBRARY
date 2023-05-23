# File.open("employee.txt", "r") do |file|

#     # puts file.read()
#     # # puts file.readline()
#     # puts file.readchar()
#     # file.readlines()[2]
#     # for line in file.readlines()
#     #     puts line
#     # end
# end

# file = File.open("employee.txt", "r")

# file.close()

# File.open("employee.txt", "a") do |file|
#     file.write("\nOscar, Accounting")

# end
# File.open("employee.txt", "w") do |file|
#     file.write("\nOscar, Accounting")

# end
File.write('index.html', '<h1>Hello</h1>')

# read and write

File.open('employee.txt', 'r+') do |file|
  file.readchar
  file.write('W')
end
