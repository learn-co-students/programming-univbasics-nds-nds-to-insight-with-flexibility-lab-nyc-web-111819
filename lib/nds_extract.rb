# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)

  index = 0
  new_movie_array = []

  while index < movies_collection.count do
    new_movie_array << movie_with_director_name(name, movies_collection[index])
    index += 1
  end

new_movie_array
end


def gross_per_studio(collection)

  index = 0
  studio_sums_hash = {}

# check if something is in there

  while index < collection.count do

    studio = collection[index][:studio]
    worldwide_gross = collection[index][:worldwide_gross]

    if studio_sums_hash[studio]
      studio_sums_hash[studio] += worldwide_gross
    else
      studio_sums_hash[studio] = worldwide_gross
    end
    index += 1
  end

  studio_sums_hash

end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

  index = 0
  new_movie_dir_array = []

  while index < source.count do

    directors_movie_data_hash = source[index]
    director_name = directors_movie_data_hash[:name]
    director_movies = directors_movie_data_hash[:movies]
    new_movie_dir_array << movies_with_director_key(director_name, director_movies)
    index += 1
  end

new_movie_dir_array

end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
