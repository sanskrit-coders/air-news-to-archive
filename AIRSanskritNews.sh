# shell script to run once a day (i have tried on Ubuntu 16.04 env.)
# (ideally this should be scheduled - and hence more error checking needed)
pre='AIR_SanskritNews'
aext1='56978.mp3' # morning file ... hard-coded (but can also be extracted from http://newsonair.nic.in/nsd.asp RSS/xml)
aext2='55570.mp3' # evening file
f1='0655' # morning time
f2='1810' # evening time
d=`date +'%F'` # should we extract date from file headers & use it instead? like curl -s -v -X HEAD <file_url> 2>&1 | grep '^< Last-Modified:'
abase='http://newsonair.nic.in/writereaddata/bulletins/Sanskrit-NSD-Language-Audio-Bulletins-' # again hard-coded
afilnam1=$pre"_"$d"_"$f1".mp3" # file name - from prefix, date, time, etc.
if test ! -f $afilnam1 # avoid over-writing if the script is run again during the day
then
  curl -s -o $afilnam1 $abase$aext1 # save local mp3 file from newsonair website
fi
if test -f $afilnam1 # if mp3 file is successfully downloaded
then
ia upload AIR_SanskritNews $afilnam1 --metadata="mediatype:audio" >/dev/null 2>&1 # upload to archive using command line http://internetarchive.readthedocs.io/en/latest/cli.html - ia needs to be configured (once) before this can work
fi
# now do the same below for second file (evening news)
afilnam2=$pre"_"$d"_"$f2".mp3"
pfilnam2=$pre"_"$d"_"$f2".pdf"
if test ! -f  $afilnam2
then
  curl -s -o $afilnam2 $abase$aext2
fi
if test -f $afilnam2
then
ia upload AIR_SanskritNews $afilnam2 --metadata="mediatype:audio" >/dev/null 2>&1
fi
rm $afilnam1 # delete the mp3 file after upload
rm $afilnam2
