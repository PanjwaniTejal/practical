class Product < ApplicationRecord
  require 'csv'
  belongs_to :user

  validates :name, :price, presence: true

  def self.import(file_name, user)
    file_path = File.join("public/import_data", file_name)
    file = File.open(file_path, 'r')

    CSV.foreach(file, headers: true) do |row|
      Product.create!(row.to_h.merge(user_id: user.id))
    end
  end
end
