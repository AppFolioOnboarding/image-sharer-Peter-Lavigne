require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should render landing page' do
    get root_path
    assert_response :ok
  end

  test 'should get new' do
    get new_image_path
    assert_response :ok
  end

  test 'should show image' do
    get image_path(Image.first)
    assert_response :ok
  end

  test 'should show index' do
    get images_path
    assert_response :ok
  end

  test 'should create an image' do
    assert_difference 'Image.count' do
      post images_path, params: { image: {
        url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png'
      } }
    end
  end

  test 'should be an image on the landing page' do
    get root_path
    assert_select 'img', count: 1
  end
end
