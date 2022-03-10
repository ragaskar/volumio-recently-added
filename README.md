# volumio-recently-added
Ruby script to create "Recently Added" playlists for Volumio. This will add a `Recently Added: YYYY-MM-DD` playlist for each week where there are "new tracks" (determined by modified time) added.

## installation

Turn on SSH for volumio
Get ruby on your volumio instance (I prefer chruby). Tested with 2.7.5. Rubies >= 3 don't install well on volumio's linux (missing newer OpenSSL). 
Add this script, bundle 
Add crontab to run periodically. If using chruby, you can 
`chruby-exec 2.7.5 -- ruby /path/to/script/create_recently_added.rb`
