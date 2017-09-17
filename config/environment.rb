# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural(/goodie$/ ,'goodies') # criterion => criteria
  inflect.singular(/goodies$/, 'goodie') # criteria => criterion
end
