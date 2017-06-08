require 'test_helper'

class UserTest < ActiveSupport::TestCase
  users = User.all
  
  test '#display_name when admin' do
    users.each do |user|
      if user.admin
        assert_equal user.name + ' (admin)', user.display_name
      end
    end
  end
  
  test '#display_name when not admin' do
    users.each do |user|
      if !user.admin
        assert_equal user.name, user.display_name
      end
    end
  end

  test '#validation of the user model' do
    user = User.new(name: 'greg', password: '1234567', email: 'greg@none.com')

    assert user.invalid?, 'user not valid: ' + user.name
    assert_equal [:password], user.errors.keys
  end

end
