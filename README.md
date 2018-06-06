# air-news-to-archive
[2018-06]
To begin with - this is just one shell script .. to be run on environment (like Ubuntu 16.04)
All it does is - extracts/downloads two mp3 files - morning & evening Sanskrit News bulletin 'published' by All India Radio (AIR) 
- http://newsonair.nic.in/nsd.asp
Since the file names/locations are 'static' (they overwrite the files daily), the script is straight forward (for now)
Once files are 'captured' (using curl), they are then uploaded to archive.org (using IA command line interface) http://internetarchive.readthedocs.io/en/latest/cli.html
(The above only works since IA has been already configured before hand - one time activity)
https://archive.org/details/AIR_SanskritNews is where the published daily news can be accessed/heard/streamed from

[FILES]
AIRSanskritNews.sh - June 2018 (many hard-coding

[TO DO]
few things to ponder?
- to schedule this to run once automatically - using cron (or something similar)
- it will hence need error-handling
- shall we base it on actual RSS feed inputs (remove hard-coding)? - though it is same info daily
- shall we also get date/timestamp of source mp3 files using curl HEAD ?
- shall we have a website/portal (maybe CMS like wordpress) ... where these can be automatically added as post 
... along with script (PDF files are similarly available)?
- 
