Twitter Extension

## Installation

### Local-Env configuration

The application uses the local-env gem, and requires a config/local-env.yml be present. You can copy the config/local-env.yml.template version. 

Chameleon must know about the "secret key" that is used. If this extension is not defined already in the test data, then you'd need to define it with the same key that you set in he config/local-env.yml file.

### Startup

Just start it up on a different port than Chameleon.

### Extension setup

- The extension relies on the AnypresenceExtension rails engine gem. It's not public right now, so we would need to unpack it manually to vendor/gems/ for now. To get the latest gem, you will need to clone the "anypresence_extension" project, run a % rake install and copy the gem from the pkg/ directory into the vendor/gems folder for the <Twitter Extension> project. From <Twitter Extension>/vendor/gems, you will need to rum % gem unpack <gem_file>.

- You will need to create your own Twitter application from twitter.com. The application should have read/write privileges. You will need the Oauth keys and consumer keys for the extension.

- Drill down to application and find the Twitter Extension. Update it with the keys you generated
from twitter.com

- Create lifecycle events for the Twitter Extension and publish your application.

You should now be able to send out tweets for lifecycle events that gets triggered.
 
