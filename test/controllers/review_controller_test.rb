require 'test_helper'

class ReviewControllerTest < ActionDispatch::IntegrationTest
  user = User.new email: 'john@example.com', password: '12345678'
  user.skip_confirmation!
  user.save!

  log_in( user )
end
