#!/bin/bash

# Variables
SENDER="ubuntu@devopsproject.dev"
RECIPIENT="sulai4193@gmail.com"
SUBJECT="Test Email"
BODY_TEXT="This is a test email sent from a shell script using AWS CLI."
BODY_HTML="<html><body><h1>This is a test email</h1><p>Sent from a shell script using AWS CLI.</p></body></html>"

# Send email using AWS CLI
aws ses send-email \
  --from "$SENDER" \
  --destination "ToAddresses=$RECIPIENT" \
  --message "Subject={Data=$SUBJECT,Charset=utf-8},Body={Text={Data=$BODY_TEXT,Charset=utf-8},Html={Data=$BODY_HTML,Charset=utf-8}}"


# Check if the email was sent successfully
if [ $? -eq 0 ]; then
  echo "Email sent successfully!"
else
  echo "Failed to send email."
fi
