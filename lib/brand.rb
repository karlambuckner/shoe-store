class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand_name, :presence => true)
  before_save(:capitalize_brand_name)

  private

  def capitalize_brand_name
  self.brand_name=(brand_name.split.map(&:capitalize).join(' '))
  end
end
