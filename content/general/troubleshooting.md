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

```powershell
New-Item -Path "c:\temp" -Name "t2tlogs" -ItemType "directory"
Copy-Item 'C:\Program Files (x86)\Tier2Tickets\*.log' 'C:\temp\t2tlogs'
Compress-Archive -Update -Path 'C:\temp\t2tlogs\' -DestinationPath $env:USERPROFILE\Desktop\t2tlogs.zip
Remove-Item C:\temp\t2tlogs\ -Recurse
```

