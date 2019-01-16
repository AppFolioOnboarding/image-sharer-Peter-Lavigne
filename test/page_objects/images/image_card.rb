module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      def url
        node.find('img')[:src]
      end

      def tags
        node.all('.tag').map(&:text)
      end

      def click_tag!(tag_name)
        node.click_link(tag_name)
        window.change_to(IndexPage)
      end
    end
  end
end
