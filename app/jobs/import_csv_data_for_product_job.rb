class ImportCsvDataForProductJob < ApplicationJob
  queue_as :default

  def perform(file_name, user)
    Product.import(file_name, user)
  end
end
