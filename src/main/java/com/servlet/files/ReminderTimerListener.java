package com.servlet.files;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebListener;
import java.util.Timer;
import java.util.TimerTask;

@WebListener
public class ReminderTimerListener implements ServletContextListener {

    private Timer timer;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Start the timer when the web app starts
        timer = new Timer(true); // true = daemon thread
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                ReminderScheduler.checkAndSendReminders();
            }
        }, 0, 24 * 60 * 60 * 1000); // Run every 24 hours
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Stop the timer when the web app stops
        if (timer != null) {
            timer.cancel();
        }
    }
}
