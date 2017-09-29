require("spec_helper")

describe(Store) do
  describe ('#capitalize_store_name') do
    it("capitalizes the first letter of each word in the store name") do
      store = Store.create({:store_name => "foot locker"})
      expect(store.store_name()).to(eq("Foot Locker"))
    end
  end
end
