# pubmed-rss-twitter

## Summary:

This is a simple method for making a twitter bot from a pubmed RSS feed. It will work on any Mac or *nix, uses free / open software and does not depend on cloud services. You can customize and curate the output items at will. The principle of operation is:

- fetch the latest feed items
- output each item as formatted text
- filter that text into a tweetable blurb
- send it to twitter

## Requirements:

- [perl](www.perl.org)
- [python](www.python.org)
- [pip](http://www.pip-installer.org/en/latest/installing.html), the python package manager
- [feedstail](https://pypi.python.org/pypi/feedstail/), an RSS watcher, which you install with `pip` above
- [ttytter](http://www.floodgap.com/software/ttytter/), a command-line twitter client  
available in most Linux / Mac package systems (Homebrew, Debian, Ubuntu, &c.)

## Howto:

1. If you don't already have a dedicated twitter account for the feed, or haven't defined an RSS feed, read steps 1 and 2 (and the rest too while you're there) of Rob Lanfear's [instructions](https://github.com/roblanf/phypapers)
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

- It would probably be a good idea to create a `launchd` script to run this so it happens in the background. 
- The behavior of `feedstail` seems to be to always fetch the "newest" items, so stopping and re-starting may result in repeat postings. This behavior can be filtered out in `rss-filter.pl` if you can figure out a good way.
- So far this only does Pubmed RSS. Other sources likely have their own idiosyncratic RSS formats. To extend this, the `rss-filter` program(s) will need to have a different routine for each source.
- TODOs: non-Pubmed sources, easier running of the command

### Acknowledgements:

Thanks to @caseybergman for the idea and @RobLanfear for sharing implementation details
