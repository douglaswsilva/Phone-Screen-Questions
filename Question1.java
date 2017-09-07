/***
1. Please use language you choose to solve this question 
 
    Write a class to run a thread and perform a function on the 59th second of every minute.  
    
    Print some value when function is run

    Please state any assumption you made in comment
 ***/


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;


class MyTimeTask extends TimerTask
{
    public void run()
    {
    		printCurrentTime();
    }
    
    public void printCurrentTime() {
	    DateFormat date = new SimpleDateFormat("hh:mm:ss");
	    Calendar calendar = Calendar.getInstance();
	    String currentTime = date.format(calendar.getTime());
	    System.out.println("Current time: " + currentTime);
    }
}

public class Question1 {

	public static void main(String[] args) {
	
	    DateFormat date = new SimpleDateFormat("ss");

	    Calendar calendar = Calendar.getInstance();
	    String currentTime = date.format(calendar.getTime());
	    int startsIn = 59 - Integer.parseInt(currentTime);
	    System.out.println("Thread starts in: " + startsIn + " seconds");
	    
		Timer timer = new Timer();
		int period = 60000;//60secs
		timer.schedule(new MyTimeTask(), startsIn * 1000, period);

	}
}


/***
 * I decided to create a TimerTask Thread, since the normal Thread library doesn't seem to automatically allow for scheduling. 
 * So, in order to get the function to print at the 59th second of every minute, I initially calculate how many seconds are left for the 59th second 
 * of the current minute, and then run the timer every 60 seconds after that. This way allows the function to be run and print the current time, at the 59th
 * second of every minute onwards. I hope I understood the question correctly and that the answer is in accordance with what the question wants.
 * ***/





