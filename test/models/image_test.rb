require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'should be valid' do
    image = Image.new(url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png')
    assert image.valid?
  end
end
