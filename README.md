# Mixmaster

v0.1.0

A class for faking multiple inheritance in Coffeescript using mixins.
Mixmaster also provides a function (init) for running the constructors of all your
mixin classes.


To make a Mixmastered class:

    class Translator extends Mixmaster
      mixins = [
        German
        Japanese
        English
      ]
      @include mixins

      constructor: ->
        Mixmaster.init mixins

    linguist = new Translator

That's it!

The mixin classes and the results are below.

You can inherit from basic classes.

    class German 
      constructor: (worldNews) ->
        worldNews.germany = 'good news'

      german: -> console.log 'Guten tag.'
      greeting: -> console.log 'Hallo.'


You can see `Mixmaster.init` is called above with an `args...` splat.
This is so your parent classes will receive any extra parameters they might need:

    class Japanese
      constructor: (worldNews, weather) ->
        worldNews.japan = {
          news: 'bad news'
          weather: weather
        }

      japanese: -> console.log 'こんにちは'

You can override methods found in other inherited clases
by adding the class later in the mixin array.
As long as you are running `Mixmaster.init` in your constructors you can also inherit from other Mixmaster classes:

    class LinguistJargon
      writePaper: -> console.log 'My paper is on ...jargon jargon...'

    class English extends Mixmaster
      mixins = [LinguistJargon]
      @include mixins

      greeting: -> console.log "Hi!"

Instantiate as normal...

    worldNews = {}
    weather = 'great'
    linguist = new Translator worldNews, weather

...and away you go!

    linguist.german() # Guten Tag
    linguist.japanese() # こんにちは
    linguist.writePaper() # My paper is on ...jargon jargon...
    linguist.greeting() # Hi!
    console.log worldNews # { germany: 'good news',
                          #   japan: { news: 'bad news', weather: 'great' } }



### [WTFPL](http://wtfpl.org/)