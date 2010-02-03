class Includer
  
  def self.read(file)
    File.read(file).gsub(/\{\{(.+)\}\}/) do |match|
      self.read(File.join(File.dirname(file), $1))
    end
  end

end