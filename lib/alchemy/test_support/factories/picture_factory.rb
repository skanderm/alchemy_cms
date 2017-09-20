require 'factory_girl'

FactoryGirl.define do
  factory :alchemy_picture, class: 'Alchemy::Picture' do
    image_file File.new(Alchemy::Engine.root.join('lib', 'alchemy', 'test_support', 'fixtures', 'image.png'))
    name 'image'
    image_file_name 'image.png'
    upload_hash Time.current.hash
  end
end
