module ActsAsCsv

 class CsvRow
    def initialize(csv, contents)
      @csv = csv
      @contents = contents
    end
    def method_missing(name, *args)
      index = @csv.headers.index name.to_s
      @contents[index]
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ' )
      file.each do |row|
        @csv_contents << CsvRow.new(self, row.chomp.split(', ' ))
      end
    end

    def each(&block)
      csv_contents.each do |row|
        block.call(row)
      end
    end

    attr_accessor :headers, :csv_contents
    
    def initialize
      read
    end
  end

end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each { |row| puts "#{row.name}: #{row.age}" }
