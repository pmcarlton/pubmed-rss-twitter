# pubmed-rss-twitter

## Summary:

This is a simple method for making a Twitter bot from a pubmed or bioRχiv RSS feed. It will work on any Mac or *nix, uses free / open software and does not depend on any proprietary or third-party services. You can customize and curate the output items at will. The principle of operation is:

- fetch the latest feed items as formatted text (using `feedstail`, a command-line RSS reader)
- change each item into a tweetable blurb (using `rss-filter.pl`)
- send it to Twitter (using `ttytter`, a command-line Twitter client)

## Requirements:

- [perl](www.perl.org)
- [python](www.python.org)
- [pip](http://www.pip-installer.org/en/latest/installing.html), the python package manager
- [feedstail](https://pypi.python.org/pypi/feedstail/), an RSS watcher, which you install with `pip` above
- [ttytter](http://www.floodgap.com/software/ttytter/), a command-line twitter client  
available in most Linux / Mac package systems (Homebrew, Debian, Ubuntu, &c.)

## Howto:

1. If you don't already have a dedicated Twitter account for the feed, or haven't defined an RSS feed, read steps 1 and 2 (and the rest too while you're there) of Rob Lanfear's [instructions](https://github.com/roblanf/phypapers)
1. Install python and pip from the above URLs (in Requirements)
2. Use pip to install feedstail: `pip install feedstail`
3. Install ttytter from source or from your package manager, e.g. `brew install ttytter` for [brew](http://brew.sh) on Mac
4. Follow ttytter's [instructions](http://www.floodgap.com/software/ttytter/) to create your OAuth keyfile
5. Place the [`rss-filter.pl`](https://github.com/pmcarlton/pubmed-rss-twitter/blob/master/rss-filter.pl) file somewhere handy
6. Run feedstail in the background with your url(s) of choice, pipe the output into `rss-filter.pl`, and thence to ttytter.  
For example see below or  [`command.sh`](https://github.com/pmcarlton/pubmed-rss-twitter/blob/master/command.sh)
7. Enjoy your custom firehose of scientific literature

## Example:

    nohup feedstail -f "{title}__{tags}__{author}__{link}" -r -u "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/erss.cgi?rss_guid=$FEED_ID" | perl rss-filter.pl | ttytter -keyf=$ACCOUNT_KEYFILE -script &

### Notes:

- Now with bioRχiv support!
- Once every few months or so, the bot stops—I have no idea why, but restarting it always fixes it. 
- The behavior of `feedstail` seems to be to always fetch the "newest" items, so stopping and re-starting may result in repeat postings. This behavior can be filtered out in `rss-filter.pl` if you can figure out a good way.
- TODOs: easier running of the command

### Acknowledgements:

Thanks to @caseybergman for the idea and @RobLanfear for sharing implementation details
