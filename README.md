# Fantasy Forge

### Site Address: https://fantasy-forge.herokuapp.com

This is Fantasy Forge. A simple drawing app aimed at creating fictional maps and worlds; either for a story someone my be working on, or for planning a table top game (D&D), or for whatever else you might want to use it for.

## Summary

I set out to build an app that I've wanted for a while now, a simple fictional map creator. And even though at this point is not at the level of perfection I might expect (which is an obsessively unachievable amount of perfection) I think I've certainly laid a nice ground work.

This app is built using the Rails framework, with paper.js as the map creation engine. All the tools are made using mouse action based event such as drag or mouse down, with responsive color creation and layout. Users can create maps and populate them with roads and cities, create separate versions of the map to show a difference in the world over time (say in a story or game on country falls during a war and borders need to be redrawn).

So far the struggles with this project have simply been from a learning curve. So the more I learn about drawing UI's and vector graphics, the better the app will get. So stay tuned!!

* ### Technologies Used

   - Ruby / Rails
   - Javascript / jQuery
   - Bootstrap
   - [Paper.js](http://paperjs.org/)

* ### Database initialization

   In your terminal console, first run:

   `rake db:create`

   then:

   `rake db:migrate`

* ### How to run the test suite

   In the console run:

   `bundle install`

   then:

   `rails s`

   and open localhost:3000 in the browser.


# Future Deployment Goals

   1. Styling and theme of the app as a whole.

      * As yet there is nearly zero styling to the app. I plan to mitigate this with a god chunk of 'make it pretty'. I have an earth tone color scheme listed out and ready to go. It's simply a matter of enough time.

   2. Multiple new tools and drawing functionality.

      * The tools the app currently has in place are good, but limited. I plan to not only add new tools (such as swamps, small islands, and snow/desert terrain), but to make the existing tools more user friendly. For example making the coast borders connect automatically instead of the 'eye ball' fashion they currently run in. In all honesty, as far as tools go, this could be a never ending playground.

   3. Climate

      * Add a climate scheme to maps. Which will essentially dictate the colors used to draw the map (Temparete climate maps will have richer, more vibrant colors than a colder climate map).

   4. More Generators

      * Why stop at world building? I plan to add the ability to create countries within a world, and city maps that can be associated to specific countries/worlds.

   5. Different Build Styles

      * Some people don't like to map things out freehand. I understand this, and accept it. Which is why a future goal of this project is to integrate a drag and drop tile system that will allow users to build a world by placing small segments of a map together on a grid (square of hexagenal).

   6. Better View Environment

      * Seeing a static image of the map you just created is fine an dandy, but it would be better to be able to explore your world. In the future I'll look at designing a view interface that will work much like google maps, but with your world!

   7. Zoomable

      * As is says, I want to be able to zoom in and out of the picture. Simple as that.

   8. Gamify!

      * I would love to add a small game engine that would run 'stress tests' on the map a user has created. Run war games to test how long the country could hold against an invading army, or if a castle is placed well enough to withstand a siege (Yeah, I'm a nerd, I've embraced this fact and accosted myself with the proper amount of shame. Rest assured.).

---

### Thanks for giving my app a peek. I hope you enjoy creating a land all your own.
