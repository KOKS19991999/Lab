def deposit(num)
  if num > 0
    $start += num
    File.open('balance.txt','w'){|f| f.write $start}
  else return 'Error deposit less than 0!'
  end
  balance
end

def withdraw(num)
  if (num > 0 && num <= $start.to_i)
    $start -= num
    File.open('balance.txt','w'){|f| f.write $start}
  else return 'Mistake. The amount must be equal to or less than the balance!'
  end
  balance
end

def balance
  if File.file?('balance.txt') && !File.zero?('balance.txt')
    file = File.open('balance.txt')
    $start = file.read.to_i
    file.close
  else
    puts 'File empty'
    $start = 100
  end
  "Select operation action: /deposit /withdraw /balance /quit \n Your balance: #{$start}"
end

def quit
  "Bye"
end

def web
  require 'socket'
  server = TCPServer.open(3000)
  while true
    res = "HTTP/1.1 300 OK"
    client = server.accept
    response = client.gets
    method, uri = response.split(" ")
    if method == "GET"
      uri, num = uri.split("?")
      if uri == "/balance"
        res = "#{res}\n\n#{balance}"
      elsif uri == "/withdraw"
        res = "#{res}\n\n#{withdraw(num.to_i)}"
      elsif uri == "/deposit"
        res = "#{res}\n\n#{deposit(num.to_i)}"
      elsif uri == "/quit"
        res = "#{res}\n\n#{quit}"
        client.print res
        client.close()
        break
      else
        res = "HTTP/1.1 404\n\nError 404"
      end
    end
    client.print res
    client.close()
  end
end

web
