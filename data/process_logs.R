# Download all the zipped log files from Apache folder

# Unzip them all:

system("unzip *.zip; mkdir zips; mv *.zip zips/")

# concatenate them all together and read them in

'/^(\S+) (\S+) (\S+) \[([^:]+):(\d+:\d+:\d+) ([^\]]+)\] \"(\S+) (.*?) (\S+)\" (\S+) (\S+) "([^"]*)" "([^"]*)"$/'

system("cat *.log | cut -d " " -f 1,4,7 > logs.txt")
logs <- read.table("logs.txt")
#save(logs, file="logs.RData")

# Convert the date column to a proper format

logs$dt <- as.POSIXct(strptime(as.character(logs$V2), "[%d/%m/%Y:%H:%M:%S"))


