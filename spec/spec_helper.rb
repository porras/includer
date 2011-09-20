require 'rubygems'
require File.join(File.dirname(__FILE__), '..', 'lib', 'includer')
require 'tmpdir'

def fixture_path(file)
  File.join(File.dirname(__FILE__), 'fixtures', file)
end
