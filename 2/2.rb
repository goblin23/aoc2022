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
    return 3 if object1.instance_of? object2.class
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

if __FILE__ == $0
    file = File.open "~/repos/aoc2022/2/play.txt" 
    lines = file.readlines
    puts lines

end
