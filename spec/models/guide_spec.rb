require 'spec_helper'

describe Guide do

  let(:guide) { Guide.new }

  it 'should not be valid without name' do
    guide.should_not be_valid
  end

  it 'should be valid when assigned a name' do
    guide.name = 'Johann Wagner'
    guide.should be_valid
    guide.save.should be_true
  end

  it 'should be assignable to a user' do
    guide.name = 'Lars Gemmel'
    guide.user = Factory.create(:user, email: 'lars.gemmel@museumsdienst-hamburg.de')
    guide.should be_valid
  end

  it 'should not allow guides with the same name' do
    Resource.create(name: 'Fictive user')
    guide1 = Guide.create(name: 'Fictive user')
    guide1.should be_valid
    guide1.save.should be_true

    guide2 = Guide.create(name: 'Fictive user')
    guide2.should_not be_valid
    guide2.errors_on(:name).should include('has already been taken')
  end

end
