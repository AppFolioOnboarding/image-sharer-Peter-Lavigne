module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image

      def image_url
        node.find('img')['src']
      end

      def tags
        node.all('.tag').map(&:text)
      end

      def delete
        node.click_on('Delete Image')
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        delete(&:accept)
        window.change_to(IndexPage)
      end

      def go_back_to_index!
        node.click_link('Image Saver')
        window.change_to(IndexPage)
      end
    end
  end
end
