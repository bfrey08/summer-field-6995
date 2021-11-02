require 'rails_helper'

RSpec.describe 'the studios index' do
  before(:each) do
    @studio_1 = Studio.create(name:'Franks Hot Dogs', location:'Buffalo')
    @studio_2 = Studio.create(name:'Feel Good Inc', location:'LA')
    @studio_3 = Studio.create(name:'Alternate Reality', location:'Mars')
    @movie_1 = @studio_1.movies.create(title:'History of the Hot Dog', creation_year: 1992, genre:'Fiction')
    @movie_2 = @studio_1.movies.create(title:'Return of the Hot Dog', creation_year:1994, genre:'Cult Classic')
    @movie_3 = @studio_3.movies.create(title:'Help, we are stuck', creation_year:2045, genre:'Adam Sandler Comedy')
  end

  it 'shows the studios name and locations' do
    visit "/studios"

    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@studio_2.name)
    expect(page).to have_content(@studio_3.name)
    expect(page).to have_content(@studio_1.location)
    expect(page).to have_content(@studio_2.location)
    expect(page).to have_content(@studio_3.location)

  end

  it 'shows each movie title associated with each studio' do
    visit "/studios"
    save_and_open_page
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_2.title)
    expect(page).to have_content(@movie_3.title)

  end

end
