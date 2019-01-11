require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'should be valid' do
    image = Image.new(url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png')
    assert_predicate(image, :valid?)
  end

  test 'url validation should check for presence' do
    image = Image.new(url: '')
    assert_not_predicate(image, :valid?)
  end

  test 'url validation should check for valid formatting' do
    image = Image.new(url: 'googlecom/image')
    assert_not_predicate(image, :valid?)
  end
end
