require "./enumerable"

describe Enumerable do
  let(:letters) { ["a", "b", "c", "d", "e"] }
  let(:albums) { { "Fakebook" => 1990, "Painful" => 1993, "Fade" => 2013 } }

  describe "the my_select method" do
    
    it "processes an empty array" do
      expect([].my_select { |i| true }).to eq([])
    end
    
    it "does nothing if block is always true" do
      expect(letters.my_select { |i| true }).to eq(letters)
    end
    
    it "returns empty array if block is always false" do
      expect(letters.my_select { |i| false }).to eq([])
    end
    
    it "returns a subarray of elements that meet the condition" do
      expect(letters.my_select { |i| i < "c" }).to eq(["a", "b"])
    end
    
    it "works on hashes" do
      expect(albums.my_select { |k, v| v > 2000 }).to eq([["Fade", 2013]])
    end
  end
end