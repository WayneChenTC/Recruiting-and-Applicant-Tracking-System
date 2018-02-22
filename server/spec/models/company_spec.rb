require 'rails_helper'

# ------------------------------------------------------------------------------
# Tests getting fields from a Company Model
# ------------------------------------------------------------------------------
describe Company, '#name' do

  it 'returns one item, the name of the company ' do

    #Setup for testing
    company = Company.new(name: 'RobCo')

    #expect
    expect(company.name).to eq 'RobCo'
  end

end

describe Company, '#website' do

  it 'returns one item, the website of the company ' do

    #Setup for testing
    company = Company.new(website: 'RobCo')

    #expect
    expect(company.website).to eq 'RobCo'
  end

end

describe Company, '#headquarters' do

  it 'returns one item, the headquarters of the company ' do
    #Setup for testing
    company = Company.new( headquarters: 'Raleigh, NC' )

    #expect
    expect( company.headquarters ).to eq 'Raleigh, NC'
  end
end

describe Company, '#size' do

  it 'returns one item, the size of the company ' do
    #Setup for testing
    company = Company.new( size: '1-50' )

    #expect
    expect( company.size ).to eq '1-50'
  end
end

describe Company, '#founded' do

  it 'returns one item, the year the company was founded ' do
    #Setup for testing
    company = Company.new( founded: '1945' )

    #expect
    expect(company.founded).to eq '1945'
  end

end

describe Company, '#industry' do

  it 'returns one item, the industry the company is in ' do
    #Setup for testing
    company = Company.new( industry: 'Computer Manufacturer')

    #expect
    expect(company.industry).to eq 'Computer Manufacturer'
  end
end

describe Company, '#synopsis' do

  it 'returns one item, the synopsis of the company ' do
    #Setup for testing
    company = Company.new( synopsis: 'A great company to work for! ...')

    #expect
    expect(company.synopsis).to eq 'A great company to work for! ...'
  end
end
# ------------------------------------------------------------------------------
# End section
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Test Company validation
# ------------------------------------------------------------------------------
describe Company, 'Validation' do
  it 'is valid with valid attributes' do
    expect( Company.new( name: 'RobCo', website: 'www.robs.com',
                         headquarters: 'Raleigh, NC', size: '1-50',
                         founded: '1997', industry: 'Computer Manufacturer',
                         synopsis: 'test synopsis') ).to be_valid
  end

  it 'is not valid without a name' do
    expect( Company.new( name: nil, website: 'www.robs.com',
                         headquarters: 'Raleigh, NC', size: '1-50',
                         founded: '1997', industry: 'Computer Manufacturer',
                         synopsis: 'test synopsis') ).to_not be_valid
  end

  it 'is not valid without a website' do
    expect( Company.new( name: 'RobCo', website: nil,
                         headquarters: 'Raleigh, NC', size: '1-50',
                         founded: '1997', industry: 'Computer Manufacturer',
                         synopsis: 'test synopsis') ).to_not be_valid
  end

  it 'is not valid without a valid website URL' do
    expect( Company.new( name: 'RobCo', website: 'testarrest',
                         headquarters: 'Raleigh, NC', size: '1-50',
                         founded: '1997', industry: 'Computer Manufacturer',
                         synopsis: 'test synopsis') ).to_not be_valid
  end

  it 'is not valid without a headquarters' do
    expect( Company.new( name: 'RobCo', website: 'www.robs.com',
                         headquarters: nil, size: '1-50',
                         founded: '1997', industry: 'Computer Manufacturer',
                         synopsis: 'test synopsis') ).to_not be_valid
  end

  it 'is not valid without a size' do
    expect( Company.new( name: 'RobCo', website: 'www.robs.com',
                         headquarters: 'Raleigh, NC', size: nil,
                         founded: '1997', industry: 'Computer Manufacturer',
                         synopsis: 'test synopsis') ).to_not be_valid
  end

  it 'is not valid without a founded year' do
    expect( Company.new( name: 'RobCo', website: 'www.robs.com',
                         headquarters: 'Raleigh, NC', size: '1-50',
                         founded: nil, industry: 'Computer Manufacturer',
                         synopsis: 'test synopsis') ).to_not be_valid
  end

  it 'is not valid without a valid founding year' do
    expect( Company.new( name: 'RobCo', website: 'www.robs.com',
                         headquarters: 'Raleigh, NC', size: '1-50',
                         founded: 'test', industry: 'Computer Manufacturer',
                         synopsis: 'test synopsis') ).to_not be_valid
  end

  it 'is not valid without an industry' do
    expect( Company.new( name: 'RobCo', website: 'www.robs.com',
                         headquarters: 'Raleigh, NC', size: '1-50',
                         founded: '1997', industry: nil,
                         synopsis: 'test synopsis') ).to_not be_valid
  end

  it 'is not valid without a synopsis' do
    expect( Company.new( name: 'RobCo', website: 'www.robs.com',
                         headquarters: 'Raleigh, NC', size: '1-50',
                         founded: '1997', industry: 'Computer Manufacturer',
                         synopsis: nil) ).to_not be_valid
  end
end
# ------------------------------------------------------------------------------
# End Section
# ------------------------------------------------------------------------------
