class Product < ApplicationRecord
  belongs_to :category
  has_many :product_features

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  attr_accessor :delete_logo
  before_validation { self.logo.clear if self.delete_logo == '1' }
end
