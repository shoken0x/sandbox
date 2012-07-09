for num in 1..4  
    Thread.start(0) do |s|  
        n = s  
        while n < 100000000  
            n = n + 1  
        end  
    end  
end  
Thread.list.each do |s|  
    if Thread.current != s  
        s.join  
    end  
end  
