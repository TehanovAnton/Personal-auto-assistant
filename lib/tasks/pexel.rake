# frozen_string_literal: true

require 'pexels'
require './app/services/pexels_service.rb'

namespace :pexel do
  desc 'Tasks under this namespace works with data forom Pexels API'

  task download_few_photos: :environment do |t|  
    pexels_service = PexelsService.new('bmw auto', size: :medium, orientation: :square)

    3.times do |i|
      source = pexels_service.photo_src(i)
      pexels_service.upload(source)
    end
  end

  task :attach_photo_to_random_cars, [:count] => :environment do |t, args|
    args.with_defaults(count: 1) if args.empty?
    pexels_service = PexelsService.new('bmw auto', size: :medium, orientation: :square)
    cars_without_photo = Car.select { |car| !car.photo.attached? }

    if !cars_without_photo.empty?
      args[:count].to_i.times do
        cars_without_photo = Car.select { |car| !car.photo.attached? }
        photo = pexels_service.photos.sample
        pexels_service.upload(pexels_service.photo_src_by_photo(photo: photo))

        photo_path = pexels_service.photo_path_by_photo(photo: photo)
        photo_file = File.open(photo_path)
        photo_name = pexels_service.photo_name_by_photo(photo: photo)
        car = cars_without_photo.sample
        
        car.photo.attach(io: photo_file, filename: photo_name)
      end
    end
  end
end
