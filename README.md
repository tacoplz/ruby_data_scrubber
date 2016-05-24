# ruby_data_scrubber

Save the file in the desired folder.

Change the variable file_name to the name of the desired file before cleaning up initial data scrub.

Change the parameter in the web_page open method to the site you wish to scrub.

The string in output.puts prints the first line of the file. Change this to your desired header (I recommend column names for a double-colon separated file)

The first while loop has the regular expression to parse through the web page html the desired patterns. This can be modified based on the html formatting for the website and the data you wish to scrub. The puts statement uses the variables returned by the regular expression pattern matches.

The second while loop is optional but I used it to clean up my data a little further. The file2_name variable is the name of the file in which the cleaned data while be stored. The while loop uses regular expressions to take out undesired data that was returned for several lines in my initial scrub. I couldn't get the code to work correctly unless I cleaned up the original file using a second block and while loop.

To run the file you must have ruby installed on your machine. From the command line navigate ("cd") to the folder where you have saved the file. Type "ruby ruby_data_scrubber.rb" and your data should be saved within that directory (and in the chosen file) when the script completes.

Disclaimer: My variable names could use some work. The data from mountain project was only used for proof of concept.
