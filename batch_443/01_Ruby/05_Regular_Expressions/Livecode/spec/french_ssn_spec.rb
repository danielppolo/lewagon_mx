require_relative '../french_ssn'

describe "#french_ssn_info" do
  it 'should return invalid when SSN is wrong' do
    output = french_ssn_info("123")
    expect(output).to eq("The number is invalid")
  end
  
  it 'should return invalid when no SSN' do
    output = french_ssn_info("")
    expect(output).to eq("The number is invalid")
  end

  it 'should the correct month when correct SSN' do
    output = french_ssn_info("1 84 12 76 451 089 46")
    expect(output).to eq("a man, born in December, 1984 in Seine-Maritime.")
  end
end
