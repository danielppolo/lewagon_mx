require_relative '../frequencies'

describe "#frequencies" do
  it 'should return {} if there are no args' do
    results = frequencies()
    expect(results).to eq({})  
  end

  it 'should return the correct count for a string' do
    results = frequencies('the lazy dog jumped over the brown fox')
    expect(results['the']).to eq(2)
    expect(results['lazy']).to eq(1)
    expect(results['cat']).to eq(nil)
  end

  it 'should be case insensitive' do
    results = frequencies('The lazy dog jumped over the brown fox')
    expect(results['the']).to eq(2)
    expect(results['lazy']).to eq(1)
    expect(results['cat']).to eq(nil)
  end
end
