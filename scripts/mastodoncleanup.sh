#!/bin/bash
export PATH="$HOME/.rbenv/bin:$PATH"
export RAILS_ENV=production

# cleanup mastodon data
/home/mastodon/live/bin/tootctl media remove
/home/mastodon/live/bin/tootctl preview_cards remove

# cleanup azcopy logs
rm /home/mastodon/.azcopy/*.log

