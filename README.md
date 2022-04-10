# volumio-recently-added
Ruby script to create "Recently Added" playlists for Volumio. This will add a `Recently Added: YYYY-MM-DD` playlist for each week where there are "new tracks" (determined by modified time) added.

## installation

(abbreviated instructions). 

1. You must use Volumio 3+ (older versions have an mpd that does not correctly support the `modified-since` search function)
1. Turn on SSH for volumio
1. Get ruby on your volumio instance (I prefer chruby, which you can install via the method [here](sudo ./scripts/setup.sh) after cloning the repo locally. You will also likely want ruby-install to install your rubies for use with chruby, install instructions are [here](https://github.com/postmodern/ruby-install#install).). Tested with 2.7.5. Rubies >= 3 don't install well on volumio's linux (missing newer OpenSSL).  
1. Add this script, run `bundle` in the root directory. 
1. Add crontab to run periodically. If using chruby, you can, as your volumio user 
```
crontab -e
chruby-exec 2.7.5 -- ruby /path/to/script/create_recently_added.rb
```

