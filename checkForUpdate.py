with open ("/home/pi/HotspotUpdates/new/Version", "r") as newFile:
  newVer=newFile.read() 

with open ("/home/pi/Hotspot/Version", "r") as curFile:
  curVer=curFile.read()

if curVer == newVer:
  print 1
else:
  print 2
