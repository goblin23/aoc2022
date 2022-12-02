#!/usr/bin/env ruby

class Rock
    VALUE = 1
end
class Paper
    VALUE = 2
end
class Scissors
    VALUE = 3
end

def evaluate(object1, object2)
    return 3 if object1.class == object2.class
    if object1.instance_of? Rock
        if object2.instance_of? Paper
            return 6
        else
            return 0
        end
    end
    if object1.instance_of? Paper
        if object2.instance_of? Scissors
            return 6
        else
            return 0
        end
    end
    if object1.instance_of? Scissors
        if object2.instance_of? Rock
            return 6
        else
            return 0
        end
    end
end

def objectize(text)
    return Rock.new if text == "A" or text == "X" 
    return Paper.new if text == "B" or text == "Y" 
    return Scissors.new  if text == "C" or text == "Z" 
end


if __FILE__ == $0

    file = File.open "play.txt" 
    lines = file.readlines
    total = 0
    lines.each do |line|
        game = line.split
        player1 = objectize(game[0])
        player2 = objectize(game[1])
        result = evaluate(player1,player2)
        total += result + player2.class::VALUE
    end
    puts total
end
