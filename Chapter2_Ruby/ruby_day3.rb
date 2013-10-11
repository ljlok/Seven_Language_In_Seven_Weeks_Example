=begin  
Ruby Day3
csv file:
one,two
lions,tigers
input:
    csv.each{|row| puts row.one}
output:
    "lions"
    
=end
class CsvRow
    def method_missing name,*args
        title = name.to_s
        puts *args.inspect
        #puts YAML::dump(name)
        @csv_contents = []
        filename = self.class.to_s.downcase + '.txt'
        #filename = *args[0]
        file = File.new(filename)
        @headers = file.gets.split(',')
        #key = @headers.select {|i| i == title}
        file.each do |row|
            @csv_contents << row.split(',')
        end
        #(@csv_contents[0])
        puts @headers

    end

    def headers
        @headers
    end

    def csv_contents
        @csv_contents
    end
end

class RubyCsv < CsvRow
end

csv = RubyCsv.new
csv.each {|row| puts row.one}

