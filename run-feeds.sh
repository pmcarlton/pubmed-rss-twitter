nohup feedstail -i 21600 -f {title}__{tags}__{author}__{link} -r -u 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/erss.cgi?rss_guid=1HAC9OLsDE6PY4XyvgByLWB1ZfmgPH-Idx0mQ4N519GUzAK9OT' | perl /home/pcarlton/code/pubmed-rss-twitter/rss-filter.pl | /home/pcarlton/code/meiotweet.sh &

nohup feedstail -i 21600 -f {title}__{tags}__{author}__{link} -r -u 'http://www.ncbi.nlm.nih.gov/entrez/eutils/erss.cgi?rss_guid=1lS0N-smva-GZXzUBm7wiyXZpf_XKDL8e-APbwxwudglrkI9Pw' | perl /home/pcarlton/code/pubmed-rss-twitter/rss-filter.pl | /home/pcarlton/code/5hmctweet.sh &

nohup feedstail -e -r -f {title}__{author}__{link} -u "https://api.zotero.org/groups/143169/items/top?start=0&limit=25&key=x76Uhr789mht2gzHah6ICk91" | perl -pe 'BEGIN{$|=1;} s/__/ — /g;s/$/\n/' |  /home/pcarlton/code/slack-zotero-send.sh &

nohup feedstail -i 21600 -e -r -u "http://connect.biorxiv.org/biorxiv_xml.php?subject=all" -f {title}__{tags}__{author}__{link}__{summary} | perl /home/pcarlton/code/pubmed-rss-twitter/biorxiv-filter.pl &
