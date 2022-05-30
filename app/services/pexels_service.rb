# frozen_string_literal: true

require 'open-uri'

class PexelsService
  attr_reader :description, :size, :orientation

  def initialize(description = '', size: 0, orientation: '')
    @client = Pexels::Client.new(ENV['PEXEL_API_KEY'])
    @description = description
    @size = size
    @orientation = orientation
  end

  def photos
    @client.photos.search(
      description,
      size: size,
      orientation: orientation
    ).photos
  end

  def photo_src(index = 0, variation: 'original')
    photos[index].src[variation]
  end

  def photo_src_by_photo(photo:, variation: 'original')
    photo.src[variation]
  end

  def photo_path(index = 0, variation: 'original')
    photo_name = image_name(photo_src(index, variation: variation))
    Rails.root.join('public', 'uploads', photo_name).to_s
  end

  def photo_path_by_photo(photo:, variation: 'original')
    photo_name = photo_name_by_photo(photo: photo, variation: variation)
    Rails.root.join('public', 'uploads', photo_name).to_s
  end

  def photo_path_by_src(src)
    photo_name = photo_name_by_src(src)
    Rails.root.join('public', 'uploads', photo_name).to_s
  end

  def upload(image_uri = photo_src)
    URI.parse(image_uri).open do |f|
      download(f, image_name(f.base_uri.to_s))
    end
  end

  def photo_name(index = 0, variation: 'original')
    photo_path(index, variation: variation).split('/').last
  end

  def photo_name_by_photo(photo:, variation: 'original')
    photo_src_by_photo(photo: photo, variation: variation).split('/').last
  end

  def photo_name_by_src(src)
    src.split('/').last
  end

  private

  def download(image, image_name)
    image_path = Rails.root.join('public', 'uploads', image_name)

    File.open(image_path, 'wb') do |f|
      f.write(image.read)
    end
  end

  def image_name(image_uri)
    image_uri.split('/').last
  end
end
