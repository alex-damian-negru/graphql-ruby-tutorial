require 'test_helper'

class Resolvers::CreateLinkTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateLink.new.call(nil, args, {})
  end

  test 'creating new link' do
    link = perform(
               url: 'https://example.com',
               description: 'blabla'
    )

    assert link.persisted?
    assert_equal link.url, 'https://example.com'
    assert_equal link.description, 'blabla'
  end
end
