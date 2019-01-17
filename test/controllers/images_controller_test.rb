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
        url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png',
        image_tags: 'logo, appfolio'
      } }
    end
  end

  test 'should be an image on the landing page' do
    get root_path
    assert_select 'img', count: 4
  end

  test 'index should display in reverse order' do
    get root_path
    assert_select 'img' do |images|
      assert_equal 'https://picsum.photos/300/200/?image=101', images.first.attribute('src').value
      assert_equal 'https://picsum.photos/300/200/?image=1', images.last.attribute('src').value
    end
  end

  test 'should create an image without tags' do
    assert_difference 'Image.count' do
      post images_path, params: { image: {
        url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png'
      } }
    end
  end

  test 'show displays tags' do
    @image_with_tags = Image.create(
      url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png',
      tag_list: 'sun, fun, run'
    )
    get image_path(@image_with_tags)
    assert_select 'li', 'sun'
    assert_select 'li', 'fun'
    assert_select 'li', 'run'
  end

  test 'index allows searching by tag' do
    get images_path, params: { tag: 'rustic' }
    assert_select 'img' do |images|
      assert_equal 2, images.size
      assert_equal 'https://picsum.photos/300/200/?image=101', images[0].attribute('src').value
      assert_equal 'https://picsum.photos/300/200/?image=99', images[1].attribute('src').value
    end
  end

  test 'index page shows alert if no images have a specified tag' do
    get images_path, params: { tag: 'sky' }
    assert_select 'div.alert', 'No images tagged with sky'
  end

  test 'show page provides links to searching by tag' do
    get image_path(images(:rustic2))
    assert_select '.tag', count: 2
    assert_select 'a', count: 4
  end

  test 'successfully delete an image' do
    image = Image.create!(url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png')
    assert_difference 'Image.count', -1 do
      delete image_path(image.id)
    end
    assert_redirected_to images_path
    assert_not Image.exists?(image.id)
    follow_redirect!
    assert_select '.alert-success', 'You have successfully deleted the image.'
  end

  test 'deleting an image that does not exist succeeds' do
    assert_no_difference 'Image.count' do
      delete image_path(-1)
    end
    assert_redirected_to images_path
    follow_redirect!
    assert_select '.alert-success', 'You have successfully deleted the image.'
  end
end
