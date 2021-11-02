require 'rails_helper'

RSpec.describe 'the shelters index' do
  before(:each) do
    @shelter_1 = shelter.create(name:'Franks Hot Dogs', location:'Buffalo')
    @shelter_2 = shelter.create(name:'Feel Good Inc', location:'LA')
    @shelter_3 = shelter.create(name:'Alternate Reality', location:'Mars')
    @shelter_1.pets.create(title:'History of the Hot Dog', creation_year: 1992, genre:'Fiction')
    @shelter_1.pets.create(title:'Return of the Hot Dog', creation_year:1994, genre:'Cult Classic')
    @shelter_3.pets.create(title:'Help, we are stuck', creation_year:2045, genre:'Adam Sandler Comedy')
  end
