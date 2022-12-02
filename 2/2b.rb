#!/usr/bin/env ruby

class Rock
    VALUE = 1
    def X
        return 0 + Scissors::VALUE
    end
    def Y
       return 3 + Rock::VALUE
    end
    def Z
        return 6 + Paper::VALUE
    end
end
class Paper
    VALUE = 2
    def X
        return 0 + Rock::VALUE
    end
    def Y
        return 3 + Paper::VALUE
    end
    def Z
        return 6 + Scissors::VALUE
    end
end
class Scissors
    VALUE = 3
    def X
        return 0 + Paper::VALUE
    end
    def Y
        return 3 + Scissors::VALUE
    end
    def Z
        return 6 + Rock::VALUE
    end
end

def objectize(text)
    return Rock.new if text == "A" 
    return Paper.new if text == "B" 
    return Scissors.new  if text == "C"
end


if __FILE__ == $0

    file = File.open "play.txt" 
    lines = file.readlines
    total = 0
    lines.each do |line|
        game = line.split
        player1 = objectize(game[0])
        result = player1.send(game[1])
        total += result 
    end
    puts total
end
