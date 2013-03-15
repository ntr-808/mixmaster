Mixmaster = require './mixmaster'

# You can inherit from multiple basic classes:
class German 
  constructor: (worldNews) ->
    console.log 'Good times in Germany today.'
    worldNews.germany = 'good news'

  german: -> console.log 'Guten tag.'
  greeting: -> console.log 'Hallo.'

class Japanese
  constructor: (worldNews, weather) ->
    console.log 'Hard times in Japan today...'
    console.log "...but the weather was #{weather}."
    worldNews.japan = 'bad news'

  japanese: -> console.log 'こんにちは'

# You can override methods found in other inherited clases
# by adding the class later in the mixin array.
# You can also inherit from other Mixmaster classes:
class LinguistJargon
  writePaper: -> console.log 'My paper is on ...jargon jargon...'

class English extends Mixmaster
  mixins = [LinguistJargon]
  @include mixins

  greeting: -> console.log "Hi!"

# Add it all together...
class Translator extends Mixmaster
  mixins = [
    German
    Japanese
    English
  ]
  @include mixins

  # If you want to add optional arguments that your parent classes need
  # you will need to add the args splat and pass them through to Mixmaster's
  # init function so it will give them to the constructors.
  constructor: (worldNews, args...) ->
    Mixmaster.init mixins, worldNews, args...

# Instantiate as normal!
#
worldNews = {}
weather = 'great'
linguist = new Translator worldNews, weather


linguist.german() # Guten Tag
linguist.japanese() # こんにちは
linguist.writePaper() # My paper is on ...jargon jargon...
linguist.greeting() # Hi!
console.log worldNews # { germany: 'good news', japan: 'bad news' }