#!/bin/tcsh -f

set here=`pwd`

cd /tmp/

set pyVer=2.5

unsetenv PYTHONPATH

set id=`date "+%Y%m%d-%H%M%S"`
set wake="wake-$id"

setenv PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
setenv PYTHONPATH /tmp/${wake}/lib/python${pyVer}/site-packages
# mkdir -p local/lib/python${pyVer}/site-packages 

# cp -r /home/mike/projects/pipeline/modular/dependencies /tmp/local

# easy_install --prefix local http://www.michaelpjones.co.uk/pipeline/SlipStream_foundation-0.0.1-py${pyVer}.egg
# easy_install --prefix local http://www.michaelpjones.co.uk/pipeline/SlipStream-0.0.1-py${pyVer}.egg
# easy_install --prefix local http://www.michaelpjones.co.uk/pipeline/SlipStream_level-0.0.1-py${pyVer}.egg

mkdir -p /tmp/$wake/lib/python${pyVer}/site-packages

cp -r /home/mike/projects/pipeline/modular/dependencies/lib/python2.5/site-packages/* /tmp/$wake/lib/python${pyVer}/site-packages

# easy_install --prefix local /home/mike/projects/pipeline/modular/foundation/dist/SlipStream_foundation-0.0.1-py${pyVer}.egg
easy_install --prefix $wake $here/../pipeline/dist/wake-0.0.1-py${pyVer}.egg

easy_install --prefix $wake $here/../modules/level/dist/wake_level-0.0.1-py${pyVer}.egg

echo 
echo
echo "# Setup"
echo "-------"
echo

cd /tmp/$wake

setenv PATH /tmp/$wake/bin:$PATH
rehash

echo wake create root
wake create root

setenv PL_LAST_FILE "/tmp/$wake/.last"

cd /tmp/$wake/root/jobs_root
source .pipeline_setup

cd /tmp/$wake/root/jobs_root
cd prod/pipeline/scripts

echo "Running Install"
./setup.py install

jr

