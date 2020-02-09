#!/bin/bash
BACKUPDIR="/home/adam/Tekkit/Backups"
LOG="/home/adam/Tekkit/clean.log"


removeBackupSecAgoHour00() {
	secAgo=$1
	backupName=$(date --date="@$(($(date +%s)-$secAgo))" +%Y-%m-%d_%H:00)
	rm -r $BACKUPDIR/$backupName >> $LOG 2>&1 && echo "Successfully deleted backup: $backupName : MONTLY" >> $LOG
}

removeBackupSecAgoHour30() {
	secAgo=$1
	backupName=$(date --date="@$(($(date +%s)-$secAgo))" +%Y-%m-%d_%H:30)
	rm -r $BACKUPDIR/$backupName >> $LOG 2>&1 && echo "Successfully deleted backup: $backupName : WEEKLY" >> $LOG
}

removeBackupsInSecRangeHour00() {
	first=$1
	last=$2

	for sec in $(seq $first $(hoursToSeconds 1) $last); do
		removeBackupSecAgoHour00 $sec
	done
}

removeBackupsInSecRangeHour30() {
	first=$1
	last=$2

	for sec in $(seq $first $(hoursToSeconds 1) $last); do
		removeBackupSecAgoHour30 $sec
	done
}

hoursToMinutes() {
	hours=$1
	echo $((hours * 60))
}

hoursToSeconds() {
	hours=$1
	echo $(($(hoursToMinutes $hours) * 60))
}

daysToSeconds() {
	days=$1
	echo $(hoursToSeconds $(($days * 24)))
}

weeksToSeconds() {
	weeks=$1
	echo $(daysToSeconds $((weeks * 7)))
}

monthsToSeconds() {
	months=$1
	echo $(weeksToSeconds $((months * 4)))
}

cleanUpWeekBackups() {
	removeBackupsInSecRangeHour30 $(weeksToSeconds 1) $(($(weeksToSeconds 1) - $(daysToSeconds 1)))
}

cleanUpMonthBackups() {
	removeBackupsInSecRangeHour00 $(monthsToSeconds) $(($(monthsToSeconds 1) - $(daysToSeconds 1)))
}

startLog() {
	echo "Clean performed $(date "+%Y-%m-%d %H:%M")" >> $LOG
}

endLog() {
	echo -e "Clean finished!\n\n" >> $LOG
}

cleanBackups() {
	startLog

	cleanUpWeekBackups
	cleanUpMonthBackups

	endLog
}

cleanBackups
