This guide is a step-by-step instruction on how to run the Twitter Word Count application.

** This guide makes the following assumptions **
   - You are running the application from the UC Berkeley AMI ID: ami-d4dd4ec3 as found on AWS
   - You are running the application as the "root" user

1. Start your EC2 instance using the aforementioned UC Berkeley AMI.
2. Execute the TwitterStartup.py file.  This file will run the following tasks:
   - Imports the subprocess and os modules from the Python standard library.  These modules enable
     the user to run unix/linux command line arguments from a Python script.
   - Mounts the EBS disk to the /data directory of your EC2 instance
   - Executes the "start_postgres.sh" script as found on the EBS device.  This script will start
     the Postgres data base in the background.
   - Drops and creates a new database called "tcount".
   - Creates a new table within the tcount database titled "tweetwordcount".
3. Change your directory using the following path (this assumes that you have cloned the 'W205-Spring-2017' repository from my github account.
        'cd /data/W205-Spring-2017/Ex2/extweetwordcount'
4. Enter the following command at the command line:
        'sparse run'
5. Hit the "enter/return" button after the LEIN prompt.
6. The Twitter Word Count application will then run to standard output.  To stop the process enter
   ctrl^c
7. If you encouter a massive glut of "Empty queue exceptions" in the output, compelete the following:
   - Stop the process with ctrl^c
   - Enter the following at the command line:
        kill `ps -ef | grep streamparse | grep -v grep | awk '{print $2}'`
	** This command will kill the current streamparse process, which resets the Twitter API feed. **
   - Restart the application by following steps 4-6.  
