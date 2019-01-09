require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should render landing page' do
    get root_url
    assert_response :ok
  end
end
