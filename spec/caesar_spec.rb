require "../caesar"

describe "the caesar_cipher method" do
  it "processes an empty string" do
    expect(caesar_cipher("", 3)).to eq("")
  end
  
  it "processes lowercase letters" do
    expect(caesar_cipher("bananas",1)).to eq("cbobobt")
  end
  
  it "processes lowercase and uppercase letters" do
    expect(caesar_cipher("BaNaNaS",2)).to eq("DcPcPcU")
  end
  
  it "works with negative numbers" do
    expect(caesar_cipher("cbobobt",-1)).to eq("bananas")
  end
  
  it "works with spaces and punctuation" do
    expect(caesar_cipher("Hello there!", 13)).to eq("Uryyb gurer!")
  end
  
  it "works with numbers greater than 26" do
    expect(caesar_cipher("Uryyb gurer!", 39)).to eq("Hello there!")
  end
end