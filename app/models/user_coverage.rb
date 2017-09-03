class UserCoverage
  include Mongoid::Document
  store_in collection: 'userCoverage'
  field :fft, type: Float
  field :graphs, type: Float
  field :implementation, type: Float
  field :matrices, type: Float
  field :dsu, type: Float
  field :math, type: Float
  field :handle, type: String
  field :combinatorics, type: Float
  field :trees, type: Float
  field :greedy, type: Float
  field :schedules, type: Float
  field :flows, type: Float
  field :sortings, type: Float
  field :dp, type: Float
  field :hashing, type: Float
  field :bitmasks, type: Float
  field :geometry, type: Float
  field :probabilities, type: Float
  field :games, type: Float
  field :strings, type: Float
  field :shortest_paths, type: Float
  field :constructive_algorithms, type: Float
  field :divide_and_conquer, type: Float
  field :dfs_and_similar, type: Float
  field :graph_matchings, type: Float
  field :string_suffix_structures, type: Float
  field :two_sat, type: Float
  field :meet_in_the_middle, type: Float
  field :data_structures, type: Float
  field :expression_parsing, type: Float
  field :number_theory, type: Float
  field :brute_force, type: Float
  field :ternary_search, type: Float
  field :binary_search, type: Float
  field :chinese_remainder_theorem, type: Float
  field :two_pointers, type: Float
end
