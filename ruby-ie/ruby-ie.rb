$pattern = /([^c]|^)ei/

def is_valid(s)
    !($pattern === s)
end

path = ARGV[0]
File.readlines(path).each do |line|
    if !is_valid(line)
        puts line
    end
end
