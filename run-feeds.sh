nohup feedstail -i 21600 -f {title}__{tags}__{author}__{link} -r -u 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/erss.cgi?rss_guid=1HAC9OLsDE6PY4XyvgByLWB1ZfmgPH-Idx0mQ4N519GUzAK9OT' | perl /home/pcarlton/code/pubmed-rss-twitter/rss-filter.pl | /home/pcarlton/code/meiotweet.sh &

nohup feedstail -i 21600 -f {title}__{tags}__{author}__{link} -r -u 'http://www.ncbi.nlm.nih.gov/entrez/eutils/erss.cgi?rss_guid=1lS0N-smva-GZXzUBm7wiyXZpf_XKDL8e-APbwxwudglrkI9Pw' | perl /home/pcarlton/code/pubmed-rss-twitter/rss-filter.pl | /home/pcarlton/code/5hmctweet.sh &

nohup feedstail -i 21600 -e -r -u "http://connect.biorxiv.org/biorxiv_xml.php?subject=all" -f {title}__{author}__{link}__{summary} | perl /home/pcarlton/code/pubmed-rss-twitter/biorxiv-filter.pl &
