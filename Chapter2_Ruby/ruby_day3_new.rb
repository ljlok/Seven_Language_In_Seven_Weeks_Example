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
#init csv file
csvContent = <<END_CONTENT_BUFFER.strip().gsub(/^\t*/m,"")
    id,name,age
    2,ss,35
    22,ff,55
END_CONTENT_BUFFER
csvFile = File.new("data.csv","w")
csvFile.puts(csvContent)
csvFile.close()

class CsvParser
    def initialize(filePath)
        @filePath = filePath
        @headers = []
        @rows = []

        readFile(filePath)
    end

    def readFile(filePath)
        @filePath = filePath
        @headers = []
        @rows = []

        csvFile = File.new(@filePath,"r")
        @headers = csvFile.gets().chomp().split(/\s*,\s*/)

        csvFile.each {|rowwData| @rows<<rowwData.chomp().split(/\s*,\s*/)}
        csvFile.close()
    end
    
    def each(&block)
        @rows.each_index{|rowIndex|
            block.call(
                CsvRow.new(
                    rowIndex,
                    rowToHash(@rows[rowIndex])
                )
            )}
    end

    def rowToHash(row)
        rowMap = {}
        @headers.each_index{|i|
            columnName = @headers[i]
            columnValue = row[i]
            rowMap[columnName] = columnValue
        }
        rowMap
    end
end
    

class CsvRow
    def initialize(rowNumber,rowData)
        @rowNumber = rowNumber
        @rowData = rowData
    end

    def method_missing(propertyName,*args)
        if(!@rowData.member?( propertyName.to_s() ))
            raise(
                NoMethodError.new(
                    "undefined method '#{propertyName}' for #{inspect}:#{self.class}"
                )
            )
        end
        @rowData[ propertyName.to_s() ]
    end
end


csv = CsvParser.new("data.csv")
csv.each {|row| puts row.age}

