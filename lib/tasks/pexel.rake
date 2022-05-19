
require 'pexels'

class PexelsService
  attr_reader :description, :size, :orientation

  def initialize(description, size:, orientation:)
    @client = Pexels::Client.new(ENV['PEXEL_API_KEY'])
    @description = description
    @size = size
    @orientation = orientation
  end

  def photos
    @photos ||= @client.photos.search(description, size: size, orientation: orientation).photos
  end

  def photo_src(index = 0, variation: 'original')
    photos[index].src[variation]
  end

  def photo_path(index = 0, variation: 'original')
    photo_name = image_name(photo_src(index, variation: variation))
    Rails.root.join('public', 'uploads', photo_name).to_s
  end

  def upload(image_uri = photo_src)
    URI.open(image_uri) do |f| 
      download(f, image_name(f.base_uri.to_s)) 
    end
  end

  def photo_name
    @photo_name ||= photo_path.split('/').last
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

namespace :pexel do
  desc "TODO"
  task download: :environment do
    pexels_service = PexelsService.new('bmw auto', size: :medium, orientation: :square)

    3.times do |i|
      source = pexels_service.photo_src(i, )
      pexels_service.upload(source)
    end
  end
end
