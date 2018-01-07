#!/bin/bash

# here is an example how to run from bikmeans2 to bikmeans5
# start with input data are bikmeans2 discretization

# run for bikmeans2
java -jar banjo.jar settingsFile=onSetting.txt
java -jar banjo.jar settingsFile=offSetting.txt

# run for bikmeans3
python -c 'from ChangeDiscretization import ChangeDiscretization; ChangeDiscretization("bikmeans2","bikmeans3")'
rm onSetting.txt
rm offSetting.txt
mv onSettingNew.txt onSetting.txt
mv offSettingNew.txt offSetting.txt
java -jar banjo.jar settingsFile=onSetting.txt
java -jar banjo.jar settingsFile=offSetting.txt

# run for bikmeans4
python -c 'from ChangeDiscretization import ChangeDiscretization; ChangeDiscretization("bikmeans3","bikmeans4")'
rm onSetting.txt
rm offSetting.txt
mv onSettingNew.txt onSetting.txt
mv offSettingNew.txt offSetting.txt
java -jar banjo.jar settingsFile=onSetting.txt
java -jar banjo.jar settingsFile=offSetting.txt

# run for bikmeans5
python -c 'from ChangeDiscretization import ChangeDiscretization; ChangeDiscretization("bikmeans4","bikmeans5")'
rm onSetting.txt
rm offSetting.txt
mv onSettingNew.txt onSetting.txt
mv offSettingNew.txt offSetting.txt
java -jar banjo.jar settingsFile=onSetting.txt
java -jar banjo.jar settingsFile=offSetting.txt

# after running this script, run ChangeDiscretization.py directily again to set everything back to the beginning

python ChangeDiscretization.py

# this can be better written by defining functions in bash script changing inside the input of python ChangeDiscretization function
# Editted by Yuezhe Li on Dec. 3, 2016
