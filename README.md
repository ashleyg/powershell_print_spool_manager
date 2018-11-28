# Powershell Print Spool Manager

## Background

When using Windows 10 style apps (e.g. Edge, Photo Viewer) with certain types of printers (in my experience those with a retention feature) jobs can get stuck in the print queue. The only way I've found to resolve this is stop the print spooler service, delete the files and start the print spooler.

If this is a network environment it requires someone with Admin privileges to be available to do so.

## This Script

This script monitors the current files in the print spool folder. By identifying the oldest file in the folder it attempts to guess if the spooler is stuck. If it thinks it is, it automatically does the above process. By checking the oldest file rather than blindly wiping it every x minutes it means that it only does so when required and so doesn't loose prints unless necessary.

A limitation is that when it does clear the queue it clears everything not just the stuck file. This should be an easy modification to make but in practical applications I've not found clearing everything to be an issue but be aware.

I run this on a scheduled task every 10 minutes. This means with the default setup it should at worst take about 20 minutes to clear a problem.

## Note

Though I've run this for quite a while I haven't formally tested the script. So proceed with caution and use at your own risk. As I advise with all Powershell scripts you probably want to go through it and understand the whole thing before you run it.
