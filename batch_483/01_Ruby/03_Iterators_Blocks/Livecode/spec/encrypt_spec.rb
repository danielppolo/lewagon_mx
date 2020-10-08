require_relative '../encrypt'

describe "#encrypt" do
  it "returns an empty string when passed an empty string" do
    result = encrypt("")
    expected = ""
    expect(result).to eq(expected) 
  end

  it "returns the 3-letter backward-shifted text"  do
    result = encrypt("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")
    expected = "QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD"
    expect(result).to eq(expected) 
  end
end
