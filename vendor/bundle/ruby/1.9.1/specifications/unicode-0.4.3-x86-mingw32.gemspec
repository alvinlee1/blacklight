# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "unicode"
  s.version = "0.4.3"
  s.platform = "x86-mingw32"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yoshida Masato"]
  s.date = "2012-08-07"
  s.description = "Unicode normalization library."
  s.email = "yoshidam@yoshidam.net"
  s.extra_rdoc_files = ["README"]
  s.files = ["README"]
  s.homepage = "http://www.yoshidam.net/Ruby.html#unicode"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Unicode normalization library."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
