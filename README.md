# RottenPotatoes demo app: getting started

This app is associated with the free [online course](http://www.saas-class.org) and (non-free)
[ebook](http://www.saasbook.info) Engineering Software as a Service.

To start working on the Rails Intro homework, please follow [the instructions](instructions/README.md).

# In Heroku

http://glacial-thicket-94067.herokuapp.com

# From EdX

Failures:

  1) GET /movies When I first visit the page should have all checkboxes checked  [8 points]
     Failure/Error: expect(checked_boxes.include?(checkbox)).to be_truthy, "unchecked checkbox found with id #{checkbox[:id]}"
       unchecked checkbox found with id ratings_G

Finished in 1.83 seconds (files took 5445 minutes 13 seconds to load)
29 examples, 1 failure

Failed examples:

rspec ./your_code.rb:267 # GET /movies When I first visit the page should have all checkboxes checked  [8 points]
