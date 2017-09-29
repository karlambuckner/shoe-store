class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
  validates :store_name, :presence => true
  before_save :capitalize_store_name

  private

  def capitalize_store_name
  self.store_name=(store_name.split.map(&:capitalize).join(' '))
  end
end
