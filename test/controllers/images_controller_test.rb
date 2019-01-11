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
    assert_select 'img', count: 2
  end

  test 'index should display in reverse order' do
    get root_path
    assert_select 'img' do |images|
      assert_equal 'https://picsum.photos/300/200/?image=2', images[0].attribute('src').value
      assert_equal 'https://picsum.photos/300/200/?image=1', images[1].attribute('src').value
    end
  end
end
