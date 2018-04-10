
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qna_maker/version'

Gem::Specification.new do |spec|
  spec.name          = 'qna_maker'
  spec.version       = QnAMaker::VERSION
  spec.authors       = ['Birdie0']
  spec.email         = ['Birdie0@users.noreply.github.com']

  spec.summary       = 'API wrapper for https://qnamaker.ai'
  spec.description   = 'API wrapper that allows to use QnA Maker with your application'
  spec.homepage      = 'https://github.com/Birdie0/qna_maker'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'htmlentities', '~> 4.3', '>= 4.3.4'
  spec.add_dependency 'http', '~> 3.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry', '~> 0.11.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
