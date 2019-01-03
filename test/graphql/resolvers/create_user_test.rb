require 'test_helper'

class Resolvers::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateUser.new.call(nil, args, nil)
  end

  test 'creating new user' do
    user = perform(
        name: 'Test user',
        authProvider: {
            email: {
                email: 'email@example.com',
                password: '[omitted]'
            }
        }
    )

    assert user.persisted?
    assert_equal user.name, 'Test user'
    assert_equal user.email, 'email@example.com'
  end
end
