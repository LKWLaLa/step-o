#step-o

###Description:

A Rails based organizer for dance steps a user would like to practice, and the YouTube videos they may be found in. 

###Structure:

There is a many to many relationship between steps and videos, with a video containing many dance steps, and a dance step potentially being found in many videos.  They are connected through a join table - timemarkers - which contains an additional attribute column - marker - storing the "timestamp" where a dance step is located in a particular video.  

Also, steps have a many to many relationship with styles, through a join table called step_styles.  The step_styles join table does not contain any additional attributes.  All styles belong to a user, so the current user can only see and manipulate the style tags they themselves have created.  

Users can navigate the app by viewing either the steps index or the videos index, and associations are nested in both directions.  (Steps associated with a particular video, or videos associated with a particular step.)


###Dependencies:

Step-O is built with Rails version 4.2.6, using Ruby version 2.2.3, and a postgreSQL database. The app also uses the jquery-rails, devise, omniauth, omniauth-facebook, youtube_id, and kaminari gems. You will need to obtain a facebook key and facebook secret for full OAuth2 functionality.

###Installation Guide:

If not already available, install Ruby, Bundler, and Rails.

Then clone this repository.

In the command line, run:

```bash
bundle
bundle exec rake db:migrate
bundle exec rake db:seed 
```

To start up a local server, run `rails s` and navigate to localhost:3000 in your web browser.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LKWLaLa/step-o. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


###License:

Copyright (c) 2016 Lindsey Wells

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.









