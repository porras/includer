require 'spec_helper'

describe Includer do
  
  describe "read" do

    it "should include a file in another" do
      Includer.read(fixture_path("2.txt")).should == "File 2\n\nFile 3\n\n"
    end
    
    it "should include two files in another" do
      Includer.read(fixture_path("4.txt")).should == "File 4\n\nFile 5\n\nFile 6"
    end
    
    it "should include a file in another recursively" do
      Includer.read(fixture_path("1.txt")).should == "File 1\n\nFile 2\n\nFile 3\n\n\n"
    end

    it "should find files in other directories" do
      Includer.read(fixture_path("7.txt")).should == "File 7\n\nFile 1 in dir/\n\n"
    end
    
  end
  
  describe "command line interface" do
    
    before(:each) do
      STDOUT.stub(:puts)
      File.stub(:exists?).and_return(true)
    end
    
    it "should fail if no arguments" do
      Includer.should_not_receive(:read)
      STDOUT.should_receive(:puts).with("includer <input_file> [<output_file>]")
      lambda { Includer::CLI.new.run }.should raise_error(SystemExit)
    end
    
    it "should fail if file not found" do
      File.stub(:exists?).and_return(false)
      Includer.should_not_receive(:read)
      STDOUT.should_receive(:puts).with("File not found: wadus.txt")
      lambda { Includer::CLI.new("wadus.txt").run }.should raise_error(SystemExit)
    end
    
    it "should write to STDOUT if only input file is given" do
      Includer.should_receive(:read).with("input_file").and_return("output content")
      STDOUT.should_receive(:puts).with("output content")
      
      Includer::CLI.new("input_file").run
    end
    
    it "should write to a file if a name is given" do
      output_file = File.join(Dir.tmpdir, "#{rand(999999999)}.txt")
      Includer.should_receive(:read).with("input_file").and_return("output content")
      Includer::CLI.new("input_file", output_file).run
      File.read(output_file).should == "output content"
      File.delete(output_file)
    end
    
  end
    
end
