# pubmed-rss-twitter

## Summary:

This is a simple method for making a twitter bot from a pubmed RSS feed. It uses free / open software and does not depend on cloud services. You can customize/curate the output items at will.

## Requirements:

- [perl](www.perl.org)
- [python](www.python.org)
- [pip](http://www.pip-installer.org/en/latest/installing.html), the python package manager
- [feedstail](https://pypi.python.org/pypi/feedstail/), an RSS watcher
- [ttytter](http://www.floodgap.com/software/ttytter/), a command-line twitter client
    - Available in most Linux / Mac package systems (Homebrew, Debian, Ubuntu, &c.)

## Howto:

1. Install python and pip from above URLs
2. Use pip to install feedstail: `pip install feedstail`
3. Install ttytter from source or from your package manager
4. Follow ttytter's [instructions](http://www.floodgap.com/software/ttytter/) to create your OAuth keyfile
5. Place the `rss-filter.pl` file somewhere handy
6. Run feedstail as shown in `command.sh` in the background with your url(s) of choice, pipe the output into `rss-filter.pl`, and thence to ttytter
7. Enjoy the firehose of scientific literature

## Example:

    nohup feedstail -f "{title}__{tags}__{author}__{link}" -r -u "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/erss.cgi?rss_guid=$FEED_ID" | perl rss-filter.pl | ttytter -keyf=$ACCOUNT_KEYFILE -script &

### Notes:

- It would probably be a good idea to create a `launchd` script to run this so it happens in the background. 
- The behavior of `feedstail` seems to be to always fetch the "newest" items, so stopping and re-starting may result in repeat postings. This behavior can be filtered out in `rss-filter.pl` if you can figure out a good way.
- So far this only does Pubmed RSS. Other sources likely have their own idiosyncratic RSS formats. To extend this, the `rss-filter` program(s) will need to have a different routine for each source.
