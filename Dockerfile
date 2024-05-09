FROM ubuntu:latest

# Install cron
RUN apt-get update && apt-get install -y cron

# Copy the update script into the container
COPY update_os.sh /home/enzo/update_os.sh

# Give execute permissions to the script
RUN chmod +x /home/enzo/update_os.sh

# Add cron job to run the script at the end of every month
RUN echo "0 0 28-31 * * /home/enzo/update_os.sh" > /etc/cron.d/update_os_cron

# Start cron service
CMD ["cron", "-f"]

