require_relative "../acronymize"

describe("#acronymize") do
  it("returns an empty string when passed an empty string")  do
    result = acronymize("")
    expected = ""
    expect(result).to eq(expected)
  end

  it("returns the acronym on downcased sentences")  do
    result = acronymize("for your information")
    expected = "FYI"
    expect(result).to eq(expected)
  end

  it("returns the acronym on upcased sentences")  do
    result = acronymize("FOR YOUR INFORMATION")
    expected = "FYI"
    expect(result).to eq(expected)
  end
end
