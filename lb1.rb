# exercise 1
#
name = nil
lastname = nil
age = nil


def hello(name,lastname,age)
  if age < 18
    puts "Привет, #{name} #{lastname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else
    puts "Привет, #{name} #{lastname}. Самое время заняться делом!"
  end
end

print "Name? "
name = gets
print "Lastname? "
lastname = gets
print "Age? "
age = gets.to_i

hello(name,lastname,age)



# exercise 2

a = nil
b = nil

def number(a,b)
  if a==20 or b==20
    puts 20
  else
    puts a+b
  end
end

print "Number a: "
a = gets.to_i
print "Number b: "
b = gets.to_i

number(a,b)
