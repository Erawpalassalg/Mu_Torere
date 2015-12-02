#Mu Torere

##How to install

First, you need to install Ruby.

  On OSX : 
  ```
  brew install rbenv ruby-build

  # Add rbenv to bash so that it loads every time you open a terminal
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
  source ~/.bash_profile

  # Install Ruby
  rbenv install 2.2.3
  rbenv global 2.2.3
  ruby -v
  ```
On Linux :

  ```
  sudo apt-get install ruby-full
  ```

Then, install gosu

  ```
  gem install gosu
  ```

Now clone this repo

```
git clone https://github.com/Erawpalassalg/Mu_Torere
```

You're good to go :

```
cd Mu_Torere
ruby mu_torere
```

##How to switch between AI

In mu_torere.rb file, we declare to AI players :

  - Line 52
  - Line 57

- First Param is the Algorithme the AI use.
- Second Param is the Heuristic the AI use.
- Third one is the place they have (being player 'A' or 'B', don't touch that).

You can replace the first two params by anything you want in the following :

```
Algorithms list

  HillClimbing
  MinMax
  AlphaBeta
```
```
Heuristics list

  ComplexHeuristic
  DifferenceAroundEmptySpot
  MaximizeHeterogeneity
  MinimizeHeterogeneity
  MaximizePlays
```

## How to switch between AI and human player

Still in mu_torere.rb file (see below), comment out the AI initialization you want to replace

Line 52 to 56 for example :

```
@ai = AI.new(
      AlphaBeta2,
      MaximizePlays,
      'A'
    )
```
becomes
```
#@ai = AI.new(
#      AlphaBeta2,
#      MaximizePlays,
#      'A'
#    )
```
