require("spec_helper")

describe(Brand) do
  describe ('#capitalize_brand_name') do
    it("capitalizes the first letter of each word in the brand name") do
      brand = Brand.create({:brand_name => "new balance", :price => nil})
      expect(brand.brand_name()).to(eq("New Balance"))
    end
  end
end
