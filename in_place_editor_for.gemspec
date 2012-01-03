Gem::Specification.new do |s|
  s.name = 'in_place_editor_for'
  s.version = '1.0.0'
  s.author = 'Andrew Coleman'
  s.email = 'developers@consoloservices.com'
  s.summary = 'In Place Editor For'
  s.description = 'Emulates the legacy Rails edit in place feature'
  s.homepage = 'https://redmine.consoloservices.com'
  s.require_path = '.'
  s.files = [ 'in_place_editor_for.rb' ]
  s.add_dependency 'actionpack', '~> 2.3'
end
