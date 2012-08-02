# RouletteWheelSelection

Hash#sample method is implemented with roulette wheel selection algorithm. Probability distribution is given by hash values.


## Installation

Add this line to your application's Gemfile:

    gem 'roulette_wheel_selection'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roulette_wheel_selection

## Usage

Set a hash for probability each keys. Hash#sample method returns random keys by probability distributions.

  > { a: 50, b: 30, c: 20 }.sample
  => :a   # 50%
  => :b   # 30%
  => :c   # 20%


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
