# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

#Get rid of field with error that ruby creates when error message pops up
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance |
  html_tag.html_safe
end
