require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it {should have_many(:movie_actors)}
    it {should have_many(:actors).through(:movie_actors)}
  end

  it 'can tell the average actor age for a movie' do
    @studio_1 = Studio.create(name:'Franks Hot Dogs', location:'Buffalo')
    @studio_2 = Studio.create(name:'Feel Good Inc', location:'LA')
    @movie_1 = @studio_1.movies.create(title:'History of the Hot Dog', creation_year: 1992, genre:'Fiction')
    @actor_2 = Actor.create(name:'Hot Diggity', age: 25)
    @actor_3 = Actor.create(name:'Dog', age: 28)
    @movie_1.actors << @actor_2
    @movie_1.actors << @actor_3

    expect(@movie_1.average_actor_age).to eq((@actor_2.age + @actor_3.age) / 2.0)

  end
end
