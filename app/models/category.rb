class Category < ApplicationRecord
  has_many :category
  acts_as_nested_set
  rails_admin do

    nested_set({
                   max_depth: 3,
                   toggle_fields: [:enabled],
                   thumbnail_fields: [:logo],
                   thumbnail_size: :thumb,
                   thumbnail_gem: :paperclip,
               })
    edit do
      exclude_fields :id, :lft, :rgt, :children, :depth, :children_count
    end
  end

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  attr_accessor :delete_logo
  before_validation { self.logo.clear if self.delete_logo == '1' }

  def to_param
    "#{id}-#{Russian.translit(name).mb_chars.downcase.gsub(/[^0-9а-яa-z]+/, ' ').strip.gsub(' ', '-').to_s}"
  end

end
