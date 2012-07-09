thread = []

def rand_str(digits)
  charset = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  Array.new(digits){charset[rand(charset.size)]}.join
end

str_a =[]

thread << Thread.start {
 (0..1000).each { |i|
    str_a[i] = rand_str(1024)
    puts i
  }
}

thread << Thread.start {
 (1001..2000).each { |i|
    str_a[i] = rand_str(1024)
    puts i
  }
}

# 作成したスレッドを終了するまで実行させる
thread.each {|t|
    t.join
}
