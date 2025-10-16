# frozen_string_literal: true

require "image_voodoo"
require "image_voodoo/demo/version"

class ImageVoodoo
  module Demo
    def self.output_demo_files(filename)
      ImageVoodoo.with_image(filename) do |img|
        basename = File.basename(filename, ".*")
        img.cropped_thumbnail(100) { |img2| img2.save "#{basename}_cropped_thumb.jpg" }
        img.with_crop(100, 200, 400, 600) { |img2| img2.save "#{basename}_cropped.jpg" }
        img.thumbnail(50) { |img2| img2.save "#{basename}_thumb.jpg" }
        img.resize(100, 150) do |img2|
          img2.save "#{basename}_resized.jpg"
          img2.save "#{basename}_resized.png"
        end
        img.quality(0.75).save("reduced.jpg")
      end
    end
  end
end
