require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should render landing page' do
    get root_url
    assert_response :ok
  end

  test 'should get new' do
    get new_image_path
    assert_response :ok
  end

  test 'should create an image' do
    assert_difference 'Image.count' do
      post images_path, params: { image: {
        url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png'
      } }
    end
  end
end
