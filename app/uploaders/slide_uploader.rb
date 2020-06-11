# frozen_string_literal: true

class SlideUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [209, 80]
  end

  version :show do
    process resize_to_fill: [1176, 475]
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  def filename
    "#{model.title.parameterize}.jpg" if original_filename
  end
end
