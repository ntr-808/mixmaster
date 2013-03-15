module.exports = class Mixmaster
  @include: (mixins) ->
    for mixin in mixins
      for key, value of mixin.prototype
        @::[key] = value
      this

  @init: (mixins, args...) ->
    for mixin in mixins
      mixin.call this, args...
