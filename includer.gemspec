Gem::Specification.new do |s|
  s.name              = "includer"
  s.version           = "0.1.0"
  s.summary           = "Includes files into another files"
  s.author            = "Sergio Gil Pérez de la Manga"
  s.email             = "sgilperez@gmail.com"
  s.homepage          = "http://github.com/porras/includer"

  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.md)
  s.rdoc_options      = %w(--main README.md)

  s.files             = %w() + Dir.glob("{bin,lib/**/*,README.md}")
  s.executables       = Dir.glob("bin/**").map { |f| File.basename(f) }
  s.require_paths     = ["lib"]
end