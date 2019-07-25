# How do I use custom scripts?

The payload.zip that you upload your logos with is where you also upload your scripts. You need to put all your scripts in that zip file as well as any exe's that your scripts need to run. When the software is launched, it looks for anything matching the name *exec**.ps1. Whatever matches that name will be run asynchronously.

Each script will start with a working directory of the extracted payload, so any helper exe's you have in your payload zip file will be sitting right there with it. There is an "upload" folder which is where the output of your scripts need to go. The location of this upload folder is stored in an environment variable named "_uploadDir". You can save any log files or script output into that upload folder and it will get sent in, but right now general file uploads are not yet accessible in the report.

But what we do have accessible right now (but again, not well tested) is a special approach which allows your script output to be appended to the text of the report itself. It works like this: you need to save the output as a ascii or utf-8 text file named *_append.txt in the upload folder. The text therein will be appended to the ticket body. You can make as many of these* _append.txt files as you like and they will all be appended.

Putting all that together, give this a try. Add a file named _exec_test.ps1 to your payload.zip with this file content:

```
echo "Hello World" > $Env:_uploadDir\example_append.txt
```

You should find that this appends the "Hello World" text to your report. Now replace the "Hello World" with whatever data you want to collect and you should be good to go.

I think general file uploads will be accessible to download through the report page in a few weeks. But let me know if that works for you, and what you think about the system.