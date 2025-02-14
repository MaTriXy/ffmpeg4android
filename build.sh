#------------------
#copy build.sh
#------------------
cp build_android.sh $1/

cd $1

rm -rf .git
rm .gitignore
rm -rf android

#------------------
#change output format
#------------------
sed -i '' "s/SLIBNAME_WITH_MAJOR='\$(SLIBNAME).\$(LIBMAJOR)'/SLIBNAME_WITH_MAJOR='\$(SLIBPREF)\$(FULLNAME)-\$(LIBMAJOR)\$(SLIBSUF)'/g" ./configure
sed -i '' "s~SLIB_INSTALL_NAME='\$(SLIBNAME_WITH_VERSION)'~SLIB_INSTALL_NAME='\$(SLIBNAME_WITH_MAJOR)'~g" ./configure
sed -i '' "s~SLIB_INSTALL_LINKS='\$(SLIBNAME_WITH_MAJOR) \$(SLIBNAME)'~SLIB_INSTALL_LINKS='\$(SLIBNAME)'~g" ./configure


#------------------
#build
#------------------
chmod a+x ./build_android.sh
./build_android.sh

#------------------
#cp & rename mk.
#------------------
cp ../Android_newer.mk android/arm
mv android/arm/Android_newer.mk android/arm/Android.mk

#------------------
#done
