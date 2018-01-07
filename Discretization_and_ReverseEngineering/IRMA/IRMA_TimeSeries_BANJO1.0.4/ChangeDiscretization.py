def ChangeDiscretization( previous, new ):
# both previous and new shall be in str
	fin = open("offSetting.txt")
	fout = open("offSettingNew.txt", "wt")
	for line in fin:
		fout.write( line.replace( previous, new) )
	fin.close()
	fout.close()
	fin = None
	fout = None

	fin = open("onSetting.txt")
	fout = open("onSettingNew.txt", "wt")
	for line in fin:
		fout.write( line.replace( previous, new) )
	fin.close()
	fout.close()
	fin = None
	fout = None
	return 'RePLaCe/Rename the fiLEs!'

ChangeDiscretization("bikmeans5","bikmeans2")
