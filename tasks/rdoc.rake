# frozen_string_literal: true

require "rdoc/task"

RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.markup = "tomdoc"
  rdoc.options << "--encoding=UTF-8"
  rdoc.rdoc_dir = "doc"
  rdoc.rdoc_files.exclude("vendor", "tmp")
  rdoc.rdoc_files.include("README.md", "lib", "*.rb")
  rdoc.title = "Documentation"
end
