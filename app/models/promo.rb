class Promo < ApplicationRecord
  has_attached_file :banner, styles: { medium: "300x300>" }
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/
  attr_accessor :delete_banner
  before_validation { self.banner.clear if self.delete_banner == '1' }
end
