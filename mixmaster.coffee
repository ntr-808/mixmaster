module.exports = class Mixmaster
  @include: (mixins) ->
    for mixin in mixins
      for key, value of mixin.prototype
        if @::[key]?
          if key in ['constructor']
            # console.log 'Not overwriting reserved property:', key
            continue
          # console.log "Overwriting #{key}..."
        @::[key] = value
      this

  @construct: (object, mixins, args...) ->
    for mixin in mixins
      mixin.call object, args...