require 'rails_helper'

RSpec.describe 'the movies show' do
  before(:each) do
    @studio_1 = Studio.create(name:'Franks Hot Dogs', location:'Buffalo')
    @studio_2 = Studio.create(name:'Feel Good Inc', location:'LA')
    @studio_3 = Studio.create(name:'Alternate Reality', location:'Mars')
    @movie_1 = @studio_1.movies.create(title:'History of the Hot Dog', creation_year: 1992, genre:'Fiction')
    @movie_2 = @studio_1.movies.create(title:'Return of the Hot Dog', creation_year:1994, genre:'Cult Classic')
    @movie_3 = @studio_3.movies.create(title:'Help, we are stuck', creation_year:2045, genre:'Adam Sandler Comedy')
    @actor_1 = Actor.create(name:'Adam Sandler', age: 102)
    @actor_2 = Actor.create(name:'Hot Diggity', age: 25)
    @actor_3 = Actor.create(name:'Dog', age: 28)
    @movie_1.actors << @actor_2
    @movie_1.actors << @actor_3
    @movie_2.actors << @actor_2
    @movie_2.actors << @actor_3
    @movie_3.actors << @actor_1
  end

  it 'shows the movie name,createion year, genre and all actors in the movie' do
    visit "/movies/#{@movie_1.id}"


    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
    expect(page).to have_content(@actor_2.name)
    expect(page).to have_content(@actor_3.name)
    expect(page).to have_content(@actor_2.age)
    expect(page).to have_content(@actor_3.age)
    save_and_open_page

  end

  it 'shows the average actors age in the movie ' do
    visit "/movies/#{@movie_1.id}"
    expect(page).to have_content(@movie_1.average_actor_age)

  end

end
