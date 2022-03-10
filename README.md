# volumio-recently-added
Ruby script to create "Recently Added" playlists for Volumio. This will add a `Recently Added: YYYY-MM-DD` playlist for each week where there are "new tracks" (determined by modified time) added.

## installation

(abbreviated instructions). 

1. You must use Volumio 3+ (older versions have an mpd that does not correctly support the `modified-since` search function)
1. Turn on SSH for volumio
1. Get ruby on your volumio instance (I prefer chruby). Tested with 2.7.5. Rubies >= 3 don't install well on volumio's linux (missing newer OpenSSL). 
1. Add this script, `bundle` 
1. Add crontab to run periodically. If using chruby, you can 
`chruby-exec 2.7.5 -- ruby /path/to/script/create_recently_added.rb`
