require "./enumerable"

describe Enumerable do
  let(:letters) { ["a", "b", "c", "d", "e"] }
  let(:albums) { { "Fakebook" => 1990, "Painful" => 1993, "Fade" => 2013 } }
  let(:albums_upcase) { ["FAKEBOOK", "PAINFUL", "FADE"] }
  let(:empty_array) { [] }
  
  describe "#my_each" do
    it "returns self" do
      expect(letters.my_each { |i| i.upcase }).to eq(letters)
    end
    
    it "does nothing if array is empty" do
      [].my_each { |i| empty_array << i }
      expect(empty_array).to eq([])
    end
    
    it "loops through an array" do
      letters.my_each { |i| empty_array << i }
      expect(empty_array).to eq(letters)
    end
    
    it "works with hashes" do
      albums.my_each { |k, v| empty_array << k.upcase }
      expect(empty_array).to eq(albums_upcase)
    end
  end

  describe "#my_select" do
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
  
  describe "#my_all?" do
    it "processes an empty array" do
      expect([].my_all? { |i| false }).to eq(true)
    end
    
    it "returns true if block is always true" do
      expect(letters.my_all? { |i| true }).to eq(true)
    end
    
    it "returns false if block is always false" do
      expect(letters.my_all? { |i| false }).to eq(false)
    end
    
    it "returns false if block is false at least once" do
      expect(letters.my_all? { |i| i > "c" }).to eq(false)
    end
    
    it "works with hashes" do
      expect(albums.my_all? { |k, v| v > 1980 }).to eq(true)
    end
  end
  
  describe "#my_count" do
    it "returns 0 given an empty array" do
      expect([].my_count).to eq(0)
    end
    
    it "works with populated arrays" do
      expect(letters.my_count).to eq(5)
    end
    
    it "works with hashes" do
      expect(albums.my_count).to eq(3)
    end
  end
  
  describe "#my_map" do
    it "returns an empty array given an empty array" do
      expect([].my_map).to eq([])
    end
    
    it "functions correctly given a static block" do
      expect(letters.my_map { |i| true }).to eq([true] * 5)
    end
    
    it "functions correctly given a dynamic block" do
      expect(letters.my_map { |i| i.upcase }).to eq(["A", "B", "C", "D", "E"])
    end
    
    it "works with hashes" do
      expect(albums.my_map { |k, v| k.upcase }).to eq(albums_upcase)
    end
    
    it "works with procs" do
      expect(albums.my_map Proc.new { |k, v| k.upcase }).to eq(albums_upcase)
    end
  end
  
  describe "#my_inject" do
    it "works with empty array" do
      expect([].my_inject(3) { |a, b| a+b }).to eq(3)
    end
    
    it "works without initial value" do
      expect([1, 2, 3].my_inject { |a, b| a+b }).to eq(6)
    end
    
    it "works with populated array and initial value" do
      expect([1, 2, 3].my_inject(4) { |a, b| a+b }).to eq(10)
    end
  end
end