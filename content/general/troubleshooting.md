# Troubleshooting and Support

Our team is available at [support@tier2.tech](mailto:support@tier2.tech) and +1-833-328-8866 ([International Numbers here](https://docs.tier2tickets.com/#support))

## Log Files

When requesting support, our team may ask you for log files.

You can find these files in the `C:\Program Files (x86)\Tier2Tickets\` folder.

We typically request:

- `button.log`,
- `button_gui.log`,
- `buttonHelper.log`,
- `splash.log` and
- `t2tservice.log`



Here is a simple script that will bundle the most recent logs into a zip and drop that zip into C:\temp.

```shell
New-Item -Path "c:\temp" -Name "t2tlogs" -ItemType "directory"
Copy-Item 'C:\Program Files (x86)\Tier2Tickets\*.log' 'C:\temp\t2tlogs'
Compress-Archive -Update -Path 'C:\temp\t2tlogs\' -DestinationPath 'C:\temp\t2tlogs.zip'
Remove-Item C:\temp\t2tlogs\ -Recurse
```

## Common Issues

### Windows Management Instrumentation (WMI)

If you are seeing a 404 message on a report, the issue may be the functionality in windows that provides us with the data.

Try these steps to see if they might resolve the issue:

Double-check to see if the Windows Event Log, and Windows Management Instrumentation services are running on the affected machines. These services need to be running and functional to get the information for the report.

If either or both were not running that may be the issue, so start them and see if that fixes the issue. If they are both running double check that WMI is configured correctly.

In a PowerShell window run:

Get-WmiObject -Class Win32_ComputerSystem

This should always return a short list of computer information for the local machine. If you get any type of error, you will likely need to repair WMI on that machine. Normally it can be done in a few simple commands:

winmgmt /verifyrepository

This command will tell you if the repository is consistent. (I have had people need to rebuild it even when it says its consistent)

winmgmt /salvagerepository

This command attempts to repair the repository (this is the safest way to go about it)
if the repair fails, a reset may be necessary.

or

winmgmt /resetrepository

If either of those methods that worked out you should be able to run the first test again:

Get-WmiObject -Class Win32_ComputerSystem

and get the system information.


### Performance Monitor

We have also seen on rare occasions that the Performance Monitor stops running which generates some of the data we use to make the report. You can check to see if this works by opening the Performance Monitor Application from the start menu. If there are any errors on loading, try running this command in an elevated PowerShell window:

lodctr /R

It may create a backup on the first run and reload the service on the second execution.

### Self-Hosted Gatekeeper S3 Issues

Some of our partners are seeing an error submitting tickets when they are using the Self-Hosted Gatekeeper. This is due to endpoints timing out when delivering the data to our servers. This can be fixed by increasing the timeout for the Gatekeeper. Here is a video showing how to do it along with the steps written below. 

<video src="https:\\dev.helpdeskbuttons.com\resources\gatekeeper timeout.mp4" width="320" height="240" controls></video>

1) Log into your AWS account.
2) Select the Lambda service.
3) Select the function that has the description "Tier2.tech s3 gatekeeper".
4) Select the configuration tab. 
5) Click Edit.
6) Set the timeout to something higher than a few seconds (we recommend 10-30 seconds).