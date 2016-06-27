#step-o

###Description:

A Rails based organizer for dance steps a user would like to practice, and the YouTube videos they may be found in. 

###Structure:

There is a many to many relationship between steps and videos, with a video containing many dance steps, and a dance step potentially being found in many videos.  They are connected through the join table, named timemarkers, with an additional attribute column - marker - which is essentially the "timestamp" where a dance step is located in a particular video.  

Also, steps have a many to many relationship with styles, through a join table called step_styles.  The step_styles join table does not contain any additional attributes.

Users can navigation the app by viewing either the steps index or the videos index, and associations are nested in both directions.  (Steps associated with a particular video, or videos associated with a particular step.)


###Dependencies:

Step-O is built on Rails, version 4.2.6, using Ruby version 2.2.3p173, and a sqlite3 database. The app also uses the jquery-rails, devise, omniauth, omniauth-facebook, and youtube_id gems. You will also need to obtain a facebook key and facebook secret for full OAuth2 functionality.

###Installation Guide:

If not already available, install Ruby, Bundler, and Rails.

Then clone this repository.

In the command line, run:

```bash
bundle
bundle exec rake db:migrate
bundle exec rake db:seed 
```

To start up a local server, run `rails s` , and then navigate to localhost:3000 in your web browser.


###License:

The MIT License (MIT)

Copyright (c) 2016 Lindsey Wells

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
Status API Training Shop Blog About








