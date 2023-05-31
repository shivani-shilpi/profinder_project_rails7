require "base64"

class ImageToBase64
  def initialize(image_attrs)
    @path = image_attrs.tempfile.path
    @content_type = image_attrs.content_type
  end   

  def image_to_base64
    File.open(@path, 'rb') do |img|
        base64_image = Base64.strict_encode64(img.read)
        "data:#{@content_type};base64,#{base64_image}"
    end
  end
end