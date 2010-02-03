class Includer
  
  class CLI
    
    def initialize(*argv)
      @input_file, @output_file = argv.first(2)
      fail("includer <input_file> [<output_file>]") if @input_file.nil?
      fail("File not found: #{@input_file}") unless File.exists?(@input_file)
    end
    
    def run
      output = Includer.read(@input_file)
      if @output_file
        File.open(@output_file, "w") { |f| f.write output }
      else
        STDOUT.puts output
      end
    end
    
    private
    
    def fail(message)
      STDOUT.puts(message)
      exit(-1)
    end

  end
  
end