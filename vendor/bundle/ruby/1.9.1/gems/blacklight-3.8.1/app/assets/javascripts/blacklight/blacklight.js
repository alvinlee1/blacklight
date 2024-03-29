// This file is generated by Blacklight. You probably don't want to edit
//   this file directly, or you'll have to manually merge your changes if later
//   versions of Blacklight change this file. Instead, use your own JS file
//   which over-rides things in this JS file, as described below.
//
// These javascript files are compiled in via the Rails asset pipeline:
//= require blacklight/core
//= require blacklight/bookmark_toggle
//= require blacklight/facet_expand_contract
//= require blacklight/lightbox_dialog
//= require blacklight/more_facets
//= require blacklight/search_context
//= require blacklight/select_submit
//= require blacklight/zebra_stripe

/* Blacklight has a Javascript setup meant to support local disabling, 
  modification, and use of Blacklight behaviors. 
  
  There is a global Blacklight object, available to your local JS. 
  
  Individual logic to apply JS behaviors to particular elements is 
  stored in functions on that Blacklight object. 
  
  The actual behaviors themselves are implemented as JQuery plugins, 
  JQuery-UI widgets (a special kind of JQuery plugin), or in some cases
  just as logic in the Blacklight global object. 
  
  All of these things can be modified by your local JS code -- these functions
  are all set up on js load, and only called on document ready, so do your
  modifications just on js load, and they'll be made by the time document ready
  comes along. 
  
  Examples, in your application's own JS:
  
    Change what items zebra_striping gets applied to:
    
        Blacklight.do_zebra_stripe.selector = ".my_class .even";
        //Or even add on to existing:
        Blacklight.do_zebra_stripe.selector = Blacklight.do_zebra_stripe.selector + " .my_class .even";
      
    Turn off adding of behavior to facet 'more' links, using a no-op function:
    
        Blacklight.do_more_facets_behavior = function() {};
        
    Change the implementation of facet 'more' link behavior to use entirely
    different JS. 
    
        Blacklight.do_more_facets_behavior = function() {
          $(Blacklight.do_more_facets_behavior.selector).each(function() {
            //my own thing!
          });
        };
*/
