## how to use

``` ruby
# app/models/favorite.rb

class Favorite < AR::Base
  after_create { |record|
    Proctor.get record
  }
end
```
