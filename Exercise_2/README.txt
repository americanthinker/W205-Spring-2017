This guide is a step-by-step instruction on how to run the Twitter Word Count application.

** This guide makes the following assumptions **
   - You are running the application from the UC Berkeley AMI ID: ami-d4dd4ec3 as found on AWS.  This AMI has all required dependencies required to run the Twitter Wordcount application.
   - You are running the application as the "root" user.
   - You are using the scripts and files as found in my github repository.
   - You have already obtained your own Twitter Credentials as found on the Twitter Developer website.

1. Start your EC2 instance using the aforementioned UC Berkeley AMI.
2. Enter the following at the commmand line:
   - git clone git@github.com:americanthinker/W205-Spring-2017.git  (assumes you are using SSH and not HTTPS)
3. Execute the TwitterStartup.py file.  This file will run the following tasks:
   - Imports the subprocess and os modules from the Python standard library.  These modules enable
     the user to run unix/linux command line arguments from a Python script.
   - Mounts the EBS disk to the /data directory of your EC2 instance (this step assumes you have an EBS already attached).
   - Executes the "start_postgres.sh" script as found on the EBS device.  This script will start
     the Postgres data base in the background.
   - Drops and creates a new database called "tcount".
   - Creates a new table within the tcount database titled "tweetwordcount".
**3a.  Alternatively, if you already have Postgres installed on your instance, then simply start the server through your own preferred means, clone my repository from Step 2 and proceed to Step 4. 
4. Change your directory using the following path (this assumes that you have cloned the 'W205-Spring-2017' repository from my github account from step 2).
        'cd W205-Spring-2017/Exercise_2'
5. Open the TwitterCredentials.py file and enter your own credentials. Save the file. 
6. Change your directory into the `extweetwordcount` directory and then enter the following at the command line:
        'sparse run'
7. Hit the "enter/return" button after the LEIN_ROOT prompt.
8. The Twitter Word Count application will then run to standard output.  To stop the process enter
   ctrl^c
9. If you encouter a massive glut of "Empty queue exceptions" in the output, compelete the following:
   - Stop the process with ctrl^c
   - Enter the following at the command line:
        kill `ps -ef | grep streamparse | grep -v grep | awk '{print $2}'`
	** This command will kill the current streamparse process, which resets the Twitter API feed. **
   - Restart the application by following steps 4-6.  
