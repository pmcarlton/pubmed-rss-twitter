use strict;
$|=1;   #set autoflush
use utf8; 
binmode STDIN, ":utf8"; #needed for Unicode
binmode STDOUT, ":utf8"; #needed for Unicode

#preprocess the input stream first
#my $w=chr(0xc2).chr(0xa0); #this is a weird space character that you get sometimes in pubmed!
my $tlen=85; #how many characters of title to print out
while(<STDIN>) {
my $prg=0;
#s/($w)/ /; #replace the weird space with a real space
s/PLoS/PLOS/; #all-uppercase now
$prg=1 if(/5hmC/ || /Tet1/i || /Tet2/i || /Tet3/i || /hydroxymethylcytosine/i);
$prg=2 if(/meiosis/i || /synaptonemal/i || /meiot/i); 
my @a=split("__",$_); #feedstail separated each field with "__", now we'll process each field at a time
my @tt=split(" ",$a[0]);
#my $t=join(" ",splice(@tt,2));
my $t=$a[0];
$a[1]=~s/\.//g;
$a[2]=~s/.rss=1//;
my $rb=$a[1]." ".$a[2];
my $tl=length($rb);
if(length($t)>(130-$tl)){
    $t=substr($t,0,133-$tl);
    $t=~s/ $//;
    $t=$t."…";
    }
my $out=$t."|".$rb."\n";
$out=~s/(\W)…/$1/;chomp($out);
my $cmd="";
if($prg==1) {$cmd="echo ".qw(').$out.qw(')." | /home/pcarlton/code/5hmctweet.sh \n";}
if($prg==2) {$cmd="echo ".qw(').$out.qw(')." | /home/pcarlton/code/meiotweet.sh \n";} 
if($cmd){system($cmd);}
#if($prg==2) {print $cmd;}
}


#nohup feedstail -i 21600 -e -r -u "http://connect.biorxiv.org/biorxiv_xml.php?subject=all" -f {title}__{author}__{link}__{summary} | perl /home/pcarlton/code/pubmed-rss-twitter/biorxiv-filter.pl &
